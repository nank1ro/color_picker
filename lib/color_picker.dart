import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import 'color_picker_platform_interface.dart';

class ColorPicker {
  Future<Color?> pick() async {
    await windowManager.ensureInitialized();
    await _hideWindow();
    final color = await ColorPickerPlatform.instance.pickColor();
    await _showWindow(shouldFocus: color != null);
    return color;
  }

  Future<void> _hideWindow() async {
    await windowManager.setOpacity(0);
  }

  Future<void> _showWindow({bool shouldFocus = true}) async {
    await windowManager.setOpacity(1);

    if (shouldFocus) {
      await windowManager.show();
      final hasFocus = await windowManager.isFocused();
      if (!hasFocus) {
        await windowManager.focus();
      }
    }
  }
}
