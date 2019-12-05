import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:care_app/core/src/provider/vehicle_provider.dart';
import 'package:care_app/ui/components/app_bar_action_button.dart';
import 'package:care_app/ui/forms/add_vehicle_form.dart';
import 'package:care_app/ui/pages/base_page.dart';


class AddVehiclePage extends StatefulWidget {
  static const String ID = 'addVehiclePage';

  @override
  _AddVehiclePageState createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {

  File _image;

  Future<void> getImageFromGallery() async {
    final File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future<void> getImageFromCamera() async {
    final File image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage<VehicleProvider>(
      builder: (BuildContext context, VehicleProvider vehicleProvider,
              Widget child) =>
          SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'AÑADIR VEHÍCULO',
              style: TextStyle(fontSize: 16),
            ),
            actions: <Widget>[
              AppBarButton(
                icon: Icons.camera_alt,
                color: const Color.fromRGBO(203, 99, 51, 1),
                function: getImageFromCamera,
              ),
              AppBarButton(
                icon: Icons.folder_open,
                color: const Color.fromRGBO(203, 99, 51, 1),
                function: getImageFromGallery,
              ),
            ],
          ),
          body: AddVehicleForm(_image),
        ),
      ),
    );
  }
}
