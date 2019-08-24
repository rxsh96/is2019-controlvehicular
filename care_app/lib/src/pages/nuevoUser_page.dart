import 'package:flutter/material.dart';

class NuevoUserPage extends StatefulWidget {
  NuevoUserPage({Key key}) : super(key: key);

  _NuevoUserPageState createState() => _NuevoUserPageState();
}

class _NuevoUserPageState extends State<NuevoUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PERFIL", style: TextStyle(fontSize: 17)),
        actions: <Widget>[
          IconButton(
            //Me ingenié esta forma de regresar al page, no sé como se realiza de verdad
            icon: Icon(Icons.arrow_back ),
            color: Color.fromRGBO(32, 32, 32, 1),
            onPressed: () { Navigator.pop(context);}

          ),
          IconButton(
            icon: Image.asset('images/logo.png'),
            tooltip: 'Closes application'
          )
        ],  
      ),
      
      body: ListView(
        padding: EdgeInsets.symmetric( horizontal: 12.0 , vertical: 30.0),
        children: <Widget>[
          
          Stack(children: <Widget>[
            Container(
              child: Center(child: CircleAvatar(
                maxRadius: 75.0,
                backgroundColor: Colors.red,
                
                backgroundImage:  AssetImage('images/no-image.png')),
                ))
            
          ],),
          _crearInput(Icons.account_box , 'Usuario ' , 'Ingrese su usuario'),
          SizedBox(height: 15.0),
          _crearInput(Icons.font_download, 'Nombres' , 'Ingrese sus Nombres'),
          SizedBox(height: 15.0),
          _crearInput(Icons.font_download , 'Apellidos', 'Ingrese sus apellidos'),
          SizedBox(height: 15.0),
          _crearInputTelefono(Icons.phone , 'Teléfono' , 'Ingrese su número de teléfono'),
          SizedBox(height: 15.0),
          _crearInput(Icons.email ,'Correo' , 'Ingrese su dirección de correo'),
          SizedBox(height: 15.0),
          _crearInputContrasena(Icons.vpn_key,'Contraseña' , 'Ingrese su contraseña'),
          SizedBox(height: 35.0),
          Container(
             child: _submitVehiculo(),
          )
        ],
      )
      //onTap: () { Navigator.pop(context);}
    );
  }



Widget _crearInput( IconData icon , String label , String hint ){
  return TextField (
    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(
      //counter: Text('Letras 0'),
      //helperText: 'Solo es el nombre',
      labelText: label ,
      hintText: hint,
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(203, 99, 51, 1),)),
      suffixIcon: Icon(icon)
      /*
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      )
      */

    ),
  );
}

Widget _crearInputTelefono( IconData icon , String label , String hint ){
  return TextField (
    keyboardType: TextInputType.phone,
    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(
      //counter: Text('Letras 0'),
      //helperText: 'Solo es el nombre',
      labelText: label ,
      hintText: hint,
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(203, 99, 51, 1),)),
      suffixIcon: Icon(icon)
      /*
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      )
      */

    ),
  );
}


Widget _crearInputContrasena( IconData icon , String label , String hint ){
  return TextField (
    obscureText: true,
    keyboardType: TextInputType.phone,
    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(
      //counter: Text('Letras 0'),
      //helperText: 'Solo es el nombre',
      labelText: label ,
      hintText: hint,
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(203, 99, 51, 1),)),
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

Widget _submitVehiculo(){

  return BottomAppBar(
      color: Color.fromRGBO(203, 99, 51, 1),
      child: MaterialButton(
        onPressed: () {
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
