import 'package:flutter/material.dart';
import 'package:care_app/api/apiService.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:care_app/src/components/myTextFormField.dart';

class AgregarVehiculoPage extends StatefulWidget {
  AgregarVehiculoPage({Key key}) : super(key: key);

  _AgregarVehiculoPageState createState() => _AgregarVehiculoPageState();
}

class _AgregarVehiculoPageState extends State<AgregarVehiculoPage> {
//  List<String> _marca = ['Chevrolet', 'Ford', 'Hyundai','Toyota','Mitsubishi', 'Mazda', 'Kia'];
//  List<String> _modelo = ['x', 'y', 'z','w','c', 'v', 'j'];
//  List<String> _anio = ['2010', '2011', '2012','2013','2014', '2015', '2016'];
//  String _marcaSeleccionada = 'Ford';

  final _formKey = GlobalKey<FormState>();

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _placaController = TextEditingController();
  final TextEditingController _marcaController = TextEditingController();
  final TextEditingController _modeloController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _ultimaMatController = TextEditingController();
  final TextEditingController _kmController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myCarForm = Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        children: <Widget>[
          SizedBox(height: 15.0),
          MyTextFormField(
              controller: _nombreController,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.text,
              label: 'Nombre',
              hint: 'Ejemplo: Mi Viajero - Mi Taxi - Personal',
              icon: Icons.account_box,
              errorMsg: 'Ingresa un nombre'),
          SizedBox(height: 15.0),
          MyTextFormField(
              controller: _placaController,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.text,
              label: 'Placa',
              hint: 'Formato: ABC-1234',
              icon: Icons.directions_car,
              errorMsg: 'Ingresa la placa del vehículo'),
          SizedBox(height: 15.0),
          MyTextFormField(
              controller: _marcaController,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.text,
              label: 'Marca',
              icon: Icons.directions_car,
              errorMsg: 'Ingresa la marca del vehículo'),
          SizedBox(height: 15.0),
          MyTextFormField(
              controller: _modeloController,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.text,
              label: 'Modelo',
              icon: Icons.directions_car,
              errorMsg: 'Ingresa el modelo del vehículo'),
          SizedBox(height: 15.0),
          MyTextFormField(
              controller: _colorController,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.text,
              label: 'Color',
              icon: Icons.color_lens,
              errorMsg: 'Ingresa el color del vehículo'),
          SizedBox(height: 15.0),
          MyTextFormField(
              controller: _yearController,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.number,
              label: 'Año',
              icon: Icons.timeline,
              errorMsg: 'Ingresa el año del vehículo'),
          SizedBox(height: 15.0),
          MyTextFormField(
              controller: _ultimaMatController,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.datetime,
              label: 'Última Matrícula',
              hint: 'dd/MM/YYYY',
              icon: Icons.color_lens,
              errorMsg: 'Ingresa la última matrícula del vehículo'),
          SizedBox(height: 15.0),
          MyTextFormField(
              controller: _kmController,
              capitalization: TextCapitalization.none,
              textInputType: TextInputType.number,
              label: 'Kilometraje',
              icon: Icons.directions_car,
              errorMsg: 'Ingresa el kilometraje del vehículo'),
          SizedBox(height: 15.0),
          MyTextFormField(
              controller: _descripcionController,
              capitalization: TextCapitalization.sentences,
              textInputType: TextInputType.text,
              label: 'Descripción',
              icon: Icons.mode_comment,
              errorMsg: 'Ingresa una descripción para el vehículo'),
          SizedBox(height: 35.0),
          Center(
            child: _image == null
                ? Text(
                    'Agregue una foto de su Vehículo',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  )
                : Text(
                    'Foto de su Vehículo',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
          ),
          Center(
            child: RawMaterialButton(
              child: Container(
                child: _image == null
                    ? Icon(
                        Icons.add_a_photo,
                        size: 75.0,
                      )
                    : Image(
                        image: new FileImage(_image),
                        height: 200.0,
                        width: 300.0,
                      ),
              ),
              onPressed: getImage,
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AÑADIR VEHICULOS",
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: myCarForm,
      bottomNavigationBar: _submitVehiculo(),
      //onTap: () { Navigator.pop(context);}
    );
  }

//List <DropdownMenuItem<String>> getOpcionesDropdown(){
//
//  List <DropdownMenuItem<String>> lista = new List();
//  _marca.forEach((marca){
//lista.add(DropdownMenuItem(
//      child: Container(
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.start,
//          children: <Widget>[
//            Icon(Icons.select_all),
//            SizedBox(width: 100.0,),
//            Text(marca),
//            Expanded(child: SizedBox(width: 1.0,),),
//          ],
//        ),
//        decoration: BoxDecoration(
//          borderRadius: BorderRadius.circular(10.0),
//          //Borde
//          /*
//          boxShadow: <BoxShadow>[
//           BoxShadow(
//             blurRadius: 1.0,
//             spreadRadius: 1.0,
//           ),
//          ],
//          */
//          color: Colors.white,
//        ),
//        width: 300.0,
//        height: 60.0,
//      ),
//      value: marca,
//    ));
//  });
//  return lista;
//}
//
//Widget _crearDrop(){
//  return Row(
//    children: <Widget>[
//          DropdownButton(
//          value: _marcaSeleccionada,
//          items: getOpcionesDropdown(),
//          onChanged: (opt){
//              setState(() {
//                _marcaSeleccionada = opt;
//              });
//          },
//        ),
//  ]);
//}

  void registerVehicle() {
    if (_formKey.currentState.validate()) {
      Map<String, String> body = {
        "brand": _marcaController.text,
        "model": _modeloController.text,
        "plate": _placaController.text,
        "color": _colorController.text,
        "year": _yearController.text,
        "description": _descripcionController.text,
        "km": _kmController.text,
        "is_active": "true",
      };
      ApiService.internal().post('vehicle/', body: body);
    }
  }

  Widget _submitVehiculo() {
    return BottomAppBar(
      color: Color.fromRGBO(203, 99, 51, 1),
      child: MaterialButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            registerVehicle();
            Navigator.pushNamed(context, '/vehiculos');
          }
          return;
        },
        child: Text(
          "GUARDAR",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
