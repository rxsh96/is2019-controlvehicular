import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      home: MyLoginPage(),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {

    final usernameField = TextField(
      obscureText: false,
      decoration: InputDecoration(
        hintText: "Nombre de Usuario",
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(203, 99, 51, 1),
          ),
        ),
      ),
    );

    final passwordField = TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Contraseña",
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(203, 99, 51, 1),
          ),
        ),
      ),
    );

    final registerButton = Material(
      child: MaterialButton(
        onPressed: () {},
        child: Text(
          "¿Usuario nuevo en careapp? Regístrese ahora",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromRGBO(203, 99, 51, 1),
            fontSize: 12,
          ),
        ),
      ),
    );

    final loginButton = BottomAppBar(
      color: Color.fromRGBO(203, 99, 51, 1),
      child: MaterialButton(
        onPressed: () {},
        child: Text(
          "Iniciar Sesión",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

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
                      "images/logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  usernameField,
                  SizedBox(height: 10.0),
                  passwordField,
                  SizedBox(height: 25.0),
                  registerButton,
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
