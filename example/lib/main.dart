import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:color_picker/color_picker.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final colorPicker = ColorPicker();
  Color? colorPicked;

  @override
  void initState() {
    super.initState();
  }

  Future<void> pickColor() async {
    Color? result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      result = await colorPicker.pick();
    } on PlatformException {
      debugPrint('Failed to get platform version.');
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      colorPicked = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pick color example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  pickColor();
                },
                child: const Text("Pick Color"),
              ),
              if (colorPicked != null)
                Text('Color picked: ${colorPicked!.value.toRadixString(16)}\n'),
            ],
          ),
        ),
      ),
    );
  }
}
