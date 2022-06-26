import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:window_manager/window_manager.dart';

import 'color_picker_platform_interface.dart';

/// An implementation of [ColorPickerPlatform] that uses method channels.
class MethodChannelColorPicker extends ColorPickerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('color_picker');

  @override
  Future<Color?> pickColor() async {
    // Hides the app
    await windowManager.setOpacity(0);

    final jsonColor = await methodChannel.invokeMethod<Map>('pickColor');
    if (jsonColor == null) return null;

    final colorMap = Map<String, double>.from(jsonColor);
    final red = colorMap["red"]!;
    final green = colorMap["green"]!;
    final blue = colorMap["blue"]!;
    final alpha = colorMap["alpha"]!;

    final effectiveRed = (red * 255 / 1.0).round();
    final effectiveGreen = (green * 255 / 1.0).round();
    final effectiveBlue = (blue * 255 ~/ 1.0).round();
    final effectiveAlpha = (alpha * 255 ~/ 1.0).round();

    // Shows again the app
    await windowManager.setOpacity(1);

    return Color.fromARGB(
      effectiveAlpha,
      effectiveRed,
      effectiveGreen,
      effectiveBlue,
    );
  }
}
