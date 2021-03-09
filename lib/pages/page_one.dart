import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key key}) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  bool isRed = true;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                count++;
                isRed = !isRed;
              });
            },
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.01)
                ..rotateX(0.6),
              alignment: FractionalOffset.center,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: isRed ? 200 : 100,
                width: isRed ? 200 : 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isRed ? Colors.red : Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(isRed ? 30 : 10),
                  ),
                ),
                child: Text(
                  '$count',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
