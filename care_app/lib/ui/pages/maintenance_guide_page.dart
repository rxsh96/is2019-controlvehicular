import 'package:flutter/material.dart';


class MaintenanceGuidePage extends StatelessWidget {

  const MaintenanceGuidePage(this.modelID);
  final int modelID;

  static const String ID = 'maintenanceGuidePage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Guía de Mantenimiento',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Image.asset(
                'images/logo2.png',
                fit: BoxFit.contain,
                height: 32,
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text('HOLA')),
        ),
      ),
    );
  }
}
