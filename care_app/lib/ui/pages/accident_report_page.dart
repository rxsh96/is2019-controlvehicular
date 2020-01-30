import 'dart:io';

import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';

class AccidentReportPage extends StatefulWidget {
  @override
  _AccidentReportPageState createState() => _AccidentReportPageState();
  static const String ID = 'accidentPage';
  
}

class _AccidentReportPageState extends State<AccidentReportPage> {

  final List<String> type = <String>[];
  File _image;

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

          DropDownField(
                value: '',
                itemsVisibleInDropdown: 2,
                // icon: Icon(Icons.directions_car),
                hintText:'Tipo de accidente' ,
                labelText: 'Marca',
                items: type,
                strict: false,
                onValueChanged: (dynamic value) {
                  print('...');
                },
          ), 

          const Padding(
            padding: EdgeInsets.only(top:25),
            child: Text('Descripción del accidente'),
          ),

          TextField(
            controller:null ,
            maxLines: 7,
            decoration: InputDecoration(
                border: OutlineInputBorder()
            )
          ),


         Padding(
           padding: const EdgeInsets.all(12.0),
           child: Center(
              child: RawMaterialButton(
                
                  child: Container(
                      child: _image == null
                          ? CircleAvatar(
                              child: Icon(
                                Icons.camera,
                                size: 40.0,
                                color: Colors.black,
                              ),
                              backgroundColor:
                                  const Color.fromRGBO(203, 99, 51, 1),
                              radius: 40.0,
                            )
                          : const CircleAvatar(
                              backgroundImage: null,
                              radius: 80.0,
                              backgroundColor:
                                   Color.fromRGBO(203, 99, 51, 1),
                            ),
                  ),
                onPressed: null,
              ),
           ),
         ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                
                Column(
                  children: <Widget>[
                        Checkbox(
                           value: false,
                           onChanged: (bool value) {
                             setState(() {
                               value = !value;
                             });
                           },
                         ),
                        const Text('Enviar Ubicación'),
                      ],
                ),
                Column(
                  children: <Widget>[
                        FloatingActionButton.extended(
                          label: const Text('Mapa'),
                          onPressed: (){},
                          icon: Icon(Icons.remove_red_eye),
                          // shape: CircleBorder(),
                          // elevation: 2.0,
                          backgroundColor: Colors.orangeAccent,
                          // padding: const EdgeInsets.all(7.0),
                        )
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