import 'package:flutter/material.dart';
import 'package:flutter_widgets/home.dart';

class FlutterWidgetsApp extends StatelessWidget {
  const FlutterWidgetsApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
