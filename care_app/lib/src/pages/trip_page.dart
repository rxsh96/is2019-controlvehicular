import 'package:flutter/material.dart';
import 'package:care_app/src/pages/add_trip_page.dart';

class TripPage extends StatefulWidget {
  @override
  _TripPageState createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'VIAJES',
            style: TextStyle(fontSize: 17),
          ),
        ),
        body: ListView(
          children: const <Widget>[
            Center(child: Text('Por el momento no tienes ningun viaje registrado')),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromRGBO(32, 32, 32, 1),
            child: Image(
              image: const AssetImage('images/agregar_auto.png'),
              height: 35,
            ),
            onPressed: () {
              //Practicando nueva forma de hacer ruteo
              Navigator.push<Object>(
                context,
                MaterialPageRoute<AddTripPage>(builder: (BuildContext context) {
                  return AddTripPage();
                }),
              );
            }),
      ),
    );
  }
}
