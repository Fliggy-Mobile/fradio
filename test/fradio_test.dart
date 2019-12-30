import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fradio/fradio.dart';

void main() {
  const MethodChannel channel = MethodChannel('fradio');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Fradio.platformVersion, '42');
  });
}
