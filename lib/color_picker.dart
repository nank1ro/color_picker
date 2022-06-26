import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import 'color_picker_platform_interface.dart';

class ColorPicker {
  Future<Color?> pick() async {
    await windowManager.ensureInitialized();
    return ColorPickerPlatform.instance.pickColor();
  }
}
