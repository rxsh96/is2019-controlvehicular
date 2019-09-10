import 'package:flutter/material.dart';

class FiltroPage extends StatefulWidget {
  FiltroPage({Key key}) : super(key: key);

  _FiltroPageState createState() => _FiltroPageState();
}

class _FiltroPageState extends State<FiltroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("MIS VEHICULOS", style: TextStyle(fontSize: 17)),

       ),
      body: ListView(
          children: <Widget>[

            _crearFranjas('FILTROS', 1.0 ,'filtro'),
            _ListarFiltro(),
            _ListarFiltro(),
            _ListarFiltro(),
            _ListarFiltro(),
            _ListarFiltro(),
            _ListarFiltro(),
            _ListarFiltro(),
            _ListarFiltro(),
            _ListarFiltro(),
            _ListarFiltro(),



          ],

      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(32, 32, 32, 1),
          child:Image(
            image: AssetImage('images/agregar_auto.png'),
            height: 35,
          ),
        onPressed: () {
        // Add your onPressed code here!
        }
    ));
  }



  Widget _ListarFiltro(){
    return Container(
          child:Row(
            children: <Widget>[
              SizedBox( width: 15.0),
              _crearFecha(25 , "ABRIL" , 2018),
              SizedBox( width: 15.0),
              _TipoFiltro("FILTRO DE ACEITE"),
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

  Widget _TipoFiltro(String tipo){
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
            image: AssetImage('images/location_pointer.png'),
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

  
  Widget _crearFranjas(String mantenimiento, double transparencia , String icono) {
    return BottomAppBar(
      color: Color.fromRGBO(203, 99, 51, transparencia),
      child: Row(
        children: <Widget>[
          MaterialButton(
            //Para hacer el ruteo
            onPressed: () {
              Navigator.pushNamed(context, '/vehiculos');
            },

            child: Text(

              mantenimiento,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0
              ),
            ),

          ),

          SizedBox(height: 105.0, width: 165),
          //Icon(Icons.airline_seat_flat_angled),
          Image(
              image: AssetImage('images/$icono.png'),
              height: 60,
              alignment: Alignment.bottomRight)
        ],
      ),
    );
  }
}