import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:care_app/api/api_service.dart';
import 'package:care_app/models/vehicle_model.dart';
import 'package:care_app/src/components/my_text_form_field.dart';

class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage({Key key}) : super(key: key);

  @override
  _AddVehiclePageState createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  File _image;

  Future<void> getImage() async {
    final File image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _licensePlateController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _lastMatController = TextEditingController();
  final TextEditingController _kmController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Form myCarForm = Form(
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
              errorMsg: 'Ingresa un nombre'),
          const SizedBox(height: 15.0),
          MyTextFormField(
              controller: _licensePlateController,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.text,
              label: 'Placa',
              hint: 'Formato: ABC-1234',
              icon: Icons.directions_car,
              errorMsg: 'Ingresa la placa del vehículo'),
          const SizedBox(height: 15.0),
          MyTextFormField(
              controller: _brandController,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.text,
              label: 'Marca',
              icon: Icons.directions_car,
              errorMsg: 'Ingresa la marca del vehículo'),
          const SizedBox(height: 15.0),
          MyTextFormField(
              controller: _modelController,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.text,
              label: 'Modelo',
              icon: Icons.directions_car,
              errorMsg: 'Ingresa el modelo del vehículo'),
          const SizedBox(height: 15.0),
          MyTextFormField(
              controller: _colorController,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.text,
              label: 'Color',
              icon: Icons.color_lens,
              errorMsg: 'Ingresa el color del vehículo'),
          const SizedBox(height: 15.0),
          MyTextFormField(
              controller: _yearController,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.number,
              label: 'Año',
              icon: Icons.timeline,
              errorMsg: 'Ingresa el año del vehículo'),
          const SizedBox(height: 15.0),
          MyTextFormField(
              controller: _lastMatController,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.datetime,
              label: 'Última Matrícula',
              hint: 'dd/MM/YYYY',
              icon: Icons.color_lens,
              errorMsg: 'Ingresa la última matrícula del vehículo'),
          const SizedBox(height: 15.0),
          MyTextFormField(
              controller: _kmController,
              capitalization: TextCapitalization.none,
              textInputType: TextInputType.number,
              label: 'Kilometraje',
              icon: Icons.directions_car,
              errorMsg: 'Ingresa el kilometraje del vehículo'),
          const SizedBox(height: 15.0),
          MyTextFormField(
              controller: _descriptionController,
              capitalization: TextCapitalization.sentences,
              textInputType: TextInputType.text,
              label: 'Descripción',
              icon: Icons.mode_comment,
              errorMsg: 'Ingresa una descripción para el vehículo'),
          const SizedBox(height: 35.0),
          Center(
            child: _image == null
                ? Text(
                    'Agregue una foto de su Vehículo',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  )
                : Text(
                    'Foto de su Vehículo',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
          ),
          Center(
            child: RawMaterialButton(
              child: Container(
                child: _image == null
                    ? Icon(
                        Icons.add_a_photo,
                        size: 75.0,
                      )
                    : Image(
                        image: FileImage(_image),
                        height: 200.0,
                        width: 300.0,
                      ),
              ),
              onPressed: getImage,
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AÑADIR VEHÍCULO',
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: myCarForm,
      bottomNavigationBar: _submitVehicle(),
    );
  }

  void registerVehicle() {
    if (_formKey.currentState.validate()) {
      final Map<String, String> body = <String, String>{
        'brand': _brandController.text,
        'model': _modelController.text,
        'plate': _licensePlateController.text,
        'color': _colorController.text,
        'year': _yearController.text,
        'description': _descriptionController.text,
        'km': _kmController.text,
        'is_active': 'true',
      };
      ApiService.internal().post<Vehicle>('vehicle/', body: body);
    }
  }

  Widget _submitVehicle() {
    return BottomAppBar(
      color: const Color.fromRGBO(203, 99, 51, 1),
      child: MaterialButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            registerVehicle();
            Navigator.pushNamed(context, '/vehiclePage');
          }
          return;
        },
        child: Text(
          'GUARDAR',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
