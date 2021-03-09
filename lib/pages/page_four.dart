import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageFour extends StatefulWidget {
  @override
  _PageFourState createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {
  final _pageController = PageController(viewportFraction: 0.6);
  final images = [
    "images/kutya.jpg",
    "images/vasur.jpg",
    "images/virag.jpg",
    "images/felhokarcolo.jpg",
  ];

  var currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 350,
                child: PageView(
                    onPageChanged: (pageNumber) {
                      setState(() {
                        currentPage = pageNumber;
                      });
                    },
                    controller: _pageController,
                    children: images
                        .map((imagename) => Card(
                              color: Colors.pink.shade100,
                              child: Image.asset(imagename),
                            ))
                        .toList()),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: images.map((imageName) {
                    final isCurrent = currentPage == images.indexOf(imageName);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        width: isCurrent ? 15 : 10,
                        height: isCurrent ? 15 : 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isCurrent ? Colors.blue : Colors.pink.shade300,
                        ),
                      ),
                    );
                  }).toList())
            ],
          ),
        ),
      ),
    );
  }
}
