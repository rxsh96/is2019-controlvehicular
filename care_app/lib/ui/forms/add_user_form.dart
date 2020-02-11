import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:care_app/core/src/enums/my_enum.dart';
import 'package:care_app/core/src/provider/login_provider.dart';
import 'package:care_app/ui/components/my_password_form_field.dart';
import 'package:care_app/ui/components/my_text_form_field.dart';


class AddUserForm extends StatefulWidget {
  @override
  _AddUserFormState createState() => _AddUserFormState();
}

class _AddUserFormState extends State<AddUserForm> {

  final TextEditingController _inputName = TextEditingController();
  final TextEditingController _inputLastName = TextEditingController();
  final TextEditingController _inputMail = TextEditingController();
  final TextEditingController _inputPassword = TextEditingController();
  final TextEditingController _inputPhone = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  File _image;

  Future<void> getImageFromGallery() async {
    final File image = await ImagePicker.pickImage(source: ImageSource.gallery, maxWidth: 512.0, maxHeight: 512.0,);
    setState(() {
      _image = image;
    });
  }

  void cleanFields(){
    _inputPassword.text = _inputPhone.text = _inputLastName.text = _inputName.text = _inputMail.text = '';
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder:
          (BuildContext context, LoginProvider loginProvider, Widget widget) =>
              Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: RawMaterialButton(
                  child: Container(
                    child: _image == null
                        ? CircleAvatar(
                      child: Icon(
                        Icons.add_a_photo,
                        size: 50.0,
                        color: Colors.white,
                      ),
                      backgroundColor: const Color.fromRGBO(203, 99, 51, 1),
                      radius: 50.0,
                    )
                        : CircleAvatar(
                      backgroundImage: FileImage(_image),
                      radius: 50.0,
                      backgroundColor: const Color.fromRGBO(203, 99, 51, 1),
                    ),
                  ),
                  onPressed: getImageFromGallery,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 15.0),
                  MyTextFormField(
                      controller: _inputName,
                      capitalization: TextCapitalization.words,
                      textInputType: TextInputType.text,
                      label: 'Nombres',
                      icon: Icons.font_download,
                      errorMsg: 'Ingresa tu nombre'),
                  const SizedBox(height: 15.0),
                  MyTextFormField(
                      controller: _inputLastName,
                      capitalization: TextCapitalization.words,
                      textInputType: TextInputType.text,
                      label: 'Apellido',
                      icon: Icons.font_download,
                      errorMsg: 'Ingresa tu apellido'),
                  const SizedBox(height: 15.0),
                  MyTextFormField(
                      controller: _inputPhone,
                      capitalization: TextCapitalization.none,
                      textInputType: TextInputType.phone,
                      label: 'Teléfono',
                      icon: Icons.phone,
                      errorMsg: 'Ingresa tu teléfono'),
                  const SizedBox(height: 15.0),
                  MyTextFormField(
                      controller: _inputMail,
                      capitalization: TextCapitalization.none,
                      textInputType: TextInputType.emailAddress,
                      label: 'Correo Electrónico',
                      icon: Icons.mail,
                      errorMsg: 'Ingresa tu correo electrónico'),
                  const SizedBox(height: 15.0),
                  MyPassFormField(
                    controller: _inputPassword,
                    textInputType: TextInputType.text,
                    label: 'Contraseña',
                    errorMsg: 'Ingresa una contraseña',
                    isLogin: false,
                  ),
                  const SizedBox(height: 35.0),
                ],
              ),
            ),
            if (loginProvider.state == ViewState.Busy)
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromRGBO(203, 99, 51, 1),
                ),
              ),
            if (loginProvider.state == ViewState.Idle)
              MaterialButton(
                color: const Color.fromRGBO(203, 99, 51, 1),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {

                    final Map<String, String> userMap = <String, String>{
                      'name': _inputName.text,
                      'lastname': _inputLastName.text,
                      'phone_number': _inputPhone.text,
                      'email': _inputMail.text.toLowerCase(),
                      'password': _inputPassword.text,
                      'is_active': 'true'
                    };
                    final Map<String, dynamic> response = await loginProvider.saveUser(userMap);

                    if (_image != null) {
                      final String downloadURL = await loginProvider.saveProfilePic(_inputMail.text, _image);
                      final Map<String, dynamic> imageMap = <String, dynamic>{
                        'file': downloadURL,
                        'user': response['id'].toString(),
                      };
                      await loginProvider.saveImage(imageMap);
                    }

                    if (response.containsKey('error')) {
                      Scaffold.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Ha surgido un problema. Inténtalo de nuevo.'),
                        ),
                      );
                    } else {
                      Scaffold.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('¡Registro exitoso!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      cleanFields();
                      await Future<dynamic>.delayed(const Duration(seconds: 2));
                      Navigator.pushNamed(context, '/');
                    }
                  }
                },
                child: const Text(
                  'Registrarme',
                  style: TextStyle(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
