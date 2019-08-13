import 'package:care_app/src/pages/vehiculos_page.dart';
import 'package:flutter/material.dart';


class AgregarVehiculoPage extends StatefulWidget {
  AgregarVehiculoPage({Key key}) : super(key: key);

  _AgregarVehiculoPageState createState() => _AgregarVehiculoPageState();
}

class _AgregarVehiculoPageState extends State<AgregarVehiculoPage> {

  List<String> _marca = ['Chevrolet', 'Ford', 'Hyundai','Toyota','Mitsubishi', 'Mazda', 'Kia'];

  List<String> _modelo = ['x', 'y', 'z','w','c', 'v', 'j'];
  List<String> _anio = ['2010', '2011', '2012','2013','2014', '2015', '2016'];

  String _marcaSeleccionada = 'Ford';


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
        padding: EdgeInsets.symmetric( horizontal: 12.0 , vertical: 30.0),
        children: <Widget>[
          
          _crearInput(Icons.account_box , 'Nombre ' , 'Ingrese su nombre'),
          SizedBox(height: 15.0),
          _crearInput(Icons.confirmation_number , 'Placa' , 'Ingrese su número de placa'),
          SizedBox(height: 15.0),
          _crearInput(Icons.web_asset , 'Última Matrícula', 'Ingrese su última matrícula'),
          SizedBox(height: 15.0),
          _crearInput(Icons.whatshot , 'Kilometraje' , 'Ingrese el kilometraje actual'),
          SizedBox(height: 15.0),
          SizedBox(height: 15.0),
          _crearDrop(),
          SizedBox(height: 15.0),
          _crearDrop(),
          SizedBox(height: 15.0),
          _crearDrop(),
          SizedBox(height: 15.0),
          _crearDrop(),
          SizedBox(height: 15.0),
          _crearInput(Icons.mode_comment ,'Descripción' , 'Ingrese una descripción'),
          SizedBox(height: 35.0),
          Container(
             child: _submitVehiculo(),
          )
        
        ],
      )
      //onTap: () { Navigator.pop(context);}
    );
  }


List <DropdownMenuItem<String>> getOpcionesDropdown(){

  List <DropdownMenuItem<String>> lista = new List();
  _marca.forEach((marca){
lista.add(DropdownMenuItem(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.select_all),
            SizedBox(width: 100.0,),
            Text(marca),
            Expanded(child: SizedBox(width: 1.0,),),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          //Borde
          /*
          boxShadow: <BoxShadow>[
           BoxShadow(
             blurRadius: 1.0,
             spreadRadius: 1.0,
           ), 
          ], 
          */
          color: Colors.white,
        ),
        width: 300.0,
        height: 60.0,
      ),
      value: marca,  
    ));
  });
  return lista;
}

Widget _crearDrop(){
  return Row(
    children: <Widget>[
          DropdownButton(
          value: _marcaSeleccionada,
          items: getOpcionesDropdown(),
          onChanged: (opt){
              setState(() {
                _marcaSeleccionada = opt;
              });
          },
        ),
  ]);
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


//No se como tomar un widget de otra clase .
//Aquí podriamos reutilizar el widget CREAR FRANJA de Vehiculos_page

Widget _submitVehiculo(){

  return BottomAppBar(
      color: Color.fromRGBO(203, 99, 51, 1),
      child: MaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, '/vehiculos');
        },
        child: Text(
          "GUARDAR",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );


}


}