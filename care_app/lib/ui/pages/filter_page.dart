
import 'package:care_app/core/locator.dart';
import 'package:care_app/core/src/models/vehicle_model.dart';
import 'package:care_app/core/src/provider/vehicle_provider.dart';
import 'package:care_app/ui/pages/vehicle_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_filter_page.dart';
import 'base_page.dart';

//class FilterPage extends StatelessWidget {
//
//  static const String ID = 'filterPage';
//
//  @override
//  Widget build(BuildContext context) {
//    return BasePage<VehicleProvider>(
//      onModelReady: (VehicleProvider vehicleProvider) async {
//        print('EN FILTER PAGE');
//      },
//      builder: (BuildContext context, VehicleProvider provider, Widget child) => SafeArea(
//        child: Scaffold(
//            appBar: AppBar(
//              title: const Text(
//                'FILTROS',
//                style: TextStyle(fontSize: 17),
//              ),
//            ),
//            body: const Text('Hola ):'),
//            floatingActionButton: FloatingActionButton(
//                backgroundColor: const Color.fromRGBO(32, 32, 32, 1),
//                child: Image(
//                  image: const AssetImage('images/agregar_auto.png'),
//                  height: 35,
//                ),
//                onPressed: () {
//                  //Practicando nueva forma de hacer ruteo
//                  print('ADD NEW FILTER PAGE');
//                  final List<Vehicle> desc = provider.vehicles;
//                  print(desc);
////                List<Vehicle> myList = locator<VehicleProvider>().myVehicles;
////                print(myList);
//                  final VehicleProvider vp = Provider.of<VehicleProvider>(context);
//                  print('USANDO PROVIDER');
//                  print(vp.vehicles);
//                  print('USANDO LOCATOR');
//                  print(locator<VehicleProvider>().selectedVehicle);
//
//                })),
//      ),);
//  }
//}




//import 'package:flutter/material.dart';
//
//import 'package:care_app/core/src/pages/add_filter_page.dart';
//
class FilterPage extends StatefulWidget {
  const FilterPage({Key key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();

  static const String ID = 'filterPage';
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('MIS VEHICULOS', style: TextStyle(fontSize: 17),),

       ),
      body: ListView(
          children: <Widget>[

            _crearFranjas('FILTROS', 1.0 ,'filtro'),
            _listarFiltro(),
            _listarFiltro(),
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
              Navigator.push<Object>(
                context,  MaterialPageRoute(builder: (BuildContext context) {
                  return AddFilterPage();
                }),
              );
            }
        )
    );
  }



  Widget _listarFiltro(){
    return Container(
          child:Row(
            children: <Widget>[
              const SizedBox( width: 15.0),
              _crearFecha(25 , 'ABRIL' , 2018),
              const SizedBox( width: 15.0),
              _tipoFiltro('FILTRO DE ACEITE'),
              const SizedBox( width: 15.0),
              _crearLugar('Casa de Andres' , 80.0)
            ],
          ),
          height: 70.0,
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
            padding: const EdgeInsets.all(10.0),
            child:Text('$dia'),
        ),
       Text(mes),
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
              Navigator.pushNamed(context, VehiclePage.ID);
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