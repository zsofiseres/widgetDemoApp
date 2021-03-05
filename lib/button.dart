import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final Widget destination;

  const Button({Key key, @required this.title, @required this.destination})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => destination));
      },
      child: Text(title),
    );
  }
}
