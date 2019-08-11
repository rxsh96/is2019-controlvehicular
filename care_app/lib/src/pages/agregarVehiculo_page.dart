import 'package:flutter/material.dart';

class AgregarVehiculoPage extends StatefulWidget {
  AgregarVehiculoPage({Key key}) : super(key: key);

  _AgregarVehiculoPageState createState() => _AgregarVehiculoPageState();
}

class _AgregarVehiculoPageState extends State<AgregarVehiculoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Agregar vehículo'))
    );
  }
}