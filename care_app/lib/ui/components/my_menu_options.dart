import 'package:flutter/material.dart';

class MyMenuOptions extends StatefulWidget {
  const MyMenuOptions({this.optionName, this.icon, this.route});

  final String optionName;
  final String icon;
  final String route;

  @override
  _MyMenuOptionsState createState() => _MyMenuOptionsState(
    optionName: optionName,
    icon: icon,
    route: route,
  );
}

class _MyMenuOptionsState extends State<MyMenuOptions> {
  _MyMenuOptionsState({this.optionName, this.icon, this.route});

  String optionName;
  String icon;
  String route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        'images/$icon.png',
        width: 20,
        height: 20,
      ),
      title: GestureDetector(
        child: Text(
          optionName,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
        onTap: () {
          Navigator.pushNamed(context, '$route');
        },
      ),
    );
  }
}
