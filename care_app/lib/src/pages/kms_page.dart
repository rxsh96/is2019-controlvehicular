import 'package:flutter/material.dart';

class KilometrajePage extends StatefulWidget {
  KilometrajePage({Key key}) : super(key: key);

  _KilometrajePageState createState() => _KilometrajePageState();
}

class _KilometrajePageState extends State<KilometrajePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text('Kilometraje Page')),
    );
  }
}