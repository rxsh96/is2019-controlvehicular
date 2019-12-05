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
        title: Text('VIAJES'),
        backgroundColor: Colors.black,
        leading: GestureDetector(
          child: Icon(Icons.clear_all,color: Color.fromRGBO(210, 100, 50, 1),),
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

        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.only(
              topLeft:  const  Radius.circular(20.0),
              topRight: const  Radius.circular(20.0),
              bottomLeft: const Radius.circular(20.0) ,
              bottomRight: const Radius.circular(20.0),
            ),
            gradient: new LinearGradient(
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
          image: AssetImage('images/kilometraje_2.png'),
          height: 15.0,
        ),
        Text(local),
        Image(
          image: AssetImage('images/money.png'),
          height: 15.0,
        ),
        Text("$valor")

      ],
    );
  }




}

//import 'package:flutter/material.dart';
//
//import 'add_trip_page.dart';
//
//class TripPage extends StatefulWidget {
//  @override
//  _TripPageState createState() => _TripPageState();
//}
//
//class _TripPageState extends State<TripPage> {
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: Scaffold(
//        appBar: AppBar(
//          title: Text(
//            'VIAJES',
//            style: TextStyle(fontSize: 17),
//          ),
//        ),
//        body: ListView(
//          children: const <Widget>[
//            Center(child: Text('Por el momento no tienes ningun viaje registrado')),
//          ],
//        ),
//        floatingActionButton: FloatingActionButton(
//            backgroundColor: const Color.fromRGBO(32, 32, 32, 1),
//            child: Image(
//              image: const AssetImage('images/agregar_auto.png'),
//              height: 35,
//            ),
//            onPressed: () {
//              //Practicando nueva forma de hacer ruteo
//              Navigator.push<Object>(
//                context,
//                MaterialPageRoute<AddTripPage>(builder: (BuildContext context) {
//                  return AddTripPage();
//                }),
//              );
//            }),
//      ),
//    );
//  }
//}
