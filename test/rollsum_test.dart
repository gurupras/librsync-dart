import 'dart:typed_data';

import 'package:librsync/src/rollsum.dart';
import 'package:test/test.dart';

void main() {
  group('rollsum', () {
    late Rollsum r;
    setUp(() {
      r = Rollsum();
    });

    test('BrandNew', () {
      expect(r.digest(), 0);
    });

    test('rollin rollout', () {
      r.rollin(222);
      r.rollin(11);
      expect(r.digest(), 0x02240127);
      r.rollin(0);
      expect(r.digest(), 0x036A0146);
      r.rollin(13);
      expect(r.digest(), 0x04DC0172);
      r.rollin(7);
      expect(r.digest(), 0x06740198);

      r.rollout(222);
      expect(r.digest(), 0x0183009B);
      r.rollout(11);
      expect(r.digest(), 0x00DB0071);
      r.rollout(0);
      expect(r.digest(), 0x007E0052);

      r.rollin(1);
      expect(r.digest(), 0x00F00072);
    });

    test('Update', () {
      Rollsum r = Rollsum();
      final data = Uint8List.fromList([222, 11, 0, 13, 7]);
      final moreData = Uint8List.fromList([66, 171, 8]);

      r.update(data);
      expect(r.digest(), equals(0x06740198));
      r.update(moreData);
      expect(r.digest(), equals(0x0E1A02EA));
    });

    test('Rotate', () {
      Rollsum r = Rollsum();
      final data = Uint8List.fromList([222, 11, 0, 13, 7]);

      r.update(data);

      r.rotate(222, 39);
      expect(r.digest(), equals(0x026400E1));
      r.rotate(11, 177);
      expect(r.digest(), equals(0x03190187));
      r.rotate(0, 0);
      expect(r.digest(), equals(0x04050187));
    });

    test('Consistency', () {
      Rollsum rk1 = Rollsum();
      final data1 = Uint8List.fromList(
          [66, 1, 111, 54, 171, 12, 255, 199, 1, 2, 7, 12, 54, 43, 101]);
      final data2 = Uint8List.fromList(
          [4, 22, 66, 1, 111, 54, 171, 12, 255, 199, 1, 2, 7, 12, 54]);

      rk1.update(data1);

      Rollsum rk2 = Rollsum();
      for (int v in data2) {
        rk2.rollin(v);
      }
      rk2.rotate(4, 43);
      rk2.rollout(22);
      rk2.rollin(101);

      expect(rk1.digest(), equals(rk2.digest()));
    });

    test('Rotate Byte Subtraction Bug', () {
      Rollsum rk1 = Rollsum();
      rk1.rollin(1);
      expect(rk1.digest(), equals(0x00200020));

      Rollsum rk2 = Rollsum();
      rk2.rollin(2);
      rk2.rotate(2, 1);

      expect(rk1.digest(), equals(rk2.digest()));
    });
  });
}
