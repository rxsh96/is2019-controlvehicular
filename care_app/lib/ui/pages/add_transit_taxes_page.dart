import 'package:care_app/ui/forms/add_transit_taxes_form.dart';
import 'package:flutter/material.dart';



class AddTransitTaxesPage extends StatefulWidget {

  static const String ID = 'addTransitTaxesPage';
  @override
  _AddTransitTaxesPageState createState() => _AddTransitTaxesPageState();
}

class _AddTransitTaxesPageState extends State<AddTransitTaxesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: const Text('MIS VEHICULOS', style: TextStyle(fontSize: 17),),
       ),
      body: ListView(
          children: <Widget>[
            _crearFranjas('MULTAS', 1.0 ,'multas'),
            const SizedBox(height: 20.0,),
            AddTransitTaxesForm()          
          ],
      ),
      bottomNavigationBar: _bottomAppbar(),
    );
  }


  

Widget _bottomAppbar(){
  return  Container(
    height: 60.0,
    child: BottomAppBar(        
          color: const Color.fromRGBO(203, 99, 51, 1),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: const Text(
                'Enviar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19.0,
                  color: Colors.white,
                ),
              ),
          ),      
        ),
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