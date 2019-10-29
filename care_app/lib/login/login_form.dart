import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:care_app/extras/circular_loader.dart';
import 'package:care_app/login/login.dart';
import 'package:care_app/src/components/my_text_form_field.dart';
import 'package:care_app/src/components/my_pass_form_field.dart';

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
    void _onLoginButtonPressed() {
      if(_formKey.currentState.validate()){
        BlocProvider.of<LoginBloc>(context).add(
          LoginButtonPressed(
            username: _usernameController.text,
            password: _passwordController.text,
          ),
        );
      }
    }

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
              errorMsg: 'Ingresa tu correo electrónico'),
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
          Navigator.pushNamed(context, '/addUserPage');
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


    return BlocListener<LoginBloc, LoginState>(
      listener: (BuildContext context, LoginState state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (BuildContext context, LoginState state) {
          return Center(
            child: Column(
              children: <Widget>[
                myLoginForm,
                const SizedBox(height: 25.0),
                registerButton,
                const SizedBox(height: 5.0),
                forgotButton,
                const SizedBox(height: 5.0),
                MaterialButton(
                  color: const Color.fromRGBO(203, 99, 51, 1),
                  onPressed: state is! LoginLoading ? _onLoginButtonPressed : null,
                  child: const Text(
                    'Iniciar Sesión',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 15.0),
                Container(
                  child: state is LoginLoading
                      ? LoadingIndicator()
                      : null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
