import 'package:flutter/material.dart';


class AgregarVehiculoPage extends StatefulWidget {
  AgregarVehiculoPage({Key key}) : super(key: key);

  _AgregarVehiculoPageState createState() => _AgregarVehiculoPageState();
}

class _AgregarVehiculoPageState extends State<AgregarVehiculoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AÑADIR VEHICULOS", style: TextStyle(fontSize: 17)),
        actions: <Widget>[
          IconButton(
            //Me ingenié esta forma de regresar al page, no sé como se realiza de verdad
            icon: Icon(Icons.arrow_back ),
            color: Color.fromRGBO(32, 32, 32, 1),
            onPressed: () { Navigator.pop(context);}

          )
        ],  
      ),
      body: ListView(
        padding: EdgeInsets.symmetric( horizontal: 20.0 , vertical: 30.0),
        children: <Widget>[
        
          _crearInput(Icons.account_box , 'Nombre ' , 'Ingrese su nombre'),
          SizedBox(height: 15.0),
          _crearInput(Icons.confirmation_number , 'Placa' , 'Ingrese su número de placa'),
          SizedBox(height: 15.0),
          _crearInput(Icons.web_asset , 'Última Matrícula', 'Ingrese su última matrícula'),
          SizedBox(height: 15.0),
          _crearInput(Icons.whatshot , 'Kilometraje' , 'Ingrese el kilometraje actual'),
          SizedBox(height: 15.0),
          _crearInput(Icons.mode_comment ,'Descripción' , 'Ingrese una descripción')

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
      suffixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      )

    ),
  );
}


}