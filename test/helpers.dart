import 'package:librsync/patch.dart';
import 'package:tuple/tuple.dart';

List<String> allTestCases = [
  "000-blake2-11-23",
  "000-blake2-512-32",
  "000-md4-256-7",
  "001-blake2-512-32",
  "001-blake2-776-31",
  "001-md4-777-15",
  "002-blake2-512-32",
  "002-blake2-431-19",
  "002-md4-128-16",
  "003-blake2-512-32",
  "003-blake2-1024-13",
  "003-md4-1024-13",
  "004-blake2-1024-28",
  "004-blake2-2222-31",
  "004-blake2-512-32",
  "005-blake2-512-32",
  "005-blake2-1000-18",
  "005-md4-999-14",
  "006-blake2-2-32",
  "007-blake2-5-32",
  "007-blake2-4-32",
  "007-blake2-3-32",
  "008-blake2-222-30",
  "008-blake2-512-32",
  "008-md4-111-11",
  "009-blake2-2048-26",
  "009-blake2-512-32",
  "009-md4-2033-15",
  "010-blake2-512-32",
  "010-blake2-7-6",
  "010-md4-4096-8",
  "011-blake2-3-32",
  "011-md4-3-9",
];

Tuple5<String, MagicNumber, int, int, Exception?> argsFromTestName(
    String name) {
  List<String> segs = name.split('-');
  if (segs.length != 4) {
    return Tuple5("", 0, 0, 0, Exception("invalid format for name $name"));
  }

  String file = segs[0];

  MagicNumber magic;
  switch (segs[1]) {
    case "blake2":
      magic = blake2SigMagic;
      break;
    case "md4":
      magic = md4SigMagic;
      break;
    default:
      return Tuple5("", 0, 0, 0, Exception("invalid magic ${segs[1]}"));
  }

  int blockLen = int.parse(segs[2], radix: 10);
  if (blockLen.isNaN) {
    return Tuple5("", 0, 0, 0, Exception("invalid block length ${segs[2]}"));
  }

  int strongLen = int.parse(segs[3], radix: 10);
  if (strongLen.isNaN) {
    return Tuple5(
        "", 0, 0, 0, Exception("invalid strong hash length ${segs[3]}"));
  }

  return Tuple5(file, magic, blockLen, strongLen, null);
}
