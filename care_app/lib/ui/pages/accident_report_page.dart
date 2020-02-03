import 'dart:io';
import 'package:flutter/material.dart';

class AccidentReportPage extends StatefulWidget {
  @override
  _AccidentReportPageState createState() => _AccidentReportPageState();
  static const String ID = 'accidentPage';
  
}

class _AccidentReportPageState extends State<AccidentReportPage> {

  final List<String> type = <String>[];
  File _image;
  bool flag = true;
  Icon emoji = Icon(Icons.map);
  Color color = Colors.grey;

  Widget _floatingButton() {
    return FloatingActionButton.extended(
        label: flag
            ? const Text('Enviar lugar',
                style: TextStyle(color: Colors.white))
            : const Text('Enviado',
                style: TextStyle(color: Colors.black)),
        icon: flag ? emoji : Icon(Icons.check_circle_outline, color: Colors.black),
        backgroundColor: flag ? color : Colors.yellow,
        onPressed: () {
          flag = true;
          setState(() => flag = false);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'REPORTE DE ACCIDENTES',
          style: TextStyle(fontSize: 18),
        ),
      ),
    
      body: ListView(
        
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
        children: <Widget>[

          const Padding(
            padding: EdgeInsets.only(top:10),
            child: Text('Tipo de accidente'),
          ),

          const TextField(            
            controller:null ,
            maxLines: 1,
            decoration: InputDecoration(
                border: OutlineInputBorder()
            )
          ), 

          const Padding(
            padding: EdgeInsets.only(top:25),
            child: Text('Descripción del accidente'),
          ),

          const TextField(
            controller:null ,
            maxLines: 7,
            decoration: InputDecoration(
                border: OutlineInputBorder()
            )
          ),

          Padding(
            padding: const EdgeInsets.only(top:15.0),
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              
                RawMaterialButton(            
                  child: Container(
                      child: _image == null
                          ? CircleAvatar(
                              child: Icon(
                                Icons.camera,
                                size: 30.0,
                                color: Colors.white,
                              ),
                              backgroundColor:
                                  const Color.fromRGBO(203, 99, 51, 1),
                              radius: 30.0,
                            )
                          : const CircleAvatar(
                              backgroundImage: null,
                              radius: 30.0,
                              backgroundColor:
                                   Color.fromRGBO(203, 99, 51, 1),
                            ),
                  ),
                onPressed: null,
              ),

              Column(
                  children: <Widget>[
                        _floatingButton()
                      ],
                )

              ],
            ),
          )

        ]        
      ),
      bottomNavigationBar:BottomAppBar(
       color: const Color.fromRGBO(203, 99, 51, 1),
        child: MaterialButton(
            onPressed: () {},
            child: const Text( 'Enviar',
            textAlign: TextAlign.center,
                style: TextStyle(
                 color: Colors.white,
                ),
            ),
        ),
      ),   
    );
  }
}