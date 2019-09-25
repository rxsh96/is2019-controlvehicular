import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:care_app/api/api_service.dart';
import 'package:care_app/src/components/my_text_form_field.dart';
import 'package:care_app/src/components/my_pass_form_field.dart';

class AddUserPage extends StatefulWidget {
  AddUserPage({Key key}) : super(key: key);

  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _inputNombre = TextEditingController();
  final TextEditingController _inputApellido = TextEditingController();
  final TextEditingController _inputMail = TextEditingController();
  final TextEditingController _inputContrasena = TextEditingController();
  final TextEditingController _inputTelefono = TextEditingController();
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myUserForm = Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(height: 15.0),
          MyTextFormField(
              controller: _inputNombre,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.text,
              label: 'Nombres',
              icon: Icons.font_download,
              errorMsg: 'Ingresa tu nombre'),
          SizedBox(height: 15.0),
          MyTextFormField(
              controller: _inputApellido,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.text,
              label: 'Apellido',
              icon: Icons.font_download,
              errorMsg: 'Ingresa tu apellido'),
          SizedBox(height: 15.0),
          MyTextFormField(
              controller: _inputTelefono,
              capitalization: TextCapitalization.none,
              textInputType: TextInputType.phone,
              label: 'Teléfono',
              icon: Icons.phone,
              errorMsg: 'Ingresa tu teléfono'),
          SizedBox(height: 15.0),
          MyTextFormField(
              controller: _inputMail,
              capitalization: TextCapitalization.none,
              textInputType: TextInputType.emailAddress,
              label: 'Correo Electrónico',
              icon: Icons.mail,
              errorMsg: 'Ingresa tu correo electrónico'),
          SizedBox(height: 15.0),
          MyPassFormField(
            controller: _inputContrasena,
            textInputType: TextInputType.text,
            label: 'Contraseña',
            icon: Icons.enhanced_encryption,
            errorMsg: 'Ingresa una contraseña',
            isLogin: false,
          ),
          SizedBox(height: 35.0),
        ],
      ),
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Registro", style: TextStyle(fontSize: 18)),
              Image.asset(
                'images/logo2.png',
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 30.0),
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
                            backgroundColor: Color.fromRGBO(203, 99, 51, 1),
                            radius: 50.0,
                          )
                        : CircleAvatar(
                            backgroundImage: FileImage(_image),
                            radius: 50.0,
                            backgroundColor: Color.fromRGBO(203, 99, 51, 1),
                          ),
                  ),
                  onPressed: getImage,
                ),
              ),
            ),
            myUserForm,
          ],
        ),
        bottomNavigationBar: _submitUser(),
        //onTap: () { Navigator.pop(context);}
      ),
    );
  }

  void registerUser() {
    if (_formKey.currentState.validate()) {
      Map<String, String> body = {
        "name": _inputNombre.text,
        "lastname": _inputApellido.text,
        "phone_number": _inputTelefono.text,
        "email": _inputMail.text.toLowerCase(),
        "password": _inputContrasena.text,
        "is_active": "true"
      };
      ApiService.internal().post('users/', body: body);
      Navigator.pushNamed(context, '/login');
    }
  }

  Widget _submitUser() {
    return BottomAppBar(
      color: Color.fromRGBO(203, 99, 51, 1),
      child: MaterialButton(
        onPressed: () {
          registerUser();
        },
        child: Text(
          "REGISTRARSE",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
