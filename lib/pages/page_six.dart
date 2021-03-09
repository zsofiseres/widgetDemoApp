import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageSix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Center(
            child: Container(
              child: Table(
                border: TableBorder.all(),
                children: [
                  TableRow(children: [
                    Column(
                      children: [
                        Icon(Icons.settings, size: 40),
                        Text('Settings'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.lightbulb_outline, size: 40),
                        Text('Ideas'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.account_box, size: 40),
                        Text('My Account'),
                      ],
                    )
                  ]),
                  TableRow(children: [
                    IconButton(
                      icon: Icon(Icons.cake),
                      onPressed: () {},
                      tooltip: "It is a cake",
                    ),
                    Icon(
                      Icons.voice_chat,
                      size: 40,
                    ),
                    Icon(
                      Icons.add_location,
                      size: 40,
                    ),
                  ])
                ],
              ),
            ),
          ),
        ));
  }
}
