import 'package:flutter/material.dart';

class GasolinaPage extends StatefulWidget {
  GasolinaPage({Key key}) : super(key: key);

  _GasolinaPageState createState() => _GasolinaPageState();
}

class _GasolinaPageState extends State<GasolinaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text('Gasolina Page')),
    );
  }
}