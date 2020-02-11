import 'package:care_app/core/locator.dart';
import 'package:care_app/core/src/enums/view_state_enum.dart';
import 'package:care_app/core/src/models/model_model.dart';
import 'package:care_app/core/src/provider/login_provider.dart';
import 'package:care_app/core/src/provider/vehicle_provider.dart';
import 'package:care_app/ui/components/my_text_form_field.dart';
import 'package:care_app/ui/pages/pages_files.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';


class AddTripPage extends StatelessWidget {

  static const String ID = 'addTripPage';

  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();
  final TextEditingController _numberPersonsController = TextEditingController();
  final TextEditingController _startKmController = TextEditingController();
  final TextEditingController _endKmController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TimeOfDay _startTime;
  DateTime _date;

void cleanFields(){
  _startController.text = _endController.text = _numberPersonsController.text =
      _startKmController.text = _endKmController.text = _timeController.text =
      _descriptionController.text = _dateController.text = '';
  _date = null;
  _startTime = null;
}

  @override
  Widget build(BuildContext context) {
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Mis Mantenimientos',
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
          body: ChangeNotifierProvider<VehicleProvider>(
            create: (BuildContext context) => locator<VehicleProvider>(),
            child: Consumer<VehicleProvider>(
              builder: (BuildContext context, VehicleProvider vehicleProvider,
                  Widget child) =>
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:
                    SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[

                            DropdownButton<ModelModel>(
                              hint: const Text('Seleccione su vehículo'),
                              value: vehicleProvider.selectedModel,
                              onChanged: (ModelModel newValue) {
                                vehicleProvider.selectModel(newValue);
                              },
                              items: vehicleProvider.myModels
                                  .map<DropdownMenuItem<ModelModel>>(
                                      (ModelModel value) {
                                    return DropdownMenuItem<ModelModel>(
                                      value: value,
                                      child: Text(value.model),
                                    );
                                  }).toList(),
                            ),
                            const SizedBox(height: 15.0),
                            MyTextFormField(
                              controller: _descriptionController,
                              capitalization: TextCapitalization.sentences,
                              textInputType: TextInputType.text,
                              label: 'Descripción del Viaje',
                              icon: Icons.description,
                              errorMsg: 'Ingresa una descripción',
                            ),
                            const SizedBox(height: 15.0),
                            MyTextFormField(
                              controller: _startController,
                              capitalization: TextCapitalization.sentences,
                              textInputType: TextInputType.text,
                              label: 'Inicio',
                              icon: Icons.map,
                              errorMsg: 'Ingresa el lugar de partida',
                            ),
                            const SizedBox(height: 15.0),
                            MyTextFormField(
                              controller: _endController,
                              capitalization: TextCapitalization.sentences,
                              textInputType: TextInputType.text,
                              label: 'Destino',
                              icon: Icons.map,
                              errorMsg: 'Ingresa el lugar de destino',
                            ),

                            const SizedBox(height: 15.0),
                            MyTextFormField(
                              controller: _numberPersonsController,
                              capitalization: TextCapitalization.none,
                              textInputType: TextInputType.number,
                              label: 'Número de pasajeros',
                              icon: Icons.person,
                              errorMsg: 'Ingresa el número de pasajeros',
                            ),

                            const SizedBox(height: 15.0),
                            MyTextFormField(
                              controller: _startKmController,
                              capitalization: TextCapitalization.none,
                              textInputType: TextInputType.number,
                              label: 'Kilometraje de partida',
                              icon: Icons.confirmation_number,
                              errorMsg: 'Ingresa el kilometraje de partida',
                            ),
                            const SizedBox(height: 15.0),
                            MyTextFormField(
                              controller: _endKmController,
                              capitalization: TextCapitalization.none,
                              textInputType: TextInputType.number,
                              label: 'Kilometraje final',
                              icon: Icons.confirmation_number,
                              errorMsg: 'Ingresa el kilometraje final',
                            ),
                            const SizedBox(height: 15.0),
                            TextField(
                              onTap: () async {
                                _date = await showRoundedDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(DateTime.now().year - 10),
                                  lastDate: DateTime(DateTime.now().year + 1),
                                  borderRadius: 16,
                                );
                                _dateController.text =
                                    DateFormat('yyyy-MM-dd').format(_date);
                              },
                              focusNode: FirstDisabledFocusNode(),
                              controller: _dateController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                labelText: 'Fecha del viaje',
                                suffixIcon: Icon(Icons.calendar_today),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(203, 99, 51, 1),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15.0),
                      TextField(
                        onTap: () async {
                          _startTime = await showRoundedTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );

                          _timeController.text = localizations.formatTimeOfDay(_startTime);

                        },
                        focusNode: FirstDisabledFocusNode(),
                        controller: _timeController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          labelText: 'Hora de partida del viaje',
                          suffixIcon: Icon(Icons.access_time),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(203, 99, 51, 1),
                            ),
                          ),
                        ),
                      ),

                            const SizedBox(height: 30.0),
                            if (vehicleProvider.state == ViewState.Busy)
                              const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color.fromRGBO(203, 99, 51, 1),
                                ),
                              ),
                            if (vehicleProvider.state == ViewState.Idle)
                              MaterialButton(
                                color: const Color.fromRGBO(203, 99, 51, 1),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {

                                    final Map<String, dynamic> data = <String, dynamic>{
                                      'description': _descriptionController.text,
                                      'start_place': _startController.text,
                                      'end_place': _endController.text,
                                      'start_km': _startKmController.text,
                                      'final_km': _endKmController.text,
                                      'start_time': _timeController.text,
                                      'end_time': _timeController.text,
                                      'is_active': 'false',
                                      'no_passanger': _numberPersonsController.text,
                                      'date': _dateController.text,
                                      'vehicle': vehicleProvider.selectedVehicle.id.toString(),
                                      'user': locator<LoginProvider>().userRepository.user.id.toString(),
                                    };

                                    final Map<String,
                                        dynamic> response = await vehicleProvider
                                        .registerTrip(data);

                                    if (response.containsKey('error')) {
                                      Scaffold.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Ha surgido un problema. Inténtalo de nuevo.'),
                                        ),
                                      );
                                    }
                                    else {
                                      Scaffold.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('¡Registro exitoso!'),
                                        ),
                                      );
                                      cleanFields();
                                    }
                                  }
                                },
                                child: const Text(
                                  'Registrar Mantenimiento',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
            ),
          ),
        ));
  }
}


/*
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
*/