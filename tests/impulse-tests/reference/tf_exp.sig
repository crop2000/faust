ID_0 = float(fSamplingFreq);
ID_1 = max(1.0f, ID_0);
ID_2 = min(192000.0f, ID_1);
ID_3 = 3553.1412912100559f/ID_2;
ID_4 = tan(ID_3);
ID_5 = 1.0f/ID_4;
ID_6 = (ID_5+1.0000000000000002f);
ID_7 = ID_6/ID_4;
ID_8 = (ID_7+1.0f);
ID_9 = 1.0f/ID_8;
ID_10 = pow(ID_4, 2.0f);
ID_11 = 1.0f/ID_10;
ID_12 = (ID_5+1.0f);
ID_13 = (ID_4*ID_12);
ID_14 = 1.0f/ID_13;
ID_15 = (0.0f-ID_14);
ID_16 = 1';
ID_17 = 1-ID_16;
ID_18 = float(ID_17);
ID_19 = ID_18';
ID_20 = ID_15*ID_19;
ID_21 = 1.0f/ID_12;
ID_22 = (1.0f-ID_5);
ID_23 = W2;
ID_24 = proj0(ID_23);
ID_25 = ID_24';
ID_26 = ID_22*ID_25;
ID_27 = ID_5*ID_18;
ID_28 = (ID_26-ID_27);
ID_29 = ID_21*ID_28;
ID_30 = ID_20-ID_29;
ID_31 = letrec(W2 = (ID_30));
ID_32 = proj0(ID_31);
ID_33 = ID_32@0;
ID_34 = (ID_5+-1.0000000000000002f);
ID_35 = ID_34/ID_4;
ID_36 = (ID_35+1.0f);
ID_37 = W1;
ID_38 = proj0(ID_37);
ID_39 = (ID_38@2);
ID_40 = ID_36*ID_39;
ID_41 = (1.0f-ID_11);
ID_42 = 2.0f*ID_41;
ID_43 = ID_38';
ID_44 = ID_42*ID_43;
ID_45 = (ID_40+ID_44);
ID_46 = ID_9*ID_45;
ID_47 = ID_33-ID_46;
ID_48 = letrec(W1 = (ID_47));
ID_49 = proj0(ID_48);
ID_50 = (ID_49@0);
ID_51 = ID_11*ID_50;
ID_52 = 2.0f/ID_10;
ID_53 = (0.0f-ID_52);
ID_54 = ID_53*ID_43;
ID_55 = ID_51+ID_54;
ID_56 = ID_11*ID_39;
ID_57 = (ID_55+ID_56);
ID_58 = ID_9*ID_57;
ID_59 = 1776.5706456050279f/ID_2;
ID_60 = tan(ID_59);
ID_61 = 1.0f/ID_60;
ID_62 = (ID_61+1.0f);
ID_63 = ID_62/ID_60;
ID_64 = (ID_63+1.0f);
ID_65 = 1.0f/ID_64;
ID_66 = (1.0f-ID_61);
ID_67 = ID_66/ID_60;
ID_68 = (1.0f-ID_67);
ID_69 = W0;
ID_70 = proj0(ID_69);
ID_71 = (ID_70@2);
ID_72 = ID_68*ID_71;
ID_73 = pow(ID_60, 2.0f);
ID_74 = 1.0f/ID_73;
ID_75 = (1.0f-ID_74);
ID_76 = 2.0f*ID_75;
ID_77 = ID_70';
ID_78 = ID_76*ID_77;
ID_79 = (ID_72+ID_78);
ID_80 = ID_65*ID_79;
ID_81 = ID_58-ID_80;
ID_82 = letrec(W0 = (ID_81));
ID_83 = proj0(ID_82);
ID_84 = ID_83@2;
ID_85 = (ID_83@0);
ID_86 = ID_68*ID_85;
ID_87 = (ID_78+ID_86);
ID_88 = ID_65*ID_87;
ID_89 = ID_84+ID_88;
ID_90 = (ID_61+1.0000000000000002f);
ID_91 = ID_90/ID_60;
ID_92 = (ID_91+1.0f);
ID_93 = 1.0f/ID_92;
ID_94 = (ID_60*ID_62);
ID_95 = 1.0f/ID_94;
ID_96 = W6;
ID_97 = proj0(ID_96);
ID_98 = ID_97';
ID_99 = ID_22*ID_98;
ID_100 = (ID_18+ID_19);
ID_101 = (ID_99-ID_100);
ID_102 = ID_21*ID_101;
ID_103 = 0.0f-ID_102;
ID_104 = letrec(W6 = (ID_103));
ID_105 = proj0(ID_104);
ID_106 = ID_105@0;
ID_107 = W5;
ID_108 = proj0(ID_107);
ID_109 = (ID_108@2);
ID_110 = ID_36*ID_109;
ID_111 = ID_108';
ID_112 = ID_42*ID_111;
ID_113 = (ID_110+ID_112);
ID_114 = ID_9*ID_113;
ID_115 = ID_106-ID_114;
ID_116 = letrec(W5 = (ID_115));
ID_117 = proj0(ID_116);
ID_118 = ID_117@2;
ID_119 = ID_117@0;
ID_120 = 2.0f*ID_111;
ID_121 = ID_119+ID_120;
ID_122 = (ID_118+ID_121);
ID_123 = ID_95*ID_122;
ID_124 = (0.0f-ID_95);
ID_125 = ID_122';
ID_126 = ID_124*ID_125;
ID_127 = (ID_123+ID_126);
ID_128 = ID_9*ID_127;
ID_129 = ID_66/ID_62;
ID_130 = W4;
ID_131 = proj0(ID_130);
ID_132 = ID_131';
ID_133 = ID_129*ID_132;
ID_134 = ID_128-ID_133;
ID_135 = letrec(W4 = (ID_134));
ID_136 = proj0(ID_135);
ID_137 = ID_136@0;
ID_138 = (ID_61+-1.0000000000000002f);
ID_139 = ID_138/ID_60;
ID_140 = (ID_139+1.0f);
ID_141 = W3;
ID_142 = proj0(ID_141);
ID_143 = (ID_142@2);
ID_144 = ID_140*ID_143;
ID_145 = ID_142';
ID_146 = ID_76*ID_145;
ID_147 = (ID_144+ID_146);
ID_148 = ID_93*ID_147;
ID_149 = ID_137-ID_148;
ID_150 = letrec(W3 = (ID_149));
ID_151 = proj0(ID_150);
ID_152 = (ID_151@0);
ID_153 = ID_74*ID_152;
ID_154 = 2.0f/ID_73;
ID_155 = (0.0f-ID_154);
ID_156 = ID_155*ID_145;
ID_157 = ID_153+ID_156;
ID_158 = ID_74*ID_143;
ID_159 = ID_157+ID_158;
ID_160 = 1.0f/ID_62;
ID_161 = W8;
ID_162 = proj0(ID_161);
ID_163 = ID_162';
ID_164 = ID_66*ID_163;
ID_165 = (ID_122+ID_125);
ID_166 = ID_9*ID_165;
ID_167 = (ID_164-ID_166);
ID_168 = ID_160*ID_167;
ID_169 = 0.0f-ID_168;
ID_170 = letrec(W8 = (ID_169));
ID_171 = proj0(ID_170);
ID_172 = ID_171@0;
ID_173 = W7;
ID_174 = proj0(ID_173);
ID_175 = (ID_174@2);
ID_176 = ID_140*ID_175;
ID_177 = ID_174';
ID_178 = ID_76*ID_177;
ID_179 = (ID_176+ID_178);
ID_180 = ID_93*ID_179;
ID_181 = ID_172-ID_180;
ID_182 = letrec(W7 = (ID_181));
ID_183 = proj0(ID_182);
ID_184 = ID_183@2;
ID_185 = ID_183@0;
ID_186 = 2.0f*ID_177;
ID_187 = ID_185+ID_186;
ID_188 = ID_184+ID_187;
ID_189 = (ID_159+ID_188);
ID_190 = ID_93*ID_189;
ID_191 = ID_89+ID_190;
SIG = (ID_191);