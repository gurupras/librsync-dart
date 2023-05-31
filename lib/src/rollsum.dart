import 'dart:typed_data';

const rollsumCharOffset = 31;

class Rollsum {
  late int count;
  late int s1, s2;

  Rollsum() {
    reset();
  }

  void update(Uint8List p) {
    final l = p.length;

    for (int n = 0; n < l;) {
      if (n + 15 < l) {
        for (int i = 0; i < 16; i++) {
          s1 += p[n + i];
          s2 += s1;
        }
        n += 16;
      } else {
        s1 += p[n];
        s2 += s1;
        n += 1;
      }
    }

    s1 += l * rollsumCharOffset;
    s2 += ((l * (l + 1)) ~/ 2) * rollsumCharOffset;
    count += l;
  }

  void rotate(int outgoing, int incoming) {
    s1 += incoming - outgoing;
    s2 += s1 - count * (outgoing + rollsumCharOffset);
  }

  void rollin(int input) {
    s1 += input + rollsumCharOffset;
    s2 += s1;
    count++;
  }

  void rollout(int output) {
    s1 -= output + rollsumCharOffset;
    s2 -= count * (output + rollsumCharOffset);
    count--;
  }

  int digest() {
    return (s2 << 16) | (s1 & 0xFFFF);
  }

  void reset() {
    s1 = 0;
    s2 = 0;
    count = 0;
  }
}

int weakChecksum(Uint8List data) {
  final sum = Rollsum();
  sum.update(data);
  return sum.digest();
}
