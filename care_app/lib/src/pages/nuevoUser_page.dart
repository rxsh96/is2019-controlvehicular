import 'package:flutter/material.dart';
import 'package:care_app/api/apiService.dart';

class NuevoUserPage extends StatefulWidget {
  NuevoUserPage({Key key}) : super(key: key);

  _NuevoUserPageState createState() => _NuevoUserPageState();
}

class _NuevoUserPageState extends State<NuevoUserPage> {

  final TextEditingController _inputUsuario = TextEditingController();
  final TextEditingController _inputNombre = TextEditingController();
  final TextEditingController _inputApellido = TextEditingController();
  final TextEditingController _inputMail = TextEditingController();
  final TextEditingController _inputContrasena = TextEditingController();
  final TextEditingController _inputTelefono = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PERFIL", style: TextStyle(fontSize: 17)),
          actions: <Widget>[
            IconButton(
                //Me ingenié esta forma de regresar al page, no sé como se realiza de verdad
                icon: Icon(Icons.arrow_back),
                color: Color.fromRGBO(255, 255, 255, 1),
                onPressed: () {
                  Navigator.pop(context);
                }),
            IconButton(
              onPressed: () {},
              icon: Image.asset('images/logo.png'),
              //tooltip: 'Prueba'
            )
          ],
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
            SizedBox(height: 15.0),
            _crearInputUsuario(Icons.account_box, 'Usuario ', 'Ingrese su usuario'),
            SizedBox(height: 15.0),
            _crearInputNombre(Icons.font_download, 'Nombres', 'Ingrese sus Nombres'),
            SizedBox(height: 15.0),
            _crearInputApellido(Icons.font_download, 'Apellidos', 'Ingrese sus apellidos'),
            SizedBox(height: 15.0),
            _crearInputTelefono(Icons.phone, 'Teléfono', 'Ingrese su número de teléfono'),
            SizedBox(height: 15.0),
            _crearInputMail(Icons.email, 'Correo', 'Ingrese su dirección de correo'),
            SizedBox(height: 15.0),
            _crearInputContrasena(Icons.vpn_key, 'Contraseña', 'Ingrese su contraseña'),
            SizedBox(height: 35.0),
            Container(
              child: _submitVehiculo(),
            )
          ],
        )
        //onTap: () { Navigator.pop(context);}
        );
  }

  Widget _crearInputUsuario(IconData icon, String label, String hint) {
    return TextField(
      controller: _inputUsuario,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          //counter: Text('Letras 0'),
          //helperText: 'Solo es el nombre',
          labelText: label,
          hintText: hint,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Color.fromRGBO(203, 99, 51, 1),
          )),
          suffixIcon: Icon(icon)
          /*
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      )
      */

          ),
    );
  }

  Widget _crearInputNombre(IconData icon, String label, String hint) {
    return TextField(
      controller: _inputNombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        //counter: Text('Letras 0'),
        //helperText: 'Solo es el nombre',
          labelText: label,
          hintText: hint,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(203, 99, 51, 1),
              )),
          suffixIcon: Icon(icon)
        /*
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      )
      */

      ),
    );
  }

  Widget _crearInputApellido(IconData icon, String label, String hint) {
    return TextField(
      controller: _inputApellido,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        //counter: Text('Letras 0'),
        //helperText: 'Solo es el nombre',
          labelText: label,
          hintText: hint,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(203, 99, 51, 1),
              )),
          suffixIcon: Icon(icon)
        /*
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      )
      */

      ),
    );
  }

  Widget _crearInputMail(IconData icon, String label, String hint) {
    return TextField(
      controller: _inputMail,
      decoration: InputDecoration(
        //counter: Text('Letras 0'),
        //helperText: 'Solo es el nombre',
          labelText: label,
          hintText: hint,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(203, 99, 51, 1),
              )),
          suffixIcon: Icon(icon)
        /*
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      )
      */

      ),
    );
  }

  Widget _crearInputTelefono(IconData icon, String label, String hint) {
    return TextField(
      controller: _inputTelefono,
      keyboardType: TextInputType.phone,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          //counter: Text('Letras 0'),
          //helperText: 'Solo es el nombre',
          labelText: label,
          hintText: hint,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Color.fromRGBO(203, 99, 51, 1),
          )),
          suffixIcon: Icon(icon)
          /*
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      )
      */

          ),
    );
  }

  Widget _crearInputContrasena(IconData icon, String label, String hint) {
    return TextField(
      controller: _inputContrasena,
      obscureText: true,
      keyboardType: TextInputType.phone,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        //counter: Text('Letras 0'),
        //helperText: 'Solo es el nombre',
        labelText: label,
        hintText: hint,
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Color.fromRGBO(203, 99, 51, 1),
        )),
        suffixIcon: Icon(icon),

        /*
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      )
      */
      ),
    );
  }

//No se como tomar un widget de otra clase .
//Aquí podriamos reutilizar el widget CREAR FRANJA de Vehiculos_page

  Widget _submitVehiculo() {
    return BottomAppBar(
      color: Color.fromRGBO(203, 99, 51, 1),
      child: MaterialButton(
        onPressed: () {
          //TODO: llamar al metodo post de apiService

          Map<String, String> body = {
            "name": _inputNombre.text,
            "lastname": _inputApellido.text,
            "phone_number": _inputTelefono.text,
            "email": _inputMail.text.toLowerCase(),
            "password": _inputContrasena.text,
            "is_active": "true"
          };
          print(body);
          ApiService.internal().post('users/', body: body);

          Navigator.pushNamed(context, '/login');
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
