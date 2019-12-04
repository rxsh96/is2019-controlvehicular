import 'dart:io';
import 'package:care_app/core/src/models/vehicle_model.dart';
import 'package:care_app/core/src/provider/vehicle_provider.dart';
import 'package:care_app/ui/components/my_text_form_field.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddVehicleForm extends StatefulWidget {

  const AddVehicleForm(this._image);

  final File _image;

  @override
  _AddVehicleFormState createState() => _AddVehicleFormState(_image);
}

class _AddVehicleFormState extends State<AddVehicleForm> {

  _AddVehicleFormState(this._image);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _licensePlateController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _lastMatController = TextEditingController();
  final TextEditingController _kmController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  File _image;

  @override
  Widget build(BuildContext context) {
    return Consumer<VehicleProvider>(

      builder: (BuildContext context, VehicleProvider vehicleProvider, _) =>
    Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          children: <Widget>[
            const SizedBox(height: 15.0),
            MyTextFormField(
              controller: _nameController,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.text,
              label: 'Nombre',
              hint: 'Ejemplo: Mi Viajero - Mi Taxi - Personal',
              icon: Icons.account_box,
              errorMsg: 'Ingresa un nombre',
            ),
            const SizedBox(height: 15.0),
            MyTextFormField(
              controller: _licensePlateController,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.text,
              label: 'Placa',
              hint: 'Formato: ABC-1234',
              icon: Icons.directions_car,
              errorMsg: 'Ingresa la placa del vehículo',
            ),
            const SizedBox(height: 15.0),
//            MyTextFormField(
//              controller: _brandController,
//              capitalization: TextCapitalization.words,
//              textInputType: TextInputType.text,
//              label: 'Marca',
//              icon: Icons.directions_car,
//              errorMsg: 'Ingresa la marca del vehículo',
//            ),
            const SizedBox(height: 15.0),

              DropDownField(
                value: vehicleProvider.models[0].model,
                itemsVisibleInDropdown: 1,
                icon: Icon(Icons.directions_car),
                labelText: 'Modelo',
                items: vehicleProvider.models,
                strict: false,
                onValueChanged: (dynamic value) {

                },
              ),

              DropDownField(
                value: vehicleProvider.brands[0].brand,
                itemsVisibleInDropdown: 1,
                icon: Icon(Icons.directions_car),
                labelText: 'Marca',
                items: vehicleProvider.brands,
                strict: false,
                onValueChanged: (dynamic value) {

                },
              ),

            const SizedBox(height: 15.0),
            MyTextFormField(
              controller: _colorController,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.text,
              label: 'Color',
              icon: Icons.color_lens,
              errorMsg: 'Ingresa el color del vehículo',
            ),
            const SizedBox(height: 15.0),
            MyTextFormField(
              controller: _yearController,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.number,
              label: 'Año',
              icon: Icons.timeline,
              errorMsg: 'Ingresa el año del vehículo',
            ),
            const SizedBox(height: 15.0),
            MyTextFormField(
              controller: _lastMatController,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.datetime,
              label: 'Última Matrícula',
              hint: 'dd/MM/YYYY',
              icon: Icons.color_lens,
              errorMsg: 'Ingresa la última matrícula del vehículo',
            ),
            const SizedBox(height: 15.0),
            MyTextFormField(
              controller: _kmController,
              capitalization: TextCapitalization.none,
              textInputType: TextInputType.number,
              label: 'Kilometraje',
              icon: Icons.directions_car,
              errorMsg: 'Ingresa el kilometraje del vehículo',
            ),
            const SizedBox(height: 15.0),
            MyTextFormField(
              controller: _descriptionController,
              capitalization: TextCapitalization.sentences,
              textInputType: TextInputType.text,
              label: 'Descripción',
              icon: Icons.mode_comment,
              errorMsg: 'Ingresa una descripción para el vehículo',
            ),
            const SizedBox(height: 35.0),
            Center(
              child: Container(
                height: 50.0,
                child: _image == null
                    ? Icon(
                        Icons.add_a_photo,
                        size: 50.0,
                      )
                    : Image(
                        image: FileImage(_image),
                        height: 50.0,
                      ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromRGBO(203, 99, 51, 1),
        child: MaterialButton(
          onPressed: () {
            if (_formKey.currentState.validate()) {
              final Vehicle vehicle = Vehicle(
                plate: _licensePlateController.text,
                brand: int.parse(_brandController.text),
                model: int.parse(_modelController.text),
                color: _colorController.text,
                year: int.parse(_yearController.text),
                km: _kmController.text,
                description: _descriptionController.text,
              );
              print(vehicle.toString());
              print(Provider.of<VehicleProvider>(context));
//              Provider.of<VehicleProvider>(context).saveVehicle(vehicle);
//            vehicleProvider
//            registerVehicle();
//            Navigator.pushNamed(context, '/vehiclePage');
            }
          },
          child: const Text(
            'GUARDAR',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
    );
  }
}
