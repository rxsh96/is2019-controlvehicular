import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:intl/intl.dart';

import 'expenses_page.dart';


class AddTripPage extends StatefulWidget {

  static const String ID = 'addTripPage';

  // final tab;
  // NewTravelPage(this.tab);
  // NewTravelPage({Key key}) : super(key: key);

  @override
  _AddTripPageState createState() => _AddTripPageState();
}

class _AddTripPageState extends State<AddTripPage> with SingleTickerProviderStateMixin  {

  bool state = true;
  String _myActivity;
  final formKey = GlobalKey<FormState>();
  var color = Colors.black;
  String mensaje = 'Tomar hora actual';
  DateTime now ;
  String date;
  String hour;
  TabController _controller;

  @override
  void initState(){
    super.initState();
    _controller = TabController(length: 2 , vsync: this );
  }
  @override
  void dispose (){
    //eliminando recursos
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _topAppBar(context) ,
      body: _getTabBarView(
          <Widget>[
            _body(),

            ExpensesPage(),
          ]
      ),


    );
  }

  Widget _body(){
    return ListView(
      children: <Widget>[
        _showFilter(),

        Padding(
            padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
            child: Column(
              children: <Widget>[
                _formNewTravel(),
                _formInicioDestino('Origen','Ingrese el lugar de origen'),
                _formInicioDestino('Destino','Ingrese el lugar de destino'),
                _formHora(state),
                _actionButton(),
                ////////////////////////////////
                //AQUI LLAMAR A MYCARBUTTOM
                ///Elimar este ruteo

                //////////////////////////////////

              ],
            )
        )

      ],
    );
  }


  Widget _actionButton(){

    return Padding(
      padding: const EdgeInsets.only(bottom: 80.0),
      child: FloatingActionButton.extended(

        label: Text(mensaje),
        icon: Icon( Icons.timer,),
        onPressed:(){
          _validate() ? state = false  : state = false ;
          color =  Color.fromRGBO(210, 100, 50, 1);
          _getDate();
          print(hour);
          setState(() {
            state = this.state;
            mensaje = 'Hora actual';
          });
        },
        backgroundColor:color ,
      ),
    );
  }

  Widget _topAppBar ( BuildContext context){
    return AppBar(
        title: Text('NUEVO VIAJE'),
        bottom: _getTabBar(),
        backgroundColor: Colors.black,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios,color: Color.fromRGBO(210, 100, 50, 1),),
          onTap: () {
            Navigator.pop(context);
          },
        )

    );
  }


  Widget _showFilter(){

    return Center(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: DropDownFormField(

                titleText: 'Vehículo',
                hintText: 'Escoja el auto usado',
                value: _myActivity,
                onSaved: (dynamic value) {
                  setState(() {
                    _myActivity = value;
                  });
                },
                onChanged: (dynamic value) {
                  setState(() {
                    _myActivity = value;
                  });
                },

                dataSource: <dynamic>[
                  {
                    "display": "Aveo",
                    "value": "Aveo",
                  },
                  {
                    "display": "YYY",
                    "value": "YYY",
                  },
                  {
                    "display": "ZZZ",
                    "value": "ZZZ",
                  },
                ],
                textField: 'display',
                valueField: 'value',
              ),
            ),

            // Container(
            //   padding: EdgeInsets.all(8),
            //   child: RaisedButton(
            //     child: Text('Save'),
            //     onPressed: _saveForm,
            //   ),
            // ),
            // Container(
            //   padding: EdgeInsets.all(16),
            //   child: Text(_myActivityResult),
            // )

          ],
        ),
      ),
    );
  }


  Widget _formNewTravel(){
    return TextFormField(
      // controller: controller,
      // keyboardType: textInputType,

      decoration: InputDecoration(
        labelText: 'Motivo de viaje',
        hintText: 'Escriba el motivo de su viaje',
        suffixIcon: Icon(Icons.card_travel),

        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromRGBO(203, 99, 51, 1),
          ),
        ),
      ),

    );

  }

  Widget _formInicioDestino(String label , String hint ){
    return TextFormField(
      // controller: controller,
      // keyboardType: textInputType,
      decoration: InputDecoration(

        labelText: label,
        hintText: hint,
        suffixIcon: Icon(Icons.location_on),

        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromRGBO(203, 99, 51, 1),
          ),
        ),
      ),

    );
  }


  Widget _formHora(bool state){
    return TextFormField(
      // controller: controller,
      // keyboardType: textInputType,

      enabled: state,
      decoration: InputDecoration(
        labelText: 'Hora de viaje',
        hintText: 'Escriba la hora del viaje',
        suffixIcon: Icon(Icons.av_timer),

        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromRGBO(203, 99, 51, 1),
          ),
        ),
      ),

    );

  }

  bool _validate(){

    return true;
  }

  void _getDate(){
    now = DateTime.now();
    hour = DateFormat('kk:mm').format(now);
    date = DateFormat('yyyy-MM-dd ').format(now);
  }


  TabBar _getTabBar(){
    return TabBar(
      tabs: <Tab>[
        Tab(icon:Icon(Icons.library_books),
          child: Text('INFORMAMACIÓN'),
        ),
        Tab(icon:Icon(Icons.attach_money),
          child: Text('GASTOS'),

        ),
      ],
      controller: _controller,
    );
  }

  TabBarView _getTabBarView(dynamic displays){
    return TabBarView(
      children: displays,
      controller: _controller,
    );
  }


}

