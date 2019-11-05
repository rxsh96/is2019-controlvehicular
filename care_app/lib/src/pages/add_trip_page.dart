import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:care_app/src/components/my_text_form_field.dart';

class AddTripPage extends StatefulWidget {
  @override
  _AddTripPageState createState() => _AddTripPageState();
}

class _AddTripPageState extends State<AddTripPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _inputTripReason = TextEditingController();
  final TextEditingController _inputStartPlace = TextEditingController();
  final TextEditingController _inputEndPlace = TextEditingController();
  final TextEditingController _inputPassengerNumber = TextEditingController();
  final TextEditingController _inputInitialKm = TextEditingController();
  final TextEditingController _inputInitialTime = TextEditingController();

  bool isManual = false;
  bool isAutomatic = false;

  String _myCar = '';
  final List<String> cars = <String>['Ford', 'Jetta', 'Gol'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'NUEVO VIAJE',
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: Center(
          child: ListView(
            padding: const EdgeInsets.all(30.0),
            children: <Widget>[
              MyTextFormField(
                  controller: _inputTripReason,
                  capitalization: TextCapitalization.words,
                  textInputType: TextInputType.text,
                  label: 'Motivo del Viaje',
                  icon: Icons.question_answer,
                  errorMsg: 'Ingresa tu Motivo'),
              MyTextFormField(
                  controller: _inputStartPlace,
                  capitalization: TextCapitalization.words,
                  textInputType: TextInputType.text,
                  label: 'Inicio',
                  icon: Icons.map,
                  errorMsg: 'Ingresa Inicio'),
              MyTextFormField(
                  controller: _inputEndPlace,
                  capitalization: TextCapitalization.words,
                  textInputType: TextInputType.text,
                  label: 'Destino',
                  icon: Icons.map,
                  errorMsg: 'Ingresa Destino'),
              MyTextFormField(
                  controller: _inputPassengerNumber,
                  capitalization: TextCapitalization.none,
                  textInputType: TextInputType.phone,
                  label: 'Número de Personas',
                  icon: Icons.people,
                  errorMsg: 'Ingresa destino'),
              SizedBox(
                height: 10,
              ),
              const Text('Kilómetros Recorridos'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Manual'),
                  Checkbox(
                    value: isManual,
                    onChanged: (bool value) {
                      setState(() {
                        isManual = value;
                      });
                    },
                  ),
                  Text('Automático'),
                  Checkbox(
                    value: isAutomatic,
                    onChanged: (bool value) {
                      setState(() {
                        isAutomatic = value;
                      });
                    },
                  ),
                ],
              ),
              MyTextFormField(
                  controller: _inputInitialKm,
                  capitalization: TextCapitalization.none,
                  textInputType: TextInputType.phone,
                  label: 'Kilometraje Inicial',
                  icon: Icons.directions_car,
                  errorMsg: 'Ingresa kilometraje inicial'),
              SizedBox(
                height: 10,
              ),
              const Text('Tiempo'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Manual'),
                  Checkbox(
                    value: isManual,
                    onChanged: (bool value) {
                      setState(() {
                        isManual = value;
                      });
                    },
                  ),
                  Text('Automático'),
                  Checkbox(
                    value: isAutomatic,
                    onChanged: (bool value) {
                      setState(() {
                        isAutomatic = value;
                      });
                    },
                  ),
                ],
              ),
              MyTextFormField(
                  controller: _inputInitialTime,
                  capitalization: TextCapitalization.none,
                  textInputType: TextInputType.datetime,
                  label: 'Hora Inicial',
                  icon: Icons.timer,
                  errorMsg: 'Ingresa hora inicial'),
              SizedBox(height: 20,),
              DropDownField(
                value: cars[0],
                itemsVisibleInDropdown: 1,
                icon: Icon(Icons.directions_car),
                labelText: 'Vehículo',
                items: cars,
                strict: false,
                onValueChanged: (dynamic value) {
                  _myCar = value;
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color.fromRGBO(203, 99, 51, 1),
          child: MaterialButton(
            onPressed: () {
              print(_myCar);
            },
            child: Text(
              'Iniciar Viaje',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
