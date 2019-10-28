import 'package:flutter/material.dart';

import 'package:care_app/services/backend/login_request.dart';
import 'package:care_app/extras/loader.dart';
import 'package:care_app/src/components/my_text_form_field.dart';
import 'package:care_app/src/components/my_pass_form_field.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:care_app/auth/auth.dart';
import 'package:care_app/login/login.dart';
import 'package:care_app/repository/user_repository.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  final UserRepository userRepository;

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocProvider(
        builder: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: LoginForm(),
      ),
    );
  }*/
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider<LoginBloc>(
          builder: (BuildContext context){
            return LoginBloc(
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
              userRepository: userRepository,
            );
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('images/careapp_logo.png', height: 200, width: 200,),
//                Container(
//                    child: SizedBox(
//                      height: 200.0,
//                      child: Image.asset(
//                        'images/careapp_logo.png',
//                        fit: BoxFit.contain,
//                      ),
//                    ),
//                ),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
/*class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {

    final Form myLoginForm = Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          MyTextFormField(
          controller: _mailController,
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
        child: Text(
          '¿Usuario nuevo en careapp? Regístrese ahora',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color.fromRGBO(203, 99, 51, 1),
            fontSize: 12,
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/addUserPage');
        },
      ),
    );

    final BottomAppBar loginButton = BottomAppBar(
      color: const Color.fromRGBO(203, 99, 51, 1),
      child: MaterialButton(
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            setState(() {
              _isLoading = true;
            });
            await requestLoginAPI(context, _mailController.text.toLowerCase(),
                _passwordController.text);
            setState(() {
              _isLoading = false;
            });
            return;
          }
        },
        child: Text(
          'Iniciar Sesión',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

    Widget showLoader;
    setState(() {
      if(_isLoading){
        showLoader = Loader();
      }
      else{
        showLoader = Container();
      }
    });

    return Scaffold(
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 200.0,
                    child: Image.asset(
                      'images/careapp_logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  myLoginForm,
                  const SizedBox(height: 25.0),
                  registerButton,
                  const SizedBox(height: 5.0),
                  showLoader,
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: loginButton,
    );
  }
}*/
