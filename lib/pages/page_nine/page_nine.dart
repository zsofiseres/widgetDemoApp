import 'package:flutter/material.dart';
import 'package:flutter_widgets/pages/page_nine/page_nine_view_model.dart';
import 'package:provider/provider.dart';

class PageNine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Themes'),
      ),
      body: SafeArea(
        child: Consumer<ThemeViewModel>(builder: (context, viewmodel, _) {
          return Column(
            children: [
              ListTile(
                leading: AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  child: viewmodel.isOn
                      ? Icon(
                          Icons.lightbulb,
                          key: UniqueKey(),
                          color: Colors.yellow,
                        )
                      : Icon(
                          Icons.lightbulb,
                          key: UniqueKey(),
                        ),
                ),
                title: Text('The switch is ' + (viewmodel.isOn ? 'on' : 'off')),
                trailing: Switch(
                    value: viewmodel.isOn,
                    onChanged: viewmodel.onSwitchChanged),
              ),
              RadioListTile(
                title: const Text('System'),
                value: ThemeMode.system,
                groupValue: viewmodel.currentTheme,
                onChanged: viewmodel.setTheme,
              ),
              RadioListTile(
                title: const Text('Dark'),
                value: ThemeMode.dark,
                groupValue: viewmodel.currentTheme,
                onChanged: viewmodel.setTheme,
              ),
              RadioListTile(
                title: const Text('Light'),
                value: ThemeMode.light,
                groupValue: viewmodel.currentTheme,
                onChanged: viewmodel.setTheme,
              ),
            ],
          );
        }),
      ),
    );
  }
}

void onChanged(ThemeMode newMode) {}
