import 'dart:async';
import 'package:flutter/material.dart';
import 'package:care_app/src/components/my_text_form_field.dart';
import 'package:care_app/services/backend/api.dart';
import 'package:care_app/extras/show_dialog.dart';

class PasswordResetPage extends StatefulWidget {
  @override
  _PasswordResetPageState createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _inputMail = TextEditingController();
  final API api = API();
  @override
  Widget build(BuildContext context) {
    final Form myPasswordForm = Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 15.0),
          MyTextFormField(
              controller: _inputMail,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.emailAddress,
              label: 'Correo',
              icon: Icons.mail,
              errorMsg: 'Ingresa tu dirección de correo'),
          const SizedBox(height: 15.0),
        ],
      ),
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Contraseña Olvidada',
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            //padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Restablecimiento de Contraseña',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Pon la dirección de correo electrónico que usaste para '
                'registrarte. Te enviaremos un correo con un enlace para r'
                'establecer tu contraseña.',
                textAlign: TextAlign.center,
              ),
              myPasswordForm,
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color.fromRGBO(203, 99, 51, 1),
          child: MaterialButton(
            onPressed: sendEmail,
            child: const Text(
              'Aceptar',
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

  Future<void> sendEmail() async {
    if (_formKey.currentState.validate()) {
      final Map<String, String> body = <String, String>{
        'email': _inputMail.text,
      };
      await api.postReset(body: body)
          ? showSimpleDialog<String>(context, 'Genial', 'Correo enviado con éxito', 'Ok') :
      showSimpleDialog<String>(context, 'Lo sentimos', 'Inténtalo de nuevo más tarde', 'Ok');
    }
  }
}
