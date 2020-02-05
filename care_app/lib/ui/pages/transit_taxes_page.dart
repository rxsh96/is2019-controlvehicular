import 'package:care_app/ui/pages/pages_files.dart';
import 'package:flutter/material.dart';

class TransitTaxesPage extends StatefulWidget {
  const TransitTaxesPage({Key key}) : super(key: key);
  static const String ID = 'transitTaxPage';

  @override
  _TransitTaxesPageState createState() => _TransitTaxesPageState(); 
}

class _TransitTaxesPageState extends State<TransitTaxesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('MIS VEHICULOS', style: TextStyle(fontSize: 17),),
       ),
      body: ListView(
          children: <Widget>[
            _crearFranjas('MULTAS', 1.0 ,'multas'),
            const SizedBox(height: 20.0,),
            _listarFiltro(),
            _listarFiltro(),
            
          ],
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(32, 32, 32, 1),
          child:Image(
            image: const AssetImage('images/agregar_auto.png'),
            height: 35,
          ),
            onPressed: (){
              Navigator.pushNamed(context, AddTransitTaxesPage.ID);
            }
        )
    );
  }


  Widget _listarFiltro(){
    return Container(
          child:Row(
            children: <Widget>[
              const SizedBox( width: 10.0),
              _crearFecha(25 , 'ABRIL' , 2018),
              const SizedBox( width: 15.0),
              _tipoFiltro('NOMBRE DE MULTA'),
              const SizedBox( width: 15.0),
              _crearLugar('Casa de Andres' , 80.0)
            ],
          ),
          height: 80.0,
          margin: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
          borderRadius:  BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0) ,
              bottomRight: Radius.circular(20.0),
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
            padding: const EdgeInsets.all(5.0),
            child:Text('$dia', 
                style: TextStyle(
                color: const Color.fromRGBO(203, 99, 51, 1),
                fontSize: 30.0
              ), ),
        ),
       Text(mes, ),
       Text('$anio')
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
      ]
    );
  }

  Widget _crearLugar( String local , double valor){
    return Column(
      children: <Widget>[
        Image(
            image: const AssetImage('images/location_pointer.png'),
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


  Widget _crearFranjas(String mantenimiento, double transparencia , String icono) {
    return BottomAppBar(
      color: Color.fromRGBO(203, 99, 51, transparencia),
      child: Row(
        children: <Widget>[
          MaterialButton(
            onPressed: () {
              //Navigator.pushNamed(context, VehiclePage.ID);
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
          const SizedBox(height: 105.0, width: 165),
          Image(
              image: AssetImage('images/$icono.png'),
              height: 60,
              alignment: Alignment.bottomRight)
        ],
      ),
    );
  }
}