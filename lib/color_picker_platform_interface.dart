import 'package:flutter/material.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'color_picker_method_channel.dart';

abstract class ColorPickerPlatform extends PlatformInterface {
  /// Constructs a ColorPickerPlatform.
  ColorPickerPlatform() : super(token: _token);

  static final Object _token = Object();

  static ColorPickerPlatform _instance = MethodChannelColorPicker();

  /// The default instance of [ColorPickerPlatform] to use.
  ///
  /// Defaults to [MethodChannelColorPicker].
  static ColorPickerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ColorPickerPlatform] when
  /// they register themselves.
  static set instance(ColorPickerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<Color?> pickColor() {
    throw UnimplementedError('pickColor() has not been implemented.');
  }
}
