import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/pages/page_nine/page_nine.dart';
import 'package:flutter_widgets/pages/page_two/page_two.dart';

class PageThree extends StatefulWidget {
  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  List<Widget> _pages = [
    Container(
      color: Colors.amberAccent,
    ),
    AnimatedListWidget(),
    PageNine(),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
        body: _pages[_currentIndex]);
  }
}

class AnimatedListWidget extends StatefulWidget {
  AnimatedListWidget({Key key}) : super(key: key);

  @override
  _AnimatedListWidgetState createState() => _AnimatedListWidgetState();
}

class _AnimatedListWidgetState extends State<AnimatedListWidget> {
  final _listKey = GlobalKey<AnimatedListState>();
  final _controller = TextEditingController();
  List<String> _names = ["Csondor", "Adam", "Zsofi", "Tibi"];

  void _onAddPressed() {
    if (_controller.text.isNotEmpty) {
      _listKey.currentState.insertItem(0);
      _names.insert(0, _controller.text);
      _controller.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Textfield value must not be empty")));
    }
  }

  void _onRemovePressed() {
    if (_names.isNotEmpty) {
      _names.removeAt(0);
      _listKey.currentState.removeItem(
        0,
        (context, animation) => SlideTransition(
          position: animation
              .drive(Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)),
          child: ListTile(
            title: Text(_names[0]),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(icon: Icon(Icons.remove), onPressed: _onRemovePressed),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    suffixIcon: TextButton(
                  child: Text("Add"),
                  onPressed: _onAddPressed,
                )),
              ),
            ),
            Expanded(
              child: AnimatedList(
                key: _listKey,
                itemBuilder: (context, index, animation) => SlideTransition(
                  position: animation.drive(
                      Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)),
                  child: ListTile(
                    title: Text(_names[index]),
                  ),
                ),
                initialItemCount: _names.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
