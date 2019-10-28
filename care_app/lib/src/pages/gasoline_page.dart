import 'package:flutter/material.dart';

class GasolinePage extends StatefulWidget {
  GasolinePage({Key key}) : super(key: key);

  _GasolinePageState createState() => _GasolinePageState();
}

class _GasolinePageState extends State<GasolinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: const Text('Gasolina Page')),
    );
  }
}