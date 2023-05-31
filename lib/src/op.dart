typedef Op = int;
typedef OpKind = int;

const OpKind KIND_END = 1000;
const OpKind KIND_LITERAL = 1001;
const OpKind KIND_SIGNATURE = 1002;
const OpKind KIND_COPY = 1003;
const OpKind KIND_CHECKSUM = 1004;
const OpKind KIND_RESERVED = 1005;

class Command {
  final OpKind kind;
  final int immediate;
  final int len1;
  final int len2;

  Command(this.kind, this.immediate, this.len1, this.len2);
}

const Op OP_END = 0;
const Op OP_LITERAL_1 = 1;
const Op OP_LITERAL_2 = 2;
const Op OP_LITERAL_3 = 3;
const Op OP_LITERAL_4 = 4;
const Op OP_LITERAL_5 = 5;
const Op OP_LITERAL_6 = 6;
const Op OP_LITERAL_7 = 7;
const Op OP_LITERAL_8 = 8;
const Op OP_LITERAL_9 = 9;
const Op OP_LITERAL_10 = 10;
const Op OP_LITERAL_11 = 11;
const Op OP_LITERAL_12 = 12;
const Op OP_LITERAL_13 = 13;
const Op OP_LITERAL_14 = 14;
const Op OP_LITERAL_15 = 15;
const Op OP_LITERAL_16 = 16;
const Op OP_LITERAL_17 = 17;
const Op OP_LITERAL_18 = 18;
const Op OP_LITERAL_19 = 19;
const Op OP_LITERAL_20 = 20;
const Op OP_LITERAL_21 = 21;
const Op OP_LITERAL_22 = 22;
const Op OP_LITERAL_23 = 23;
const Op OP_LITERAL_24 = 24;
const Op OP_LITERAL_25 = 25;
const Op OP_LITERAL_26 = 26;
const Op OP_LITERAL_27 = 27;
const Op OP_LITERAL_28 = 28;
const Op OP_LITERAL_29 = 29;
const Op OP_LITERAL_30 = 30;
const Op OP_LITERAL_31 = 31;
const Op OP_LITERAL_32 = 32;
const Op OP_LITERAL_33 = 33;
const Op OP_LITERAL_34 = 34;
const Op OP_LITERAL_35 = 35;
const Op OP_LITERAL_36 = 36;
const Op OP_LITERAL_37 = 37;
const Op OP_LITERAL_38 = 38;
const Op OP_LITERAL_39 = 39;
const Op OP_LITERAL_40 = 40;
const Op OP_LITERAL_41 = 41;
const Op OP_LITERAL_42 = 42;
const Op OP_LITERAL_43 = 43;
const Op OP_LITERAL_44 = 44;
const Op OP_LITERAL_45 = 45;
const Op OP_LITERAL_46 = 46;
const Op OP_LITERAL_47 = 47;
const Op OP_LITERAL_48 = 48;
const Op OP_LITERAL_49 = 49;
const Op OP_LITERAL_50 = 50;
const Op OP_LITERAL_51 = 51;
const Op OP_LITERAL_52 = 52;
const Op OP_LITERAL_53 = 53;
const Op OP_LITERAL_54 = 54;
const Op OP_LITERAL_55 = 55;
const Op OP_LITERAL_56 = 56;
const Op OP_LITERAL_57 = 57;
const Op OP_LITERAL_58 = 58;
const Op OP_LITERAL_59 = 59;
const Op OP_LITERAL_60 = 60;
const Op OP_LITERAL_61 = 61;
const Op OP_LITERAL_62 = 62;
const Op OP_LITERAL_63 = 63;
const Op OP_LITERAL_64 = 64;
const Op OP_LITERAL_N1 = 65;
const Op OP_LITERAL_N2 = 66;
const Op OP_LITERAL_N4 = 67;
const Op OP_LITERAL_N8 = 68;
const Op OP_COPY_N1_N1 = 69;
const Op OP_COPY_N1_N2 = 70;
const Op OP_COPY_N1_N4 = 71;
const Op OP_COPY_N1_N8 = 72;
const Op OP_COPY_N2_N1 = 73;
const Op OP_COPY_N2_N2 = 74;
const Op OP_COPY_N2_N4 = 75;
const Op OP_COPY_N2_N8 = 76;
const Op OP_COPY_N4_N1 = 77;
const Op OP_COPY_N4_N2 = 78;
const Op OP_COPY_N4_N4 = 79;
const Op OP_COPY_N4_N8 = 80;
const Op OP_COPY_N8_N1 = 81;
const Op OP_COPY_N8_N2 = 82;
const Op OP_COPY_N8_N4 = 83;
const Op OP_COPY_N8_N8 = 84;
const Op OP_RESERVED_85 = 85;
const Op OP_RESERVED_86 = 86;
const Op OP_RESERVED_87 = 87;
const Op OP_RESERVED_88 = 88;
const Op OP_RESERVED_89 = 89;
const Op OP_RESERVED_90 = 90;
const Op OP_RESERVED_91 = 91;
const Op OP_RESERVED_92 = 92;
const Op OP_RESERVED_93 = 93;
const Op OP_RESERVED_94 = 94;
const Op OP_RESERVED_95 = 95;
const Op OP_RESERVED_96 = 96;
const Op OP_RESERVED_97 = 97;
const Op OP_RESERVED_98 = 98;
const Op OP_RESERVED_99 = 99;
const Op OP_RESERVED_100 = 100;
const Op OP_RESERVED_101 = 101;
const Op OP_RESERVED_102 = 102;
const Op OP_RESERVED_103 = 103;
const Op OP_RESERVED_104 = 104;
const Op OP_RESERVED_105 = 105;
const Op OP_RESERVED_106 = 106;
const Op OP_RESERVED_107 = 107;
const Op OP_RESERVED_108 = 108;
const Op OP_RESERVED_109 = 109;
const Op OP_RESERVED_110 = 110;
const Op OP_RESERVED_111 = 111;
const Op OP_RESERVED_112 = 112;
const Op OP_RESERVED_113 = 113;
const Op OP_RESERVED_114 = 114;
const Op OP_RESERVED_115 = 115;
const Op OP_RESERVED_116 = 116;
const Op OP_RESERVED_117 = 117;
const Op OP_RESERVED_118 = 118;
const Op OP_RESERVED_119 = 119;
const Op OP_RESERVED_120 = 120;
const Op OP_RESERVED_121 = 121;
const Op OP_RESERVED_122 = 122;
const Op OP_RESERVED_123 = 123;
const Op OP_RESERVED_124 = 124;
const Op OP_RESERVED_125 = 125;
const Op OP_RESERVED_126 = 126;
const Op OP_RESERVED_127 = 127;
const Op OP_RESERVED_128 = 128;
const Op OP_RESERVED_129 = 129;
const Op OP_RESERVED_130 = 130;
const Op OP_RESERVED_131 = 131;
const Op OP_RESERVED_132 = 132;
const Op OP_RESERVED_133 = 133;
const Op OP_RESERVED_134 = 134;
const Op OP_RESERVED_135 = 135;
const Op OP_RESERVED_136 = 136;
const Op OP_RESERVED_137 = 137;
const Op OP_RESERVED_138 = 138;
const Op OP_RESERVED_139 = 139;
const Op OP_RESERVED_140 = 140;
const Op OP_RESERVED_141 = 141;
const Op OP_RESERVED_142 = 142;
const Op OP_RESERVED_143 = 143;
const Op OP_RESERVED_144 = 144;
const Op OP_RESERVED_145 = 145;
const Op OP_RESERVED_146 = 146;
const Op OP_RESERVED_147 = 147;
const Op OP_RESERVED_148 = 148;
const Op OP_RESERVED_149 = 149;
const Op OP_RESERVED_150 = 150;
const Op OP_RESERVED_151 = 151;
const Op OP_RESERVED_152 = 152;
const Op OP_RESERVED_153 = 153;
const Op OP_RESERVED_154 = 154;
const Op OP_RESERVED_155 = 155;
const Op OP_RESERVED_156 = 156;
const Op OP_RESERVED_157 = 157;
const Op OP_RESERVED_158 = 158;
const Op OP_RESERVED_159 = 159;
const Op OP_RESERVED_160 = 160;
const Op OP_RESERVED_161 = 161;
const Op OP_RESERVED_162 = 162;
const Op OP_RESERVED_163 = 163;
const Op OP_RESERVED_164 = 164;
const Op OP_RESERVED_165 = 165;
const Op OP_RESERVED_166 = 166;
const Op OP_RESERVED_167 = 167;
const Op OP_RESERVED_168 = 168;
const Op OP_RESERVED_169 = 169;
const Op OP_RESERVED_170 = 170;
const Op OP_RESERVED_171 = 171;
const Op OP_RESERVED_172 = 172;
const Op OP_RESERVED_173 = 173;
const Op OP_RESERVED_174 = 174;
const Op OP_RESERVED_175 = 175;
const Op OP_RESERVED_176 = 176;
const Op OP_RESERVED_177 = 177;
const Op OP_RESERVED_178 = 178;
const Op OP_RESERVED_179 = 179;
const Op OP_RESERVED_180 = 180;
const Op OP_RESERVED_181 = 181;
const Op OP_RESERVED_182 = 182;
const Op OP_RESERVED_183 = 183;
const Op OP_RESERVED_184 = 184;
const Op OP_RESERVED_185 = 185;
const Op OP_RESERVED_186 = 186;
const Op OP_RESERVED_187 = 187;
const Op OP_RESERVED_188 = 188;
const Op OP_RESERVED_189 = 189;
const Op OP_RESERVED_190 = 190;
const Op OP_RESERVED_191 = 191;
const Op OP_RESERVED_192 = 192;
const Op OP_RESERVED_193 = 193;
const Op OP_RESERVED_194 = 194;
const Op OP_RESERVED_195 = 195;
const Op OP_RESERVED_196 = 196;
const Op OP_RESERVED_197 = 197;
const Op OP_RESERVED_198 = 198;
const Op OP_RESERVED_199 = 199;
const Op OP_RESERVED_200 = 200;
const Op OP_RESERVED_201 = 201;
const Op OP_RESERVED_202 = 202;
const Op OP_RESERVED_203 = 203;
const Op OP_RESERVED_204 = 204;
const Op OP_RESERVED_205 = 205;
const Op OP_RESERVED_206 = 206;
const Op OP_RESERVED_207 = 207;
const Op OP_RESERVED_208 = 208;
const Op OP_RESERVED_209 = 209;
const Op OP_RESERVED_210 = 210;
const Op OP_RESERVED_211 = 211;
const Op OP_RESERVED_212 = 212;
const Op OP_RESERVED_213 = 213;
const Op OP_RESERVED_214 = 214;
const Op OP_RESERVED_215 = 215;
const Op OP_RESERVED_216 = 216;
const Op OP_RESERVED_217 = 217;
const Op OP_RESERVED_218 = 218;
const Op OP_RESERVED_219 = 219;
const Op OP_RESERVED_220 = 220;
const Op OP_RESERVED_221 = 221;
const Op OP_RESERVED_222 = 222;
const Op OP_RESERVED_223 = 223;
const Op OP_RESERVED_224 = 224;
const Op OP_RESERVED_225 = 225;
const Op OP_RESERVED_226 = 226;
const Op OP_RESERVED_227 = 227;
const Op OP_RESERVED_228 = 228;
const Op OP_RESERVED_229 = 229;
const Op OP_RESERVED_230 = 230;
const Op OP_RESERVED_231 = 231;
const Op OP_RESERVED_232 = 232;
const Op OP_RESERVED_233 = 233;
const Op OP_RESERVED_234 = 234;
const Op OP_RESERVED_235 = 235;
const Op OP_RESERVED_236 = 236;
const Op OP_RESERVED_237 = 237;
const Op OP_RESERVED_238 = 238;
const Op OP_RESERVED_239 = 239;
const Op OP_RESERVED_240 = 240;
const Op OP_RESERVED_241 = 241;
const Op OP_RESERVED_242 = 242;
const Op OP_RESERVED_243 = 243;
const Op OP_RESERVED_244 = 244;
const Op OP_RESERVED_245 = 245;
const Op OP_RESERVED_246 = 246;
const Op OP_RESERVED_247 = 247;
const Op OP_RESERVED_248 = 248;
const Op OP_RESERVED_249 = 249;
const Op OP_RESERVED_250 = 250;
const Op OP_RESERVED_251 = 251;
const Op OP_RESERVED_252 = 252;
const Op OP_RESERVED_253 = 253;
const Op OP_RESERVED_254 = 254;
const Op OP_RESERVED_255 = 255;

