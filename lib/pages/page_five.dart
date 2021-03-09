import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageFive extends StatefulWidget {
  @override
  _PageFiveState createState() => _PageFiveState();
}

class _PageFiveState extends State<PageFive> with TickerProviderStateMixin {
  AnimationController _controller;
  final animation = Tween(begin: 0.0, end: 1.0);
  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        child: Container(
          height: 50,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Szép munka")));
          },
          child: Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.amber, width: 8),
                borderRadius: BorderRadius.circular(8)),
            child: Wrap(
//            direction: Axis.vertical,
              alignment: WrapAlignment.end,
              children: [
                FadeTransition(
                  opacity: animation.animate(_controller),
                  child: ElevatedButton(
                    onPressed: () {
                      //_controller.forward();
                      setState(() {
                        _controller.repeat(reverse: true);
                      });
                    },
                    child: Icon(Icons.account_circle_outlined),
                  ),
                ),
                Opacity(
                  opacity: 0.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.add_to_home_screen),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Icon(Icons.add_a_photo_rounded),
                  style: TextButton.styleFrom(
                    primary: Colors.amber,
                    backgroundColor: Colors.deepPurpleAccent,
                  ),
                ),
                FadeTransition(
                  opacity: animation.animate(_controller),
                  child: Image.network('https://picsum.photos/id/237/200/300'),

                  //color: Color.fromRGBO(255, 255, 255, 0.5),
                  //colorBlendMode: BlendMode.modulate),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('images/virag.jpg'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
