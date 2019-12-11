import 'package:flutter/material.dart';

class TransitTaxesPage extends StatefulWidget {
  const TransitTaxesPage({Key key}) : super(key: key);

  @override
  _TransitTaxesPageState createState() => _TransitTaxesPageState();
}

class _TransitTaxesPageState extends State<TransitTaxesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: const Text('Multas Page')),
    );
  }
}