import 'package:flutter/material.dart';

import 'package:care_app/core/src/enums/my_enum.dart';
import 'package:care_app/core/src/provider/login_provider.dart';
import 'package:care_app/ui/components/my_text_form_field.dart';

import 'base_page.dart';

class PasswordResetPage extends StatefulWidget {
  static const String ID = 'passwordResetPage';

  @override
  _PasswordResetPageState createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _inputMail = TextEditingController();

  void cleanFields() {
    _inputMail.text = '';
  }

  //final API api = API();
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

    return BasePage<LoginProvider>(
      builder:
          (BuildContext context, LoginProvider loginProvider, Widget child) =>
              SafeArea(
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
                const SizedBox(
                  height: 10,
                ),
                if (loginProvider.state == ViewState.Busy)
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromRGBO(203, 99, 51, 1),
                    ),
                  ),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: const Color.fromRGBO(203, 99, 51, 1),
            child: MaterialButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  final Map<String, String> body = <String, String>{
                    'email': _inputMail.text,
                  };
                  final bool response = await loginProvider.resetPassword(body);

                  if (response) {
                    AlertDialog(
                      title: const Text('Restauración de Contraseña'),
                      content: const Text('Revisa tu correo electrónico'),
                      actions: <Widget>[
                        FlatButton(
                          child: const Text('Listo'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                    cleanFields();
                  } else {
                    AlertDialog(
                      title: const Text('Restauración de Contraseña'),
                      content: const Text('Ha surgido un problema. Vuelve a intentarlo más luego.'),
                      actions: <Widget>[
                        FlatButton(
                          child: const Text('Listo'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  }
                }
              },
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
      ),
    );
  }
}
