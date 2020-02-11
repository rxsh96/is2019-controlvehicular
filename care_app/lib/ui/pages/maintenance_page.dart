import 'package:care_app/ui/components/my_banner.dart';
import 'package:care_app/ui/components/sliding_up_maintenance.dart';
import 'package:flutter/material.dart';

class MaintenancePage extends StatefulWidget {


  static const String ID = 'maintenancePage';
  @override
  _MaintenancePageState createState() => _MaintenancePageState();
}

class _MaintenancePageState extends State<MaintenancePage> {

  String label = 'Mi pagina';
  String icon = 'gasolina';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: const Text('MIS MANTENIMIENTOS', style: TextStyle(fontSize: 17),),
       ),
      body: ListView(
          children: <Widget>[
            MyBanner(label: label, icon: icon,),
            SlidingMaintenance(name: 'Hola',)
            
            
            
          ],
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(32, 32, 32, 1),
          child:const Image(
            image: AssetImage('images/agregar_auto.png'),
            height: 35,
          ),
            onPressed: (){
              // Navigator.pushNamed(context, AddTransitTaxesPage.ID);
            }
        )
    );
  }






   Widget _createBanner(String mantenimiento, double transparencia , String icono) {
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