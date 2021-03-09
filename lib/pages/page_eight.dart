import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class PageEight extends StatefulWidget {
  @override
  _PageEightState createState() => _PageEightState();
}

class _PageEightState extends State<PageEight> {
  var _sides = 3.0;
  var _radius = 100.0;
  var _radians = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Widget + CurtomPaint'),
      ),
      body: GestureDetector(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HeroWidgetDetail())),
        child: Column(
          children: [
            Hero(
              tag: 'myImage',
              child: Tooltip(
                message: 'CircleAvatar',
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage:
                      NetworkImage('https://picsum.photos/200/300'),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Slider(
              value: _sides,
              min: 3.0,
              max: 10.0,
              label: _sides.toInt().toString(),
              divisions: 7,
              onChanged: (value) {
                setState(() {
                  _sides = value;
                });
              },
            ),
            SizedBox(
              height: 150,
            ),
            CustomPaint(
              size: Size(200, 100),
              painter: MyPainter(_sides, _radius, _radians),
            ),
          ],
        ),
      ),
    );
  }
}

class HeroWidgetDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hero Detail Widget'),
        ),
        body: Container(
          color: Colors.amber,
          child: Center(
            child: Hero(
              tag: 'myImage',
              child: Image.network('https://picsum.photos/200/300'),
            ),
          ),
        ));
  }
}

class MyPainter extends CustomPainter {
  final double sides;
  final double radius;
  final double radians;
  MyPainter(this.sides, this.radius, this.radians);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;
    var path = Path();

    var angle = (math.pi * 2) / sides;

    Offset center = Offset(size.width / 2, size.height / 2);
    Offset startPoint =
        Offset(radius * math.cos(radians), radius * math.sin(radians));

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);

    for (int i = 1; i <= sides; i++) {
      double x = radius * math.cos(radians + angle * i) + center.dx;
      double y = radius * math.sin(radians + angle * i) + center.dy;
      path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
