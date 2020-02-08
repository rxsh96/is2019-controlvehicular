import 'package:flutter/material.dart';

import 'package:care_app/core/src/models/user_model.dart';
import 'package:care_app/core/src/provider/vehicle_provider.dart';
import 'package:care_app/ui/forms/add_vehicle_form.dart';
import 'package:care_app/ui/pages/base_page.dart';

class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage(this._user);

  final User _user;

  static const String ID = 'addVehiclePage';

  @override
  _AddVehiclePageState createState() => _AddVehiclePageState(_user);
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  _AddVehiclePageState(this._user);

  final User _user;

  @override
  Widget build(BuildContext context) {
    return BasePage<VehicleProvider>(
      builder:
          (BuildContext context, VehicleProvider vehicleProvider, Widget child) =>
          SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text('Registrar Vehículo', style: TextStyle(fontSize: 16),),
                    ),
                    Image.asset(
                      'images/logo2.png',
                      fit: BoxFit.contain,
                      height: 32,
                    ),
                  ],
                ),
              ),
              body: ListView(
                padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30.0),
                children: <Widget>[
                  AddVehicleForm(_user),
                ],
              ),
            ),
          ),
    );
  }



}