//import 'package:care_app/ui/components/my_text_form_field.dart';
//import 'package:flutter/material.dart';
//import 'package:dropdownfield/dropdownfield.dart';
//
//class AddTripPage extends StatefulWidget {
//  @override
//  _AddTripPageState createState() => _AddTripPageState();
//}
//
//class _AddTripPageState extends State<AddTripPage> {
//  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//  final TextEditingController _inputTripReason = TextEditingController();
//  final TextEditingController _inputStartPlace = TextEditingController();
//  final TextEditingController _inputEndPlace = TextEditingController();
//  final TextEditingController _inputPassengerNumber = TextEditingController();
//  final TextEditingController _inputInitialKm = TextEditingController();
//  final TextEditingController _inputInitialTime = TextEditingController();
//
//  bool isManual = false;
//  bool isAutomatic = false;
//
//  String _myCar = '';
//  final List<String> cars = <String>['Ford', 'Jetta', 'Gol'];
//
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: Scaffold(
//        appBar: AppBar(
//          title: const Text(
//            'NUEVO VIAJE',
//            style: TextStyle(fontSize: 16),
//          ),
//        ),
//        body: Center(
//          child: ListView(
//            padding: const EdgeInsets.all(30.0),
//            children: <Widget>[
//              MyTextFormField(
//                  controller: _inputTripReason,
//                  capitalization: TextCapitalization.words,
//                  textInputType: TextInputType.text,
//                  label: 'Motivo del Viaje',
//                  icon: Icons.question_answer,
//                  errorMsg: 'Ingresa tu Motivo'),
//              MyTextFormField(
//                  controller: _inputStartPlace,
//                  capitalization: TextCapitalization.words,
//                  textInputType: TextInputType.text,
//                  label: 'Inicio',
//                  icon: Icons.map,
//                  errorMsg: 'Ingresa Inicio'),
//              MyTextFormField(
//                  controller: _inputEndPlace,
//                  capitalization: TextCapitalization.words,
//                  textInputType: TextInputType.text,
//                  label: 'Destino',
//                  icon: Icons.map,
//                  errorMsg: 'Ingresa Destino'),
//              MyTextFormField(
//                  controller: _inputPassengerNumber,
//                  capitalization: TextCapitalization.none,
//                  textInputType: TextInputType.phone,
//                  label: 'Número de Personas',
//                  icon: Icons.people,
//                  errorMsg: 'Ingresa destino'),
//              const SizedBox(
//                height: 10,
//              ),
//              const Text('Kilómetros Recorridos'),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  const Text('Manual'),
//                  Checkbox(
//                    value: isManual,
//                    onChanged: (bool value) {
//                      setState(() {
//                        isManual = value;
//                      });
//                    },
//                  ),
//                  const Text('Automático'),
//                  Checkbox(
//                    value: isAutomatic,
//                    onChanged: (bool value) {
//                      setState(() {
//                        isAutomatic = value;
//                      });
//                    },
//                  ),
//                ],
//              ),
//              MyTextFormField(
//                  controller: _inputInitialKm,
//                  capitalization: TextCapitalization.none,
//                  textInputType: TextInputType.phone,
//                  label: 'Kilometraje Inicial',
//                  icon: Icons.directions_car,
//                  errorMsg: 'Ingresa kilometraje inicial'),
//              const SizedBox(
//                height: 10,
//              ),
//              const Text('Tiempo'),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  const Text('Manual'),
//                  Checkbox(
//                    value: isManual,
//                    onChanged: (bool value) {
//                      setState(() {
//                        isManual = value;
//                      });
//                    },
//                  ),
//                  const Text('Automático'),
//                  Checkbox(
//                    value: isAutomatic,
//                    onChanged: (bool value) {
//                      setState(() {
//                        isAutomatic = value;
//                      });
//                    },
//                  ),
//                ],
//              ),
//              MyTextFormField(
//                  controller: _inputInitialTime,
//                  capitalization: TextCapitalization.none,
//                  textInputType: TextInputType.datetime,
//                  label: 'Hora Inicial',
//                  icon: Icons.timer,
//                  errorMsg: 'Ingresa hora inicial'),
//              const SizedBox(height: 20,),
//              DropDownField(
//                value: cars[0],
//                itemsVisibleInDropdown: 1,
//                icon: Icon(Icons.directions_car),
//                labelText: 'Vehículo',
//                items: cars,
//                strict: false,
//                onValueChanged: (dynamic value) {
//                  _myCar = value;
//                },
//              ),
//            ],
//          ),
//        ),
//        bottomNavigationBar: BottomAppBar(
//          color: const Color.fromRGBO(203, 99, 51, 1),
//          child: MaterialButton(
//            onPressed: () {
//              print(_myCar);
//            },
//            child: Text(
//              'Iniciar Viaje',
//              textAlign: TextAlign.center,
//              style: TextStyle(
//                color: Colors.white,
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
