"""
 FAUST Architecture File
 Copyright (C) 2023 GRAME, Centre National de Creation Musicale
 ---------------------------------------------------------------------
 This Architecture section is free software; you can redistribute it
 and/or modify it under the terms of the GNU Lesser General Public
 License as published by the Free Software Foundation; either version 3
 of the License, or (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU Lesser General Public License for more details.
 
 You should have received a copy of the GNU Lesser General Public License
 along with this program; If not, see <http://www.gnu.org/licenses/>.
 
 EXCEPTION : As a special exception, you may create a larger work
 that contains this FAUST architecture section and distribute
 that work under terms of your choice, so long as this FAUST
 architecture section is not modified.
"""

"""
Take the DSP name, the DSP compiled as codebox file, the JSON file, and the maxpat output file name. Codebox code will be added in the codebox~ object.
Parsing the JSON file gives:
    - the list of parameters (button, checkbox, sliders, nentry) to be added as "set param" objects
    - the number of audio inputs/outputs to be added in the subpatch
The maxpat file is generated with the following structure: 
    - rnbo~ object
        - subpatch
            - codebox~ object
            - input boxes
            - output boxes
            - parameter boxes
            - lines between boxes
    - ezdac~ object
"""

from py2max.py2max import *
import argparse
import json


# Extracting items info
def extract_items_info(json_data):
    def extract_from_ui(ui_items):
        info_list = []
        for item in ui_items:
            shortname = item.get("shortname", "")
            item_type = item.get("type", "")

            # button and checkbox
            if item_type in ["button", "checkbox"]:
                info_list.append(
                    {
                        "shortname": shortname,
                        "type": item_type,
                        "init": 0,
                        "min": 0,
                        "max": 1,
                        "step": 1,
                    }
                )
            # slider and nentry
            elif "min" in item and "max" in item and "step" in item:
                init_value = item.get("init", 0)
                min_value = item["min"]
                max_value = item["max"]
                step_value = item["step"]
                info_list.append(
                    {
                        "shortname": shortname,
                        "type": item_type,
                        "init": init_value,
                        "min": min_value,
                        "max": max_value,
                        "step": step_value,
                    }
                )

            # possibly recurse
            if "items" in item:
                info_list.extend(extract_from_ui(item["items"]))
        return info_list

    # Extracting items info from the "ui" section
    if "ui" in json_data:
        ui_section = json_data["ui"]
        return extract_from_ui(ui_section)
    return []


def create_rnbo_patch(
    maxpat_path, dsp_name, codebox_code, items_info_list, num_inputs, num_outputs
):
    # Create the patcher
    patcher = Patcher(maxpat_path)

    # Faust generated patch
    patcher.add_comment(
        "Faust generated RNBO patch, Copyright (c) 2023 Grame",
        patching_rect=[50.0, 20.0, 250.0, 50.0],
    )

    # Add the audio driver output
    audio_out = patcher.add_textbox("ezdac~", patching_rect=[50.0, 100.0, 50.0, 50.0])
    sbox = patcher.add_rnbo(
        saved_object_attributes=dict(optimization="O3", title=dsp_name),
        patching_rect=[50.0, 60.0, 50.0, 50.0],
    )

    # Create the subpatcher
    sp = sbox.subpatcher

    # Create codebox~ section
    codebox = sp.add_codebox_tilde(
        code=codebox_code, patching_rect=[200.0, 200.0, 400.0, 400.0]
    )

    # Generating the lines of code for inputs
    for i in range(num_inputs):
        input_box = sp.add_textbox(f"in~ {i + 1}")
        sp.add_line(input_box, codebox, inlet=i)

    # Generating the lines of code for outputs
    for i in range(num_outputs):
        output_box = sp.add_textbox(f"out~ {i + 1}")
        sp.add_line(codebox, output_box, outlet=i)

    # Add parameter control
    for item in items_info_list:
        shortname = item["shortname"]
        item_type = item["type"]

        param = sp.add_textbox(f"set {shortname}")
        # param = sp.add_textbox(f'param~ {shortname} @minimum {min_value} @maximum {max_value}')

        if item_type in ["button", "checkbox"]:
            value = sp.add_textbox(
                "toggle",
                patching_rect=[
                    param.patching_rect[0],
                    param.patching_rect[1] - 25,
                    24.0,
                    24.0,
                ],
            )
        else:
            min_value = item["min"]
            max_value = item["max"]
            init_value = item["init"]
            value = sp.add_textbox(
                "number~",
                mode=1,
                sig=init_value,
                minimum=min_value,
                maximum=max_value,
                patching_rect=[
                    param.patching_rect[0],
                    param.patching_rect[1] - 25,
                    param.patching_rect[2],
                    param.patching_rect[3],
                ],
            )
        sp.add_line(value, param)
        sp.add_line(param, codebox)

    # And finally save the patch
    patcher.save()


# Generate RNBO patch
def gen_faust_rnbo(dsp_name, codebox_path, json_path, maxpat_path):
    with open(codebox_path) as codebox_file:
        codebox_code = codebox_file.read()

    with open(json_path) as json_file:
        json_data = json.load(json_file)
        items_info_list = extract_items_info(json_data)
        num_inputs = json_data.get("inputs", 0)
        num_outputs = json_data.get("outputs", 0)

    create_rnbo_patch(
        maxpat_path, dsp_name, codebox_code, items_info_list, num_inputs, num_outputs
    )


# Parse command line
if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("arg1", type=str, help="DSP name")
    parser.add_argument("arg2", type=str, help="Codebox file")
    parser.add_argument("arg3", type=str, help="JSON file")
    parser.add_argument("arg4", type=str, help="RNBO maxpat file")
    args = parser.parse_args()

    gen_faust_rnbo(args.arg1, args.arg2, args.arg3, args.arg4)