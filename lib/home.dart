import 'package:flutter/material.dart';
import 'package:flutter_widgets/button.dart';
import 'package:flutter_widgets/pages/page_eight.dart';
import 'package:flutter_widgets/pages/page_five.dart';
import 'package:flutter_widgets/pages/page_four.dart';
import 'package:flutter_widgets/pages/page_nine.dart';
import 'package:flutter_widgets/pages/page_one.dart';
import 'package:flutter_widgets/pages/page_seven.dart';
import 'package:flutter_widgets/pages/page_six.dart';
import 'package:flutter_widgets/pages/page_ten.dart';
import 'package:flutter_widgets/pages/page_three.dart';
import 'package:flutter_widgets/pages/page_two/page_two.dart';

class Home extends StatelessWidget {
  final pages = [
    PageOne(),
    PageTwo(),
    PageThree(),
    PageFour(),
    PageFive(),
    PageSix(),
    PageSeven(),
    PageEight(),
    PageNine(),
    PageTen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Widgets App"),
      ),
      body: SafeArea(
        bottom: false,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemCount: pages.length,
          itemBuilder: (_, index) => Button(
            title: pages[index].runtimeType.toString(),
            destination: pages[index],
          ),
        ),
      ),
    );
  }
}
