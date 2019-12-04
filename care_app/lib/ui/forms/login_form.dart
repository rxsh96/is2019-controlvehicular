
import 'package:care_app/core/src/enums/view_state_enum.dart';
import 'package:care_app/core/src/provider/login_provider.dart';
import 'package:care_app/ui/components/my_password_form_field.dart';
import 'package:care_app/ui/components/my_text_form_field.dart';
import 'package:care_app/ui/pages/add_user_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final Form myLoginForm = Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          MyTextFormField(
            controller: _usernameController,
            capitalization: TextCapitalization.none,
            textInputType: TextInputType.emailAddress,
            label: 'Correo Electrónico',
            icon: Icons.mail,
            errorMsg: 'Ingresa tu correo electrónico',
          ),
          const SizedBox(height: 10.0),
          MyPassFormField(
            controller: _passwordController,
            textInputType: TextInputType.text,
            label: 'Contraseña',
            icon: Icons.vpn_key,
            errorMsg: 'Ingresa tu contraseña',
            isLogin: true,
          ),
        ],
      ),
    );

    final Material registerButton = Material(
      child: MaterialButton(
        child: const Text(
          '¿Usuario nuevo en careapp? Regístrese ahora',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(203, 99, 51, 1),
            fontSize: 12,
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, AddUserPage.ID);
        },
      ),
    );

    final Material forgotButton = Material(
      child: MaterialButton(
        child: const Text(
          '¿Olvidaste tu contraseña?',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(203, 99, 51, 1),
            fontSize: 12,
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/resetPasswordPage');
        },
      ),
    );

    return Consumer<LoginProvider>(
      builder:
          (BuildContext context, LoginProvider loginProvider, Widget widget) =>
              Container(
        child: Column(
          children: <Widget>[
            myLoginForm,
            const SizedBox(height: 25.0),
            registerButton,
            const SizedBox(height: 5.0),
            forgotButton,
            const SizedBox(height: 5.0),
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
                    final bool response = await loginProvider.signIn(
                        _usernameController.text, _passwordController.text);
                    if (!response) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Credenciales Inválidas'),
                        ),
                      );
                    } else {
                      Navigator.pushNamed(context, '/');
                    }
                  }
                },
                child: const Text(
                  'Iniciar Sesión',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}
