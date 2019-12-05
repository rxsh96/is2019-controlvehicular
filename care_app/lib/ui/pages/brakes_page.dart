import 'package:flutter/material.dart';

class BrakesPage extends StatefulWidget {
  const BrakesPage({Key key}) : super(key: key);

  @override
  _BrakesPageState createState() => _BrakesPageState();
}

class _BrakesPageState extends State<BrakesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: const Text('Frenos Page')),
    );
  }
}