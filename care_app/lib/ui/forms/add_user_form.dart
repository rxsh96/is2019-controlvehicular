import 'package:care_app/core/src/enums/my_enum.dart';
import 'package:care_app/core/src/provider/login_provider.dart';
import 'package:care_app/ui/components/my_password_form_field.dart';
import 'package:care_app/ui/components/my_text_form_field.dart';
import 'package:care_app/ui/pages/login_page.dart';
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

  //File _image;

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder:
        (BuildContext context, LoginProvider loginProvider, Widget widget) =>
            Container(
              child: Column(
                children: <Widget>[
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
                      icon: Icons.enhanced_encryption,
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
                      final bool response = await loginProvider.saveUser(userMap);
                          if (!response) {
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Ha surgido un problema. Inténtalo de nuevo.'),
                              ),
                            );
                          } else {
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('¡Registro exitoso!'),
                              ),
                            );
                            await Future<dynamic>.delayed(Duration(seconds: 3));
                            Navigator.pushNamed(context, LoginPage.ID);
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
