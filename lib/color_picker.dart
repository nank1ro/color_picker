import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import 'color_picker_platform_interface.dart';

class ColorPicker {
  Future<Color?> pick() async {
    await windowManager.ensureInitialized();
    Color? color;
    try {
      await _hideWindow();
      return color = await ColorPickerPlatform.instance.pickColor();
    } finally {
      await _showWindow(shouldFocus: color != null);
    }
  }

  Future<void> _hideWindow() async {
    await windowManager.setOpacity(0);
  }

  Future<void> _showWindow({bool shouldFocus = true}) async {
    await windowManager.show();
    await windowManager.setOpacity(1);

    if (shouldFocus) {
      final hasFocus = await windowManager.isFocused();
      if (!hasFocus) {
        await windowManager.focus();
      }
    }
  }
}
