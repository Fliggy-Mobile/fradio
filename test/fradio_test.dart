import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fradio/fradio.dart';

void main() {
  group('FRadio size', () {
    testWidgets('default size is 27 x 27', (tester) async {
      const key = ValueKey('default');
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Center(
            child: FRadio<int>(
              key: key,
              value: 1,
              groupValue: 1,
              onChanged: (v) {},
            ),
          ),
        ),
      ));
      expect(tester.getSize(find.byKey(key)), const Size(27, 27));
    });

    testWidgets('custom width/height is respected', (tester) async {
      const key = ValueKey('fixed');
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Center(
            child: FRadio<int>(
              key: key,
              value: 1,
              groupValue: 1,
              onChanged: (v) {},
              width: 50,
              height: 40,
            ),
          ),
        ),
      ));
      expect(tester.getSize(find.byKey(key)), const Size(50, 40));
    });

    testWidgets('default constructor falls back to 27 x 27 when width/height are null',
        (tester) async {
      const key = ValueKey('null-default');
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Center(
            child: FRadio<int>(
              key: key,
              value: 1,
              groupValue: 1,
              onChanged: (v) {},
              width: null,
              height: null,
            ),
          ),
        ),
      ));
      expect(tester.getSize(find.byKey(key)), const Size(27, 27));
    });

    testWidgets('FRadio.custom adapts to child size when width/height are null',
        (tester) async {
      const key = ValueKey('adaptive');
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Center(
            child: FRadio<int>.custom(
              key: key,
              value: 1,
              groupValue: 1,
              onChanged: (v) {},
              width: null,
              height: null,
              normal: Container(
                width: 120,
                height: 48,
                color: Colors.grey,
              ),
              selected: Container(
                width: 120,
                height: 48,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ));
      expect(tester.getSize(find.byKey(key)), const Size(120, 48));
    });
  });

  group('FRadio interaction', () {
    testWidgets('onChanged fires with value on tap', (tester) async {
      const key = ValueKey('tap');
      int? changed;
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Center(
            child: FRadio<int>(
              key: key,
              value: 1,
              groupValue: 0,
              onChanged: (v) => changed = v,
            ),
          ),
        ),
      ));
      await tester.tap(find.byKey(key));
      await tester.pump();
      expect(changed, 1);
    });

    testWidgets('tap area follows adaptive size', (tester) async {
      const key = ValueKey('tap-adaptive');
      int? changed;
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Center(
            child: FRadio<int>.custom(
              key: key,
              value: 1,
              groupValue: 0,
              onChanged: (v) => changed = v,
              width: null,
              height: null,
              normal: Container(
                width: 120,
                height: 48,
                color: Colors.grey,
              ),
              selected: Container(
                width: 120,
                height: 48,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ));
      // 点击自适应尺寸的边缘区域，同样能触发回调
      await tester.tapAt(
        tester.getTopLeft(find.byKey(key)) + const Offset(119, 47),
      );
      await tester.pump();
      expect(changed, 1);
    });
  });
}
