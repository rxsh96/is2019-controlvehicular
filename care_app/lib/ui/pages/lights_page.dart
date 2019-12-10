import 'package:flutter/material.dart';

class LightsPage extends StatefulWidget {
  const LightsPage({Key key}) : super(key: key);

  @override
  _LightsPageState createState() => _LightsPageState();
}

class _LightsPageState extends State<LightsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(child: const Text('Luces Page')),
    );
  }
}