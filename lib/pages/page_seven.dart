import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageSeven extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "images/sliver.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFixedExtentList(
              delegate: SliverChildListDelegate([
                Container(color: Colors.yellow),
                Container(color: Colors.red),
                Container(color: Colors.blue),
                Container(color: Colors.indigo),
                Container(color: Colors.deepOrange),
              ]),
              itemExtent: 50),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: 50,
                alignment: Alignment.center,
                color: Colors.blue[100 * (index % 9)],
                child: Text('blue $index'),
              );
            }, childCount: 9),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.green[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 30,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 2,
            ),
          )
        ],
      ),
    );
  }
}