var op2cmd = <Command>[
  /*            OP_END =    0 */
  Command(KIND_END, 0, 0, 0),
  /*      OP_LITERAL_1 =  0x1 */
  Command(KIND_LITERAL, 1, 0, 0),
  /*      OP_LITERAL_2 =  0x2 */
  Command(KIND_LITERAL, 2, 0, 0),
  /*      OP_LITERAL_3 =  0x3 */
  Command(KIND_LITERAL, 3, 0, 0),
  /*      OP_LITERAL_4 =  0x4 */
  Command(KIND_LITERAL, 4, 0, 0),
  /*      OP_LITERAL_5 =  0x5 */
  Command(KIND_LITERAL, 5, 0, 0),
  /*      OP_LITERAL_6 =  0x6 */
  Command(KIND_LITERAL, 6, 0, 0),
  /*      OP_LITERAL_7 =  0x7 */
  Command(KIND_LITERAL, 7, 0, 0),
  /*      OP_LITERAL_8 =  0x8 */
  Command(KIND_LITERAL, 8, 0, 0),
  /*      OP_LITERAL_9 =  0x9 */
  Command(KIND_LITERAL, 9, 0, 0),
  /*     OP_LITERAL_10 =  0xa */
  Command(KIND_LITERAL, 10, 0, 0),
  /*     OP_LITERAL_11 =  0xb */
  Command(KIND_LITERAL, 11, 0, 0),
  /*     OP_LITERAL_12 =  0xc */
  Command(KIND_LITERAL, 12, 0, 0),
  /*     OP_LITERAL_13 =  0xd */
  Command(KIND_LITERAL, 13, 0, 0),
  /*     OP_LITERAL_14 =  0xe */
  Command(KIND_LITERAL, 14, 0, 0),
  /*     OP_LITERAL_15 =  0xf */
  Command(KIND_LITERAL, 15, 0, 0),
  /*     OP_LITERAL_16 = 0x10 */
  Command(KIND_LITERAL, 16, 0, 0),
  /*     OP_LITERAL_17 = 0x11 */
  Command(KIND_LITERAL, 17, 0, 0),
  /*     OP_LITERAL_18 = 0x12 */
  Command(KIND_LITERAL, 18, 0, 0),
  /*     OP_LITERAL_19 = 0x13 */
  Command(KIND_LITERAL, 19, 0, 0),
  /*     OP_LITERAL_20 = 0x14 */
  Command(KIND_LITERAL, 20, 0, 0),
  /*     OP_LITERAL_21 = 0x15 */
  Command(KIND_LITERAL, 21, 0, 0),
  /*     OP_LITERAL_22 = 0x16 */
  Command(KIND_LITERAL, 22, 0, 0),
  /*     OP_LITERAL_23 = 0x17 */
  Command(KIND_LITERAL, 23, 0, 0),
  /*     OP_LITERAL_24 = 0x18 */
  Command(KIND_LITERAL, 24, 0, 0),
  /*     OP_LITERAL_25 = 0x19 */
  Command(KIND_LITERAL, 25, 0, 0),
  /*     OP_LITERAL_26 = 0x1a */
  Command(KIND_LITERAL, 26, 0, 0),
  /*     OP_LITERAL_27 = 0x1b */
  Command(KIND_LITERAL, 27, 0, 0),
  /*     OP_LITERAL_28 = 0x1c */
  Command(KIND_LITERAL, 28, 0, 0),
  /*     OP_LITERAL_29 = 0x1d */
  Command(KIND_LITERAL, 29, 0, 0),
  /*     OP_LITERAL_30 = 0x1e */
  Command(KIND_LITERAL, 30, 0, 0),
  /*     OP_LITERAL_31 = 0x1f */
  Command(KIND_LITERAL, 31, 0, 0),
  /*     OP_LITERAL_32 = 0x20 */
  Command(KIND_LITERAL, 32, 0, 0),
  /*     OP_LITERAL_33 = 0x21 */
  Command(KIND_LITERAL, 33, 0, 0),
  /*     OP_LITERAL_34 = 0x22 */
  Command(KIND_LITERAL, 34, 0, 0),
  /*     OP_LITERAL_35 = 0x23 */
  Command(KIND_LITERAL, 35, 0, 0),
  /*     OP_LITERAL_36 = 0x24 */
  Command(KIND_LITERAL, 36, 0, 0),
  /*     OP_LITERAL_37 = 0x25 */
  Command(KIND_LITERAL, 37, 0, 0),
  /*     OP_LITERAL_38 = 0x26 */
  Command(KIND_LITERAL, 38, 0, 0),
  /*     OP_LITERAL_39 = 0x27 */
  Command(KIND_LITERAL, 39, 0, 0),
  /*     OP_LITERAL_40 = 0x28 */
  Command(KIND_LITERAL, 40, 0, 0),
  /*     OP_LITERAL_41 = 0x29 */
  Command(KIND_LITERAL, 41, 0, 0),
  /*     OP_LITERAL_42 = 0x2a */
  Command(KIND_LITERAL, 42, 0, 0),
  /*     OP_LITERAL_43 = 0x2b */
  Command(KIND_LITERAL, 43, 0, 0),
  /*     OP_LITERAL_44 = 0x2c */
  Command(KIND_LITERAL, 44, 0, 0),
  /*     OP_LITERAL_45 = 0x2d */
  Command(KIND_LITERAL, 45, 0, 0),
  /*     OP_LITERAL_46 = 0x2e */
  Command(KIND_LITERAL, 46, 0, 0),
  /*     OP_LITERAL_47 = 0x2f */
  Command(KIND_LITERAL, 47, 0, 0),
  /*     OP_LITERAL_48 = 0x30 */
  Command(KIND_LITERAL, 48, 0, 0),
  /*     OP_LITERAL_49 = 0x31 */
  Command(KIND_LITERAL, 49, 0, 0),
  /*     OP_LITERAL_50 = 0x32 */
  Command(KIND_LITERAL, 50, 0, 0),
  /*     OP_LITERAL_51 = 0x33 */
  Command(KIND_LITERAL, 51, 0, 0),
  /*     OP_LITERAL_52 = 0x34 */
  Command(KIND_LITERAL, 52, 0, 0),
  /*     OP_LITERAL_53 = 0x35 */
  Command(KIND_LITERAL, 53, 0, 0),
  /*     OP_LITERAL_54 = 0x36 */
  Command(KIND_LITERAL, 54, 0, 0),
  /*     OP_LITERAL_55 = 0x37 */
  Command(KIND_LITERAL, 55, 0, 0),
  /*     OP_LITERAL_56 = 0x38 */
  Command(KIND_LITERAL, 56, 0, 0),
  /*     OP_LITERAL_57 = 0x39 */
  Command(KIND_LITERAL, 57, 0, 0),
  /*     OP_LITERAL_58 = 0x3a */
  Command(KIND_LITERAL, 58, 0, 0),
  /*     OP_LITERAL_59 = 0x3b */
  Command(KIND_LITERAL, 59, 0, 0),
  /*     OP_LITERAL_60 = 0x3c */
  Command(KIND_LITERAL, 60, 0, 0),
  /*     OP_LITERAL_61 = 0x3d */
  Command(KIND_LITERAL, 61, 0, 0),
  /*     OP_LITERAL_62 = 0x3e */
  Command(KIND_LITERAL, 62, 0, 0),
  /*     OP_LITERAL_63 = 0x3f */
  Command(KIND_LITERAL, 63, 0, 0),
  /*     OP_LITERAL_64 = 0x40 */
  Command(KIND_LITERAL, 64, 0, 0),
  /*     OP_LITERAL_N1 = 0x41 */
  Command(KIND_LITERAL, 0, 1, 0),
  /*     OP_LITERAL_N2 = 0x42 */
  Command(KIND_LITERAL, 0, 2, 0),
  /*     OP_LITERAL_N4 = 0x43 */
  Command(KIND_LITERAL, 0, 4, 0),
  /*     OP_LITERAL_N8 = 0x44 */
  Command(KIND_LITERAL, 0, 8, 0),
  /*     OP_COPY_N1_N1 = 0x45 */
  Command(KIND_COPY, 0, 1, 1),
  /*     OP_COPY_N1_N2 = 0x46 */
  Command(KIND_COPY, 0, 1, 2),
  /*     OP_COPY_N1_N4 = 0x47 */
  Command(KIND_COPY, 0, 1, 4),
  /*     OP_COPY_N1_N8 = 0x48 */
  Command(KIND_COPY, 0, 1, 8),
  /*     OP_COPY_N2_N1 = 0x49 */
  Command(KIND_COPY, 0, 2, 1),
  /*     OP_COPY_N2_N2 = 0x4a */
  Command(KIND_COPY, 0, 2, 2),
  /*     OP_COPY_N2_N4 = 0x4b */
  Command(KIND_COPY, 0, 2, 4),
  /*     OP_COPY_N2_N8 = 0x4c */
  Command(KIND_COPY, 0, 2, 8),
  /*     OP_COPY_N4_N1 = 0x4d */
  Command(KIND_COPY, 0, 4, 1),
  /*     OP_COPY_N4_N2 = 0x4e */
  Command(KIND_COPY, 0, 4, 2),
  /*     OP_COPY_N4_N4 = 0x4f */
  Command(KIND_COPY, 0, 4, 4),
  /*     OP_COPY_N4_N8 = 0x50 */
  Command(KIND_COPY, 0, 4, 8),
  /*     OP_COPY_N8_N1 = 0x51 */
  Command(KIND_COPY, 0, 8, 1),
  /*     OP_COPY_N8_N2 = 0x52 */
  Command(KIND_COPY, 0, 8, 2),
  /*     OP_COPY_N8_N4 = 0x53 */
  Command(KIND_COPY, 0, 8, 4),
  /*     OP_COPY_N8_N8 = 0x54 */
  Command(KIND_COPY, 0, 8, 8),
  /*    OP_RESERVED_85 = 0x55 */
  Command(KIND_RESERVED, 85, 0, 0),
  /*    OP_RESERVED_86 = 0x56 */
  Command(KIND_RESERVED, 86, 0, 0),
  /*    OP_RESERVED_87 = 0x57 */
  Command(KIND_RESERVED, 87, 0, 0),
  /*    OP_RESERVED_88 = 0x58 */
  Command(KIND_RESERVED, 88, 0, 0),
  /*    OP_RESERVED_89 = 0x59 */
  Command(KIND_RESERVED, 89, 0, 0),
  /*    OP_RESERVED_90 = 0x5a */
  Command(KIND_RESERVED, 90, 0, 0),
  /*    OP_RESERVED_91 = 0x5b */
  Command(KIND_RESERVED, 91, 0, 0),
  /*    OP_RESERVED_92 = 0x5c */
  Command(KIND_RESERVED, 92, 0, 0),
  /*    OP_RESERVED_93 = 0x5d */
  Command(KIND_RESERVED, 93, 0, 0),
  /*    OP_RESERVED_94 = 0x5e */
  Command(KIND_RESERVED, 94, 0, 0),
  /*    OP_RESERVED_95 = 0x5f */
  Command(KIND_RESERVED, 95, 0, 0),
  /*    OP_RESERVED_96 = 0x60 */
  Command(KIND_RESERVED, 96, 0, 0),
  /*    OP_RESERVED_97 = 0x61 */
  Command(KIND_RESERVED, 97, 0, 0),
  /*    OP_RESERVED_98 = 0x62 */
  Command(KIND_RESERVED, 98, 0, 0),
  /*    OP_RESERVED_99 = 0x63 */
  Command(KIND_RESERVED, 99, 0, 0),
  /*   OP_RESERVED_100 = 0x64 */
  Command(KIND_RESERVED, 100, 0, 0),
  /*   OP_RESERVED_101 = 0x65 */
  Command(KIND_RESERVED, 101, 0, 0),
  /*   OP_RESERVED_102 = 0x66 */
  Command(KIND_RESERVED, 102, 0, 0),
  /*   OP_RESERVED_103 = 0x67 */
  Command(KIND_RESERVED, 103, 0, 0),
  /*   OP_RESERVED_104 = 0x68 */
  Command(KIND_RESERVED, 104, 0, 0),
  /*   OP_RESERVED_105 = 0x69 */
  Command(KIND_RESERVED, 105, 0, 0),
  /*   OP_RESERVED_106 = 0x6a */
  Command(KIND_RESERVED, 106, 0, 0),
  /*   OP_RESERVED_107 = 0x6b */
  Command(KIND_RESERVED, 107, 0, 0),
  /*   OP_RESERVED_108 = 0x6c */
  Command(KIND_RESERVED, 108, 0, 0),
  /*   OP_RESERVED_109 = 0x6d */
  Command(KIND_RESERVED, 109, 0, 0),
  /*   OP_RESERVED_110 = 0x6e */
  Command(KIND_RESERVED, 110, 0, 0),
  /*   OP_RESERVED_111 = 0x6f */
  Command(KIND_RESERVED, 111, 0, 0),
  /*   OP_RESERVED_112 = 0x70 */
  Command(KIND_RESERVED, 112, 0, 0),
  /*   OP_RESERVED_113 = 0x71 */
  Command(KIND_RESERVED, 113, 0, 0),
  /*   OP_RESERVED_114 = 0x72 */
  Command(KIND_RESERVED, 114, 0, 0),
  /*   OP_RESERVED_115 = 0x73 */
  Command(KIND_RESERVED, 115, 0, 0),
  /*   OP_RESERVED_116 = 0x74 */
  Command(KIND_RESERVED, 116, 0, 0),
  /*   OP_RESERVED_117 = 0x75 */
  Command(KIND_RESERVED, 117, 0, 0),
  /*   OP_RESERVED_118 = 0x76 */
  Command(KIND_RESERVED, 118, 0, 0),
  /*   OP_RESERVED_119 = 0x77 */
  Command(KIND_RESERVED, 119, 0, 0),
  /*   OP_RESERVED_120 = 0x78 */
  Command(KIND_RESERVED, 120, 0, 0),
  /*   OP_RESERVED_121 = 0x79 */
  Command(KIND_RESERVED, 121, 0, 0),
  /*   OP_RESERVED_122 = 0x7a */
  Command(KIND_RESERVED, 122, 0, 0),
  /*   OP_RESERVED_123 = 0x7b */
  Command(KIND_RESERVED, 123, 0, 0),
  /*   OP_RESERVED_124 = 0x7c */
  Command(KIND_RESERVED, 124, 0, 0),
  /*   OP_RESERVED_125 = 0x7d */
  Command(KIND_RESERVED, 125, 0, 0),
  /*   OP_RESERVED_126 = 0x7e */
  Command(KIND_RESERVED, 126, 0, 0),
  /*   OP_RESERVED_127 = 0x7f */
  Command(KIND_RESERVED, 127, 0, 0),
  /*   OP_RESERVED_128 = 0x80 */
  Command(KIND_RESERVED, 128, 0, 0),
  /*   OP_RESERVED_129 = 0x81 */
  Command(KIND_RESERVED, 129, 0, 0),
  /*   OP_RESERVED_130 = 0x82 */
  Command(KIND_RESERVED, 130, 0, 0),
  /*   OP_RESERVED_131 = 0x83 */
  Command(KIND_RESERVED, 131, 0, 0),
  /*   OP_RESERVED_132 = 0x84 */
  Command(KIND_RESERVED, 132, 0, 0),
  /*   OP_RESERVED_133 = 0x85 */
  Command(KIND_RESERVED, 133, 0, 0),
  /*   OP_RESERVED_134 = 0x86 */
  Command(KIND_RESERVED, 134, 0, 0),
  /*   OP_RESERVED_135 = 0x87 */
  Command(KIND_RESERVED, 135, 0, 0),
  /*   OP_RESERVED_136 = 0x88 */
  Command(KIND_RESERVED, 136, 0, 0),
  /*   OP_RESERVED_137 = 0x89 */
  Command(KIND_RESERVED, 137, 0, 0),
  /*   OP_RESERVED_138 = 0x8a */
  Command(KIND_RESERVED, 138, 0, 0),
  /*   OP_RESERVED_139 = 0x8b */
  Command(KIND_RESERVED, 139, 0, 0),
  /*   OP_RESERVED_140 = 0x8c */
  Command(KIND_RESERVED, 140, 0, 0),
  /*   OP_RESERVED_141 = 0x8d */
  Command(KIND_RESERVED, 141, 0, 0),
  /*   OP_RESERVED_142 = 0x8e */
  Command(KIND_RESERVED, 142, 0, 0),
  /*   OP_RESERVED_143 = 0x8f */
  Command(KIND_RESERVED, 143, 0, 0),
  /*   OP_RESERVED_144 = 0x90 */
  Command(KIND_RESERVED, 144, 0, 0),
  /*   OP_RESERVED_145 = 0x91 */
  Command(KIND_RESERVED, 145, 0, 0),
  /*   OP_RESERVED_146 = 0x92 */
  Command(KIND_RESERVED, 146, 0, 0),
  /*   OP_RESERVED_147 = 0x93 */
  Command(KIND_RESERVED, 147, 0, 0),
  /*   OP_RESERVED_148 = 0x94 */
  Command(KIND_RESERVED, 148, 0, 0),
  /*   OP_RESERVED_149 = 0x95 */
  Command(KIND_RESERVED, 149, 0, 0),
  /*   OP_RESERVED_150 = 0x96 */
  Command(KIND_RESERVED, 150, 0, 0),
  /*   OP_RESERVED_151 = 0x97 */
  Command(KIND_RESERVED, 151, 0, 0),
  /*   OP_RESERVED_152 = 0x98 */
  Command(KIND_RESERVED, 152, 0, 0),
  /*   OP_RESERVED_153 = 0x99 */
  Command(KIND_RESERVED, 153, 0, 0),
  /*   OP_RESERVED_154 = 0x9a */
  Command(KIND_RESERVED, 154, 0, 0),
  /*   OP_RESERVED_155 = 0x9b */
  Command(KIND_RESERVED, 155, 0, 0),
  /*   OP_RESERVED_156 = 0x9c */
  Command(KIND_RESERVED, 156, 0, 0),
  /*   OP_RESERVED_157 = 0x9d */
  Command(KIND_RESERVED, 157, 0, 0),
  /*   OP_RESERVED_158 = 0x9e */
  Command(KIND_RESERVED, 158, 0, 0),
  /*   OP_RESERVED_159 = 0x9f */
  Command(KIND_RESERVED, 159, 0, 0),
  /*   OP_RESERVED_160 = 0xa0 */
  Command(KIND_RESERVED, 160, 0, 0),
  /*   OP_RESERVED_161 = 0xa1 */
  Command(KIND_RESERVED, 161, 0, 0),
  /*   OP_RESERVED_162 = 0xa2 */
  Command(KIND_RESERVED, 162, 0, 0),
  /*   OP_RESERVED_163 = 0xa3 */
  Command(KIND_RESERVED, 163, 0, 0),
  /*   OP_RESERVED_164 = 0xa4 */
  Command(KIND_RESERVED, 164, 0, 0),
  /*   OP_RESERVED_165 = 0xa5 */
  Command(KIND_RESERVED, 165, 0, 0),
  /*   OP_RESERVED_166 = 0xa6 */
  Command(KIND_RESERVED, 166, 0, 0),
  /*   OP_RESERVED_167 = 0xa7 */
  Command(KIND_RESERVED, 167, 0, 0),
  /*   OP_RESERVED_168 = 0xa8 */
  Command(KIND_RESERVED, 168, 0, 0),
  /*   OP_RESERVED_169 = 0xa9 */
  Command(KIND_RESERVED, 169, 0, 0),
  /*   OP_RESERVED_170 = 0xaa */
  Command(KIND_RESERVED, 170, 0, 0),
  /*   OP_RESERVED_171 = 0xab */
  Command(KIND_RESERVED, 171, 0, 0),
  /*   OP_RESERVED_172 = 0xac */
  Command(KIND_RESERVED, 172, 0, 0),
  /*   OP_RESERVED_173 = 0xad */
  Command(KIND_RESERVED, 173, 0, 0),
  /*   OP_RESERVED_174 = 0xae */
  Command(KIND_RESERVED, 174, 0, 0),
  /*   OP_RESERVED_175 = 0xaf */
  Command(KIND_RESERVED, 175, 0, 0),
  /*   OP_RESERVED_176 = 0xb0 */
  Command(KIND_RESERVED, 176, 0, 0),
  /*   OP_RESERVED_177 = 0xb1 */
  Command(KIND_RESERVED, 177, 0, 0),
  /*   OP_RESERVED_178 = 0xb2 */
  Command(KIND_RESERVED, 178, 0, 0),
  /*   OP_RESERVED_179 = 0xb3 */
  Command(KIND_RESERVED, 179, 0, 0),
  /*   OP_RESERVED_180 = 0xb4 */
  Command(KIND_RESERVED, 180, 0, 0),
  /*   OP_RESERVED_181 = 0xb5 */
  Command(KIND_RESERVED, 181, 0, 0),
  /*   OP_RESERVED_182 = 0xb6 */
  Command(KIND_RESERVED, 182, 0, 0),
  /*   OP_RESERVED_183 = 0xb7 */
  Command(KIND_RESERVED, 183, 0, 0),
  /*   OP_RESERVED_184 = 0xb8 */
  Command(KIND_RESERVED, 184, 0, 0),
  /*   OP_RESERVED_185 = 0xb9 */
  Command(KIND_RESERVED, 185, 0, 0),
  /*   OP_RESERVED_186 = 0xba */
  Command(KIND_RESERVED, 186, 0, 0),
  /*   OP_RESERVED_187 = 0xbb */
  Command(KIND_RESERVED, 187, 0, 0),
  /*   OP_RESERVED_188 = 0xbc */
  Command(KIND_RESERVED, 188, 0, 0),
  /*   OP_RESERVED_189 = 0xbd */
  Command(KIND_RESERVED, 189, 0, 0),
  /*   OP_RESERVED_190 = 0xbe */
  Command(KIND_RESERVED, 190, 0, 0),
  /*   OP_RESERVED_191 = 0xbf */
  Command(KIND_RESERVED, 191, 0, 0),
  /*   OP_RESERVED_192 = 0xc0 */
  Command(KIND_RESERVED, 192, 0, 0),
  /*   OP_RESERVED_193 = 0xc1 */
  Command(KIND_RESERVED, 193, 0, 0),
  /*   OP_RESERVED_194 = 0xc2 */
  Command(KIND_RESERVED, 194, 0, 0),
  /*   OP_RESERVED_195 = 0xc3 */
  Command(KIND_RESERVED, 195, 0, 0),
  /*   OP_RESERVED_196 = 0xc4 */
  Command(KIND_RESERVED, 196, 0, 0),
  /*   OP_RESERVED_197 = 0xc5 */
  Command(KIND_RESERVED, 197, 0, 0),
  /*   OP_RESERVED_198 = 0xc6 */
  Command(KIND_RESERVED, 198, 0, 0),
  /*   OP_RESERVED_199 = 0xc7 */
  Command(KIND_RESERVED, 199, 0, 0),
  /*   OP_RESERVED_200 = 0xc8 */
  Command(KIND_RESERVED, 200, 0, 0),
  /*   OP_RESERVED_201 = 0xc9 */
  Command(KIND_RESERVED, 201, 0, 0),
  /*   OP_RESERVED_202 = 0xca */
  Command(KIND_RESERVED, 202, 0, 0),
  /*   OP_RESERVED_203 = 0xcb */
  Command(KIND_RESERVED, 203, 0, 0),
  /*   OP_RESERVED_204 = 0xcc */
  Command(KIND_RESERVED, 204, 0, 0),
  /*   OP_RESERVED_205 = 0xcd */
  Command(KIND_RESERVED, 205, 0, 0),
  /*   OP_RESERVED_206 = 0xce */
  Command(KIND_RESERVED, 206, 0, 0),
  /*   OP_RESERVED_207 = 0xcf */
  Command(KIND_RESERVED, 207, 0, 0),
  /*   OP_RESERVED_208 = 0xd0 */
  Command(KIND_RESERVED, 208, 0, 0),
  /*   OP_RESERVED_209 = 0xd1 */
  Command(KIND_RESERVED, 209, 0, 0),
  /*   OP_RESERVED_210 = 0xd2 */
  Command(KIND_RESERVED, 210, 0, 0),
  /*   OP_RESERVED_211 = 0xd3 */
  Command(KIND_RESERVED, 211, 0, 0),
  /*   OP_RESERVED_212 = 0xd4 */
  Command(KIND_RESERVED, 212, 0, 0),
  /*   OP_RESERVED_213 = 0xd5 */
  Command(KIND_RESERVED, 213, 0, 0),
  /*   OP_RESERVED_214 = 0xd6 */
  Command(KIND_RESERVED, 214, 0, 0),
  /*   OP_RESERVED_215 = 0xd7 */
  Command(KIND_RESERVED, 215, 0, 0),
  /*   OP_RESERVED_216 = 0xd8 */
  Command(KIND_RESERVED, 216, 0, 0),
  /*   OP_RESERVED_217 = 0xd9 */
  Command(KIND_RESERVED, 217, 0, 0),
  /*   OP_RESERVED_218 = 0xda */
  Command(KIND_RESERVED, 218, 0, 0),
  /*   OP_RESERVED_219 = 0xdb */
  Command(KIND_RESERVED, 219, 0, 0),
  /*   OP_RESERVED_220 = 0xdc */
  Command(KIND_RESERVED, 220, 0, 0),
  /*   OP_RESERVED_221 = 0xdd */
  Command(KIND_RESERVED, 221, 0, 0),
  /*   OP_RESERVED_222 = 0xde */
  Command(KIND_RESERVED, 222, 0, 0),
  /*   OP_RESERVED_223 = 0xdf */
  Command(KIND_RESERVED, 223, 0, 0),
  /*   OP_RESERVED_224 = 0xe0 */
  Command(KIND_RESERVED, 224, 0, 0),
  /*   OP_RESERVED_225 = 0xe1 */
  Command(KIND_RESERVED, 225, 0, 0),
  /*   OP_RESERVED_226 = 0xe2 */
  Command(KIND_RESERVED, 226, 0, 0),
  /*   OP_RESERVED_227 = 0xe3 */
  Command(KIND_RESERVED, 227, 0, 0),
  /*   OP_RESERVED_228 = 0xe4 */
  Command(KIND_RESERVED, 228, 0, 0),
  /*   OP_RESERVED_229 = 0xe5 */
  Command(KIND_RESERVED, 229, 0, 0),
  /*   OP_RESERVED_230 = 0xe6 */
  Command(KIND_RESERVED, 230, 0, 0),
  /*   OP_RESERVED_231 = 0xe7 */
  Command(KIND_RESERVED, 231, 0, 0),
  /*   OP_RESERVED_232 = 0xe8 */
  Command(KIND_RESERVED, 232, 0, 0),
  /*   OP_RESERVED_233 = 0xe9 */
  Command(KIND_RESERVED, 233, 0, 0),
  /*   OP_RESERVED_234 = 0xea */
  Command(KIND_RESERVED, 234, 0, 0),
  /*   OP_RESERVED_235 = 0xeb */
  Command(KIND_RESERVED, 235, 0, 0),
  /*   OP_RESERVED_236 = 0xec */
  Command(KIND_RESERVED, 236, 0, 0),
  /*   OP_RESERVED_237 = 0xed */
  Command(KIND_RESERVED, 237, 0, 0),
  /*   OP_RESERVED_238 = 0xee */
  Command(KIND_RESERVED, 238, 0, 0),
  /*   OP_RESERVED_239 = 0xef */
  Command(KIND_RESERVED, 239, 0, 0),
  /*   OP_RESERVED_240 = 0xf0 */
  Command(KIND_RESERVED, 240, 0, 0),
  /*   OP_RESERVED_241 = 0xf1 */
  Command(KIND_RESERVED, 241, 0, 0),
  /*   OP_RESERVED_242 = 0xf2 */
  Command(KIND_RESERVED, 242, 0, 0),
  /*   OP_RESERVED_243 = 0xf3 */
  Command(KIND_RESERVED, 243, 0, 0),
  /*   OP_RESERVED_244 = 0xf4 */
  Command(KIND_RESERVED, 244, 0, 0),
  /*   OP_RESERVED_245 = 0xf5 */
  Command(KIND_RESERVED, 245, 0, 0),
  /*   OP_RESERVED_246 = 0xf6 */
  Command(KIND_RESERVED, 246, 0, 0),
  /*   OP_RESERVED_247 = 0xf7 */
  Command(KIND_RESERVED, 247, 0, 0),
  /*   OP_RESERVED_248 = 0xf8 */
  Command(KIND_RESERVED, 248, 0, 0),
  /*   OP_RESERVED_249 = 0xf9 */
  Command(KIND_RESERVED, 249, 0, 0),
  /*   OP_RESERVED_250 = 0xfa */
  Command(KIND_RESERVED, 250, 0, 0),
  /*   OP_RESERVED_251 = 0xfb */
  Command(KIND_RESERVED, 251, 0, 0),
  /*   OP_RESERVED_252 = 0xfc */
  Command(KIND_RESERVED, 252, 0, 0),
  /*   OP_RESERVED_253 = 0xfd */
  Command(KIND_RESERVED, 253, 0, 0),
  /*   OP_RESERVED_254 = 0xfe */
  Command(KIND_RESERVED, 254, 0, 0),
  /*   OP_RESERVED_255 = 0xff */
  Command(KIND_RESERVED, 255, 0, 0),
];
