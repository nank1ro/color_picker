import 'package:flutter_test/flutter_test.dart';
import 'package:color_picker/color_picker.dart';
import 'package:color_picker/color_picker_platform_interface.dart';
import 'package:color_picker/color_picker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockColorPickerPlatform 
    with MockPlatformInterfaceMixin
    implements ColorPickerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ColorPickerPlatform initialPlatform = ColorPickerPlatform.instance;

  test('$MethodChannelColorPicker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelColorPicker>());
  });

  test('getPlatformVersion', () async {
    ColorPicker colorPickerPlugin = ColorPicker();
    MockColorPickerPlatform fakePlatform = MockColorPickerPlatform();
    ColorPickerPlatform.instance = fakePlatform;
  
    expect(await colorPickerPlugin.getPlatformVersion(), '42');
  });
}
