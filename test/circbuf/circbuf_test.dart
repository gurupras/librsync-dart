import 'dart:convert';

import 'package:librsync/src/circbuf/circbuf.dart';
import 'package:test/test.dart';

void main() {
  group('circbuf', () {
    test('Short write', () async {
      final buf = newBuffer(1024);

      List<int> inp = toBytes("hello world");
      final n = buf.write(inp);
      expect(n, inp.length);

      expect(buf.bytes(), inp);
    });

    test('Full write', () async {
      List<int> inp = toBytes("hello world");

      final buf = newBuffer(inp.length);
      final n = buf.write(inp);
      expect(n, inp.length);

      expect(buf.bytes(), inp);
    });

    test('Long write', () async {
      List<int> inp = toBytes("hello world");

      final buf = newBuffer(6);
      final n = buf.write(inp);
      expect(n, inp.length);

      final expected = toBytes(" world");
      expect(buf.bytes(), expected);
    });

    test('Huge write', () async {
      List<int> inp = toBytes("hello world");

      final buf = newBuffer(3);
      final n = buf.write(inp);
      expect(n, inp.length);

      final expected = toBytes("rld");
      expect(buf.bytes(), expected);
    });

    test('Many small', () async {
      List<int> inp = toBytes("hello world");

      final buf = newBuffer(3);
      for (var b in inp) {
        final n = buf.write(<int>[b]);
        expect(n, 1);
      }
      final expected = toBytes("rld");
      expect(buf.bytes(), expected);
    });

    test('Multipart', () async {
      final inputs = <List<int>>[
        toBytes("hello world\n"),
        toBytes("this is a test\n"),
        toBytes("my cool input\n"),
      ];
      int total = 0;

      final buf = newBuffer(16);

      for (var b in inputs) {
        total += b.length;
        final n = buf.write(b);
        expect(n, b.length);
      }
      expect(buf.totalWritten(), total);

      final expected = toBytes("t\nmy cool input\n");
      expect(buf.bytes(), expected);
    });

    test('Reset', () async {
      final inputs = <List<int>>[
        toBytes("hello world\n"),
        toBytes("this is a test\n"),
        toBytes("my cool input\n"),
      ];

      final buf = newBuffer(4);

      for (var b in inputs) {
        final n = buf.write(b);
        expect(n, b.length);
      }

      buf.reset();

      final input = toBytes("hello");
      final n = buf.write(input);
      expect(n, input.length);

      final expected = toBytes("ello");
      expect(buf.bytes(), expected);
    });

    void testWriteByte(bool wantPO2) {
      List<int> inp = toBytes("hello world");

      int bufSize = 3;
      if (wantPO2) {
        bufSize = 4;
      }
      final buf = newBuffer(bufSize);
      for (var b in inp) {
        buf.writeByte(b);
      }

      List<int> expected = toBytes("rld");
      if (wantPO2) {
        expected = toBytes("orld");
      }

      final got = buf.bytes();
      expect(got, expected);
    }

    test('any - writeByte', () async {
      testWriteByte(false);
    });

    test('PO2 - writeByte', () async {
      testWriteByte(true);
    });

    void testGet(List<int> inp) {
      final initialData = toBytes("hell");
      expect(inp.length >= initialData.length, true);

      final buf = newBuffer(inp.length);

      buf.write(initialData);

      for (var idx = 0; idx < initialData.length; idx++) {
        final expected = initialData[idx];
        final got = buf.get(idx);
        expect(got, expected);
      }

      buf.write(inp);
      for (var idx = 0; idx < inp.length; idx++) {
        final expected = inp[idx];
        final got = buf.get(idx);
        expect(got, expected);
      }
    }

    test('any - get', () async {
      testGet(toBytes("hello world"));
    });

    test('PO2 - get', () async {
      testGet(toBytes("hey, hello world"));
    });
  });
}

List<int> toBytes(String s) {
  return utf8.encode(s);
}
