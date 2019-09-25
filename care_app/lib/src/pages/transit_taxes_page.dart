import 'package:flutter/material.dart';

class TransitTaxesPage extends StatefulWidget {
  TransitTaxesPage({Key key}) : super(key: key);

  _TransitTaxesPageState createState() => _TransitTaxesPageState();
}

class _TransitTaxesPageState extends State<TransitTaxesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text('Multas Page')),
    );
  }
}