import 'package:care_app/ui/pages/add_trip_page.dart';
import 'package:flutter/material.dart';

class TripPage extends StatefulWidget {

  static const String ID = 'tripPage';

  @override
  _TripPageState createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar(context),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 25.0,),
          _listarViaje(),



        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Image.asset('images/boton_agregar.png'),
        onPressed: (){
          Navigator.pushNamed(context, AddTripPage.ID);
        },
      ),


    );
  }


  Widget topAppBar ( BuildContext context){
    return AppBar(
        title: const Text('Viajes', style: TextStyle(fontSize: 16),),
        backgroundColor: Colors.black,
        leading: GestureDetector(
          child: Icon(Icons.clear_all,color: const Color.fromRGBO(210, 100, 50, 1),),
          onTap: () {
            Navigator.pop(context);
          },
        )

    );
  }



  Widget _listarViaje(){
    return Container(
        child:Row(
          children: <Widget>[
            SizedBox( width: 15.0),
            _crearFecha(25 , "ABRIL" , 2018),
            SizedBox( width: 15.0),
            _tipoFiltro("FILTRO DE ACEITE"),
            SizedBox( width: 15.0),
            _crearLugar("Casa de Andres" , 80.0)

          ],
        ),
        height: 70.0,
        margin: new EdgeInsets.all(10.0),

        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft:   Radius.circular(20.0),
              topRight:   Radius.circular(20.0),
              bottomLeft:  Radius.circular(20.0) ,
              bottomRight:  Radius.circular(20.0),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.grey,

              ],
            )
        )
    );
  }



  Widget _crearFecha(int dia, String mes ,int anio ){
    return Column(
      children: <Widget>[

        Padding(
          padding: const EdgeInsets.all(10.0),
          child:Text("$dia"),

        ),
        Text(mes),
        Text("$anio")
      ],
    );
  }


  Widget _tipoFiltro(String tipo){
    return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:Text(tipo),

          ),
        ]);
  }

  Widget _crearLugar( String local , double valor){
    return Column(
      children: <Widget>[
        Image(
          image: const AssetImage('images/kilometraje_2.png'),
          height: 15.0,
        ),
        Text(local),
        Image(
          image: const AssetImage('images/money.png'),
          height: 15.0,
        ),
        Text('$valor')

      ],
    );
  }




}

