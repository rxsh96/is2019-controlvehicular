import 'dart:io';

import 'package:care_app/ui/pages/vehicle_page.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:care_app/core/src/enums/view_state_enum.dart';
import 'package:care_app/core/src/models/brand_model.dart';
import 'package:care_app/core/src/models/model_model.dart';
import 'package:care_app/core/src/models/user_model.dart';
import 'package:care_app/core/src/provider/vehicle_provider.dart';
import 'package:care_app/ui/components/my_text_form_field.dart';


class AddVehicleForm extends StatefulWidget {
  const AddVehicleForm(this._user);

  final User _user;

  @override
  _AddVehicleFormState createState() => _AddVehicleFormState(_user);
}

class _AddVehicleFormState extends State<AddVehicleForm> {
  _AddVehicleFormState(this._user);

  User _user;

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

  Future<void> getImageFromGallery() async {
    final File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  void cleanFields() {
    _nameController.text = _licensePlateController.text =
        _brandController.text = _modelController.text = _colorController.text =
            _yearController.text = _lastMatController.text =
                _kmController.text = _descriptionController.text = '';
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VehicleProvider>(
        builder: (BuildContext context, VehicleProvider vehicleProvider, _) {

      final List<String> models = <String>[];
      for (ModelModel v in vehicleProvider.models) {
        models.add(v.model);
      }

      final List<String> brands = <String>[];
      for (BrandModel b in vehicleProvider.brands) {
        brands.add(b.brand);
      }

      final Map<dynamic, dynamic> brandModel = <dynamic, dynamic>{};
      for(int brand = 0 ; brand < vehicleProvider.brands.length; brand++){
        for(int model = 0; model < vehicleProvider.models.length; model++){
          if(vehicleProvider.brands[brand].id == vehicleProvider.models[model].brand){
            brandModel[vehicleProvider.brands[brand].brand] = vehicleProvider.models[model].model;
          }
        }
      }



      return Scaffold(
        body: Form(
          key: _formKey,
          child: ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
            children: <Widget>[
              const SizedBox(height: 15.0),
              Center(
                child: RawMaterialButton(
                  child: Container(
                    child: _image == null
                        ? CircleAvatar(
                            child: Icon(
                              Icons.directions_car,
                              size: 80.0,
                              color: Colors.black,
                            ),
                            backgroundColor:
                                const Color.fromRGBO(203, 99, 51, 1),
                            radius: 80.0,
                          )
                        : CircleAvatar(
                            backgroundImage: FileImage(_image),
                            radius: 80.0,
                            backgroundColor:
                                const Color.fromRGBO(203, 99, 51, 1),
                          ),
                  ),
                  onPressed: getImageFromGallery,
                ),
              ),
              const SizedBox(height: 35.0),
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
              DropDownField(
                value: 'Ingresa tu marca',
                itemsVisibleInDropdown: 1,
                icon: Icon(Icons.directions_car),
                labelText: 'Marca',
                items: brands,
                strict: false,
                onValueChanged: (dynamic value) {
                  final int index = brands.indexOf(value) + 1;
                  print('EL INDEX DE LA MARCA ES: $index');
                  _brandController.text = index.toString();
                },
              ),
              const SizedBox(height: 15.0),
              DropDownField(
                value: 'Ingresa tu modelo',
                itemsVisibleInDropdown: 1,
                icon: Icon(Icons.directions_car),
                labelText: 'Modelo',
                items: models,
                strict: false,
                onValueChanged: (dynamic value) {
                  final int index = models.indexOf(value) + 1;
                  print('EL INDEX DEL MODELO ES: $index');
                  _modelController.text = index.toString();
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
              if (vehicleProvider.state == ViewState.Busy)
                const CircularProgressIndicator(
                  
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(203, 99, 51, 1),
                  ),
                ),
              if (vehicleProvider.state == ViewState.Idle)
                MaterialButton(
                  color: const Color.fromRGBO(203, 99, 51, 1),
                  onPressed: () async {
                    if (_formKey.currentState.validate() && _image != null) {
                      final String imgResponse =
                          await vehicleProvider.saveVehiclePic(_user, _image);
                      final Map<String, dynamic> vehicle = <String, dynamic>{
                        'plate': _licensePlateController.text.toUpperCase(),
                        'brand': _brandController.text.toString(),
                        'model': _modelController.text.toString(),
                        'color': _colorController.text,
                        'year': _yearController.text.toString(),
                        'km': _kmController.text,
                        'description': _descriptionController.text,
                        'owner': _user.id.toString(),
                        'is_active': 'true',
                        'imageURL': imgResponse.toString(),
                      };
                      final Map<String, dynamic> response =
                          await vehicleProvider.saveVehicle(vehicle);

                      if (response.containsKey('error')) {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: const Text(
                                'Ha surgido un problema. Inténtalo de nuevo.'),
                          ),
                        );
                      } else {
                        
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('¡Registro exitoso!'),
                          ),
                          //Navigator.pushNamed(context, VehiclePage.ID)

                        );
                        cleanFields();
                      }
                    }
                  },
                  child: const Text(
                    'Añadir Vehículo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
