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
         actions: <Widget>[
            _crearFranjas('hola', 1.0 ,'filtro')

         ],

       ),
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
              ),
            ),
          ),

          SizedBox(height: 85.0, width: 165),
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