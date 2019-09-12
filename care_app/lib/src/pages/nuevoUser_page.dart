import 'package:flutter/material.dart';
import 'package:care_app/api/apiService.dart';

class NuevoUserPage extends StatefulWidget {
  NuevoUserPage({Key key}) : super(key: key);

  _NuevoUserPageState createState() => _NuevoUserPageState();
}

class _NuevoUserPageState extends State<NuevoUserPage> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _inputNombre = TextEditingController();
  final TextEditingController _inputApellido = TextEditingController();
  final TextEditingController _inputMail = TextEditingController();
  final TextEditingController _inputContrasena = TextEditingController();
  final TextEditingController _inputTelefono = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final myUserForm = Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(height: 15.0),
          _crearInput(Icons.font_download, 'Nombres', 'Ingrese sus Nombres',
              _inputNombre),
          SizedBox(height: 15.0),
          _crearInput(Icons.font_download, 'Apellidos',
              'Ingrese sus apellidos', _inputApellido),
          SizedBox(height: 15.0),
          _crearInputTelefono(
              Icons.phone, 'Teléfono', 'Ingrese su número de teléfono'),
          SizedBox(height: 15.0),
          _crearInputCorreo(
              Icons.email, 'Correo', 'Ingrese su dirección de correo'),
          SizedBox(height: 15.0),
          _crearInputContrasena(
              Icons.vpn_key, 'Contraseña', 'Ingrese su contraseña'),
          SizedBox(height: 35.0),
        ],
      ),
    );

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Registro", style: TextStyle(fontSize: 18)),
                Image.asset(
                  'images/logo2.png',
                  fit: BoxFit.contain,
                )
              ],
            ),
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 30.0),
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                      child: Center(
                    child: CircleAvatar(
                        maxRadius: 75.0,
                        backgroundColor: Colors.red,
                        backgroundImage: AssetImage('images/no-image.png')),
                  ))
                ],
              ),
              //SizedBox(height: 15.0),
              //_crearInput(Icons.account_box, 'Usuario ', 'Ingrese su usuario', _inputUsuario),
              myUserForm,
              Container(
                child: _submitUser(),
              )
            ],
          )
          //onTap: () { Navigator.pop(context);}
          ),
    );
  }

  Widget _crearInput(IconData icon, String label, String hint,
      TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(203, 99, 51, 1),
          ),
        ),
        suffixIcon: Icon(icon),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Ingresa tus datos';
        }
        return null;
      },
    );
  }

  Widget _crearInputCorreo(IconData icon, String label, String hint) {
    return TextFormField(
      controller: _inputMail,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(203, 99, 51, 1),
            ),
          ),
          suffixIcon: Icon(icon)),
      validator: (value) {
        if (value.isEmpty) {
          return 'Ingresa tu correo';
        }
        return null;
      },
    );
  }

  Widget _crearInputTelefono(IconData icon, String label, String hint) {
    return TextFormField(
      controller: _inputTelefono,
      keyboardType: TextInputType.phone,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(203, 99, 51, 1),
            ),
          ),
          suffixIcon: Icon(icon)),
      validator: (value) {
        if (value.isEmpty) {
          return 'Ingresa tu número de teléfono';
        }
        return null;
      },
    );
  }

  Widget _crearInputContrasena(IconData icon, String label, String hint) {
    return TextFormField(
      controller: _inputContrasena,
      obscureText: true,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(203, 99, 51, 1),
          ),
        ),
        suffixIcon: Icon(icon),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Ingresa una contraseña';
        }
        return null;
      },
    );
  }

  void registerUser(){
    if (_formKey.currentState.validate()) {
      Map<String, String> body = {
        "name": _inputNombre.text,
        "lastname": _inputApellido.text,
        "phone_number": _inputTelefono.text,
        "email": _inputMail.text.toLowerCase(),
        "password": _inputContrasena.text,
        "is_active": "true"
      };
      print('dentro del if');
      ApiService.internal().post('users/', body: body);
      Navigator.pushNamed(context, '/login');
    }
    print('fuera del if');
  }

//No se como tomar un widget de otra clase .
//Aquí podriamos reutilizar el widget CREAR FRANJA de Vehiculos_page

  Widget _submitUser() {
    return BottomAppBar(
      color: Color.fromRGBO(203, 99, 51, 1),
      child: MaterialButton(
        onPressed: () {
          registerUser();
        },
        child: Text(
          "REGISTRARSE",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
