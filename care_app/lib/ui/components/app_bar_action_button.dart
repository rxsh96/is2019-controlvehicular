import 'package:flutter/material.dart';

class AppBarButton extends StatefulWidget {
  const AppBarButton({this.icon, this.color, this.function});

  final IconData icon;
  final Color color;
  final Function function;

  @override
  _AppBarButton createState() =>
      _AppBarButton(icon: icon, color: color, function: function);
}

class _AppBarButton extends State<AppBarButton> {
  _AppBarButton({this.icon, this.color, this.function});

  final IconData icon;
  final Color color;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      color: color,
      onPressed: function,
    );
  }
}
