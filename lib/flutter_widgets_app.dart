import 'package:flutter/material.dart';
import 'package:flutter_widgets/home.dart';
import 'package:flutter_widgets/pages/page_nine/page_nine_view_model.dart';
import 'package:provider/provider.dart';

class FlutterWidgetsApp extends StatelessWidget {
  const FlutterWidgetsApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeViewModel(),
      child: Selector<ThemeViewModel, ThemeMode>(
          selector: (_, viewModel) => viewModel.currentTheme,
          builder: (context, themeMode, _) {
            return MaterialApp(
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              themeMode: themeMode,
              home: Home(),
            );
          }),
    );
  }
}
