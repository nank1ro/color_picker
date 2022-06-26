import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:color_picker/color_picker_method_channel.dart';

void main() {
  MethodChannelColorPicker platform = MethodChannelColorPicker();
  const MethodChannel channel = MethodChannel('color_picker');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
