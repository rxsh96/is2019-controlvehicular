import 'package:flutter/material.dart';

class MyIconButton extends StatefulWidget {
  const MyIconButton({this.icon, this.color, this.route, this.argument});

  final IconData icon;
  final Color color;
  final String route;
  final Object argument;

  @override
  _MyIconButtonState createState() =>
      _MyIconButtonState(icon: icon, color: color, route: route, argument: argument);
}

class _MyIconButtonState extends State<MyIconButton> {
  _MyIconButtonState({this.icon, this.color, this.route, this.argument});

  final IconData icon;
  final Color color;
  final String route;
  final Object argument;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      color: color,
      onPressed: () {
        Navigator.pushNamed(context, '$route', arguments: argument);
      },
    );
  }
}
