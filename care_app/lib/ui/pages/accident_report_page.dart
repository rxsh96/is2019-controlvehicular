import 'dart:io';
import 'package:care_app/core/locator.dart';
import 'package:care_app/core/src/enums/view_state_enum.dart';
import 'package:care_app/core/src/provider/login_provider.dart';
import 'package:care_app/core/src/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

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

  void cleanFields() {
    _title.text = _description.text = '';
    setState(() {
      _image = null;
    });
  }

  Future<void> getImageFromCamera() async {
    final File image = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 512.0,
      maxHeight: 512.0,
    );
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Reporte de Accidentes',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Image.asset(
                'images/logo2.png',
                fit: BoxFit.contain,
                height: 32,
              ),
            ],
          ),
        ),
        body: ChangeNotifierProvider<LoginProvider>(
          create: (BuildContext context) => locator<LoginProvider>(),
          child: Consumer<LoginProvider>(
            builder: (BuildContext context, LoginProvider loginProvider,
                    Widget child) =>
                SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('Tipo de accidente'),
                  ),
                  TextField(
                      controller: _title,
                      maxLines: 1,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder())),
                  const Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Text('Descripción del accidente'),
                  ),
                  TextField(
                      controller: _description,
                      maxLines: 7,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder())),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
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
                                    backgroundColor:
                                        const Color.fromRGBO(203, 99, 51, 1),
                                    radius: 50.0,
                                  )
                                : CircleAvatar(
                                    backgroundImage: FileImage(_image),
                                    radius: 50.0,
                                    backgroundColor:
                                        const Color.fromRGBO(203, 99, 51, 1),
                                  ),
                          ),
                          onPressed: getImageFromCamera,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  if (loginProvider.state == ViewState.Busy)
                    const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color.fromRGBO(203, 99, 51, 1),
                      ),
                    )
                  else
                    MaterialButton(
                      color: const Color.fromRGBO(203, 99, 51, 1),
                      onPressed: () async {
                        if (_image != null) {
                          final String downloadURL =
                              await loginProvider.saveAccidentPic(
                                  loginProvider.userRepository.user.email,
                                  _image);

                          final Map<String, dynamic> accidentMap =
                              <String, dynamic>{
                            'type': _title.text,
                            'description': _description.text,
                            'img': downloadURL,
                            'user':
                                locator<UserRepository>().user.id.toString(),
                          };

                          final Map<String, dynamic> response =
                              await loginProvider.postAccident(accidentMap);

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
                                content: Text('¡Reportado!'),
                              ),
                              //Navigator.pushNamed(context, VehiclePage.ID)
                            );
                            cleanFields();
                          }
                        }
                        else{
                          Scaffold.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Ingresa la imagen del accidente.'),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Reportar',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
