import 'package:flutter/material.dart';

class PageTen extends StatelessWidget {
  final randomWords = ["Apple", "Bread", "Pear", "Peach", "Pizza", "Fries"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((_, index) {
                return Dismissible(
                  key: Key(randomWords[index]),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    child: Icon(Icons.delete),
                    color: Colors.red,
                  ),
                  onDismissed: (_) {
                    randomWords.removeAt(index);
                  },
                  child: ListTile(
                    title: Text(index.toString()),
                  ),
                );
              }, childCount: randomWords.length),
            ),
          )
        ],
      ),
    );
  }
}
