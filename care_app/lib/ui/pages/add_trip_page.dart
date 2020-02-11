import 'package:care_app/core/locator.dart';
import 'package:care_app/core/src/models/trip_model.dart';
import 'package:care_app/core/src/provider/login_provider.dart';
import 'package:care_app/core/src/trips/map_trip.dart';
import 'package:care_app/ui/pages/pages_files.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'expenses_page.dart';




class AddTripPage extends StatefulWidget {

  static const String ID = 'addTripPage';

  // final tab;
  // NewTravelPage(this.tab);
  // NewTravelPage({Key key}) : super(key: key);



  // AddTripPage ({this.init,this.end});
  // String init ;
  // String end ;
  

  @override
  _AddTripPageState createState() => _AddTripPageState(
    // init : init,
    // end  : end
  );
}

class _AddTripPageState extends State<AddTripPage> with SingleTickerProviderStateMixin  {

  //  _AddTripPageState ({this.init,this.end});
  //  final String init ;
  //  final String end ;

  bool state = true;
  String _myActivity;
  final formKey = GlobalKey<FormState>();
  Color color = Colors.black;
  String mensaje = 'Tomar hora actual';
  DateTime now ;
  String date;
  String hour;
  TabController _controller;
  TextEditingController controller ;




  @override
  void initState(){
    super.initState();
    _controller = TabController(length: 2 , vsync: this );
    //  controller.text = init;
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

              ],
            )
        )

      ],
    );
  }


  Widget _actionButton(){

    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: FloatingActionButton.extended(

        label: Text(mensaje),
        icon: Icon( Icons.timer,),
        onPressed:(){
          _validate() ? state = false  : state = false ;
          color =  const Color.fromRGBO(210, 100, 50, 1);
          _getDate();
          print(date);
          setState(() {
            state = this.state;
            mensaje = date;
          });
        },
        backgroundColor:color ,
      ),
    );
  }

  Widget _topAppBar ( BuildContext context){
    return AppBar(
        title: const Text('NUEVO VIAJE'),
        bottom: _getTabBar(),
        backgroundColor: Colors.black,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios,color: const Color.fromRGBO(210, 100, 50, 1),),
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
              padding: const EdgeInsets.all(16),
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

        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(203, 99, 51, 1),
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
        suffixIcon: IconButton(
          icon: Icon(Icons.location_on),
          onPressed: () => Navigator.pushNamed(context, MapTrip.ID),
        ),

        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color:  Color.fromRGBO(203, 99, 51, 1),
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

        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color:  Color.fromRGBO(203, 99, 51, 1),
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
      unselectedLabelColor: Colors.white,
      labelColor: const Color.fromRGBO(210, 100, 50, 0.6),
      tabs: <Tab>[
        Tab(icon:Icon(Icons.library_books),
          child: const Text('INFORMAMACIÓN'),
        ),
        Tab(icon:Icon(Icons.attach_money),
          child: const Text('GASTOS'),

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
