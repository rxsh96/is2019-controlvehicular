import 'dart:io';
import 'package:care_app/core/locator.dart';
import 'package:care_app/core/src/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AccidentReportPage extends StatefulWidget {
  @override
  _AccidentReportPageState createState() => _AccidentReportPageState();
  static const String ID = 'accidentPage';
  
}

class _AccidentReportPageState extends State<AccidentReportPage> {

  //final List<String> type = <String>[];
  File _image;
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  //bool flag = true;
  //Icon emoji = Icon(Icons.map);
  //Color color = Colors.grey;

/*  Widget _floatingButton() {
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
  }*/

  void cleanFields() {
    _title.text = _description.text = '';
    setState(() {
      _image = null;
    });
  }

  Future<void> getImageFromCamera() async {
    final File image = await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 512.0, maxHeight: 512.0,);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Reporte de Accidentes',
          style: TextStyle(fontSize: 16),
        ),
      ),
    
      body: ListView(
        
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
        children: <Widget>[

          const Padding(
            padding: EdgeInsets.only(top:10),
            child: Text('Tipo de accidente'),
          ),

          TextField(
            controller: _title,
            maxLines: 1,
            decoration: const InputDecoration(
                border: OutlineInputBorder()
            )
          ), 

          const Padding(
            padding: EdgeInsets.only(top:25),
            child: Text('Descripción del accidente'),
          ),

          TextField(
            controller: _description,
            maxLines: 7,
            decoration: const InputDecoration(
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
                        Icons.add_a_photo,
                        size: 50.0,
                        color: Colors.white,
                      ),
                      backgroundColor: const Color.fromRGBO(203, 99, 51, 1),
                      radius: 50.0,
                    )
                        : CircleAvatar(
                      backgroundImage: FileImage(_image),
                      radius: 50.0,
                      backgroundColor: const Color.fromRGBO(203, 99, 51, 1),
                    ),
                  ),
                  onPressed: getImageFromCamera,
                ),
              ],
            ),
          )

        ]        
      ),
      bottomNavigationBar:BottomAppBar(
       color: const Color.fromRGBO(203, 99, 51, 1),
        child: MaterialButton(
            onPressed: () async {
              print('PRESSED');

              if (_image != null) {
                print('IMAGE != NULL');
                final String downloadURL = await locator<UserRepository>().uploadAccidentPic(locator<UserRepository>().user.email, _image);

                final Map<String, dynamic> accidentMap = <String, dynamic>{
                  'type': _title.text,
                  'description': _description.text,
                  'img': downloadURL,
                  'user': locator<UserRepository>().user.id.toString(),
                };

                final Map<String, dynamic> response = await locator<UserRepository>().postAccident(accidentMap);

                if (response.containsKey('error')) {
                  Scaffold.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Ha surgido un problema. Inténtalo de nuevo.'),
                    ),
                  );
                } else {
                  Scaffold.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('¡Registro exitoso!'),
                    ),
                    //Navigator.pushNamed(context, VehiclePage.ID)
                  );
                  cleanFields();
                }
              }

            },
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