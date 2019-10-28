import 'package:flutter/material.dart';

class MyIconButton extends StatefulWidget {
  const MyIconButton({this.icon, this.color, this.route});

  final IconData icon;
  final Color color;
  final String route;

  @override
  _MyIconButtonState createState() =>
      _MyIconButtonState(icon: icon, color: color, route: route);
}

class _MyIconButtonState extends State<MyIconButton> {
  _MyIconButtonState({this.icon, this.color, this.route});

  final IconData icon;
  final Color color;
  final String route;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      color: color,
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
