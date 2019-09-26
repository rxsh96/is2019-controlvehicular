import 'package:flutter/material.dart';

class VehicleRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {

    final backButton = Material(
      child: MaterialButton(
        color: Colors.black,
        onPressed: () {},
        child: Image(
          image: AssetImage('images/flecha_atras.png'),
          height: 20.0,
          width: 20.0,
        ),
      ),
    );

    final name = TextField(
      obscureText: false,
      decoration: InputDecoration(
        hintText: "Nombre",
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(203, 99, 51, 1),
          ),
        ),
      ),
    );

    final id = TextField(
      obscureText: false,
      decoration: InputDecoration(
        hintText: "Placa",
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(203, 99, 51, 1),
          ),
        ),
      ),
    );

    final marca = Column(
      children: <Widget>[
        Text("Marca"),
        Container(
          color: Color.fromRGBO(203, 99, 51, 1),
        ),
      ],
    );

    //final modelo;

    //final color;
//
    //final year;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: backButton,
        title: Text(
          'AÑADIR VEHÍCULO',
          style: TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(173, 170, 165, 1),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              name,
              SizedBox(height: 15.0),
              id,
            ],
          ),
        ),
      ),
    );
  }
}

