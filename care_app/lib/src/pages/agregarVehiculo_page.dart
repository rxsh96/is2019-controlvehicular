import 'package:flutter/material.dart';
import 'package:care_app/api/apiService.dart';

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
          _crearInput(Icons.account_box, 'Nombre ', 'Ingrese su nombre',
              _nombreController),
          SizedBox(height: 15.0),
          _crearInput(Icons.directions_car, 'Placa',
              'Ingrese su número de placa', _placaController),
          SizedBox(height: 15.0),
          _crearInput(Icons.directions_car, 'Marca',
              'Ingrese la marca', _marcaController),
          SizedBox(height: 15.0),
          _crearInput(Icons.directions_car, 'Modelo',
              'Ingrese el modelo', _modeloController),
          SizedBox(height: 15.0),
          _crearInput(Icons.color_lens, 'Color',
              'Ingrese el coolor', _colorController),
          SizedBox(height: 15.0),
          _crearInput(Icons.timeline, 'Año',
              'Ingrese el año', _yearController),
          SizedBox(height: 15.0),
          _crearInput(Icons.directions_car, 'Última Matrícula',
              'Ingrese su última matrícula', _ultimaMatController),
          SizedBox(height: 15.0),
          _crearInput(Icons.directions_car, 'Kilometraje',
              'Ingrese el kilometraje actual', _kmController),
          SizedBox(height: 15.0),
          _crearInput(Icons.mode_comment, 'Descripción', 'Ingrese una descripción', _descripcionController),
          SizedBox(height: 35.0),
          Container(
            child: _submitVehiculo(),
          )
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

  Widget _crearInput(IconData icon, String label, String hint,
      TextEditingController controller) {
    return TextFormField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(203, 99, 51, 1),
          ),
        ),
        suffixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Necesitamos esta información';
        }
        return null;
      },
    );
  }

//No se como tomar un widget de otra clase .
//Aquí podriamos reutilizar el widget CREAR FRANJA de Vehiculos_page

  void registerVehicle(){
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
