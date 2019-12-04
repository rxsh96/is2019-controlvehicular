import 'dart:io';

import 'package:care_app/core/src/provider/login_provider.dart';
import 'package:care_app/ui/components/my_password_form_field.dart';
import 'package:care_app/ui/components/my_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {

    final Form myUserForm = Form(
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
            icon: Icons.enhanced_encryption,
            errorMsg: 'Ingresa una contraseña',
            isLogin: false,
          ),
          const SizedBox(height: 35.0),
        ],
      ),
    );

    return Consumer<LoginProvider>(
      builder: (BuildContext context, LoginProvider loginProvider, _) =>
          Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('Registro', style: TextStyle(fontSize: 18)),
              Image.asset(
                'images/logo2.png',
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30.0),
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
                              backgroundColor:
                                  const Color.fromRGBO(203, 99, 51, 1),
                              radius: 50.0,
                            )
                          : CircleAvatar(
                              backgroundImage: FileImage(_image),
                              radius: 50.0,
                              backgroundColor:
                                  const Color.fromRGBO(203, 99, 51, 1),
                            ),
                    ),
                    onPressed: () {}),
              ),
            ),
            myUserForm,
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color.fromRGBO(203, 99, 51, 1),
          child: MaterialButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {}
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
