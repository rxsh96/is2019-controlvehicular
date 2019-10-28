import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyMenuOptions extends StatefulWidget {
  const MyMenuOptions({this.optionName, this.icon, this.onTap});

  final String optionName;
  final String icon;
  final GestureTapCallback onTap;

  @override
  _MyMenuOptionsState createState() => _MyMenuOptionsState(
        optionName: optionName,
        icon: icon,
        onTap: onTap,
      );
}

class _MyMenuOptionsState extends State<MyMenuOptions> {
  _MyMenuOptionsState({this.optionName, this.icon, this.onTap});

  String optionName;
  String icon;
  GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        'images/$icon.png',
        width: 20,
        height: 20,
      ),
      title: Text(
        optionName,
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),

    );
  }
}

