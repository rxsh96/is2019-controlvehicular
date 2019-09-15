import 'package:care_app/api/loginRequest.dart';
import 'package:flutter/material.dart';
import 'package:care_app/Extras/loader.dart';
import 'package:care_app/src/components/myTextFormField.dart';
import 'package:care_app/src/components/myPassFormField.dart';

class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final myLoginForm = Form(
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
          SizedBox(height: 10.0),
          MyPassFormField(
            controller: _passwordController,
            textInputType: TextInputType.text,
            label: 'Contraseña',
            icon: Icons.enhanced_encryption,
            errorMsg: 'Ingresa tu contraseña',
          ),
        ],
      ),
    );

    final registerButton = Material(
      child: MaterialButton(
        child: Text(
          "¿Usuario nuevo en careapp? Regístrese ahora",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(203, 99, 51, 1),
            fontSize: 12,
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/nuevoUser');
        },
      ),
    );

    final loginButton = BottomAppBar(
      color: Color.fromRGBO(203, 99, 51, 1),
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
          "Iniciar Sesión",
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
        showLoader = new Loader();
      }
      else{
        showLoader = new Container();
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
                      "images/careapp_logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  myLoginForm,
                  SizedBox(height: 25.0),
                  registerButton,
                  SizedBox(height: 5.0),
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
}
