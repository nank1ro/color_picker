# color_picker

A MacOS only Flutter plugin that shows the native color picker.
Used in the [DevTools app](https://github.com/nank1ro/devtools)

## Getting Started

In your main.dart ensure to have:
```dart
WidgetsFlutterBinding.ensureInitialized();
```
before the run app.

## Usage

Simple usage is:
```dart
final colorPicker = ColorPicker();
final color = await colorPicker.pick();
```

## Constraints

The minimum supported MacOS version is `10.15`.
