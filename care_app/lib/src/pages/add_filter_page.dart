import 'package:flutter/material.dart';

class AddFilterPage extends StatefulWidget {
  const AddFilterPage({Key key}) : super(key: key);

  @override
  _AddFilterPageState createState() => _AddFilterPageState();
}

class _AddFilterPageState extends State<AddFilterPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('MIS VEHICULOS', style: TextStyle(fontSize: 17)),
      ),
      body: ListView(
        children: <Widget>[
          _crearFranjas(context, 'FILTROS', 1.0, 'filtro'),
          const SizedBox(height: 5.0),
          /*_radioBottom('Cambio'),
              _radioBottom('Mantenimiento'),*/
          _crearInput(Icons.local_laundry_service, 'Servicio',
              'Ingrese el servicio proporcionado'),
          const SizedBox(height: 5.0),
          _crearFecha(context),
          const SizedBox(height: 5.0),
          _crearInput(
              Icons.attach_money, 'Costo', 'Ingrese el costo del servicio'),
          const SizedBox(height: 5.0),
          _crearInput(
              Icons.explore, 'Dirección', 'Ingrese la dirección del servicio'),

        ],
      ),
          bottomNavigationBar: _submitVehiculo(context),
    ));
  }

  Widget _crearFecha(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
      child: TextField(
        enableInteractiveSelection: false,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Fecha de mantenimiento',
            labelText: 'Fecha de mantenimiento',
            suffixIcon: Icon(Icons.calendar_today)),
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          //_selectDate( context );
        },
      ),
    );
  }

  /*void _selectDate(BuildContext context){
    DateTime picked = showDatePicker(
        context: null,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
    );

    if (picked != null){



      //FAVOR PROBAR ESTO

    }
  }

  Widget _radioBottom( String texto){

    bool _bloquearCheck = false ;
    return CheckboxListTile(
     title: Text(texto),
      value: _bloquearCheck,
      onChanged: (valor){

       //No se porque no me sale el set state REVISAR POR FAVOR
       setState((){
         _bloquearCheck = valor;

       });


      },

    );
  }*/

  Widget _crearFranjas(BuildContext context, String mantenimiento,
      double transparencia, String icono) {
    return BottomAppBar(
      color: Color.fromRGBO(203, 99, 51, transparencia),
      child: Row(
        children: <Widget>[
          MaterialButton(
            //Para hacer el ruteo
            onPressed: () {
              Navigator.pop(context);
            },

            child: Text(
              mantenimiento,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),

          const SizedBox(height: 105.0, width: 165),
          //Icon(Icons.airline_seat_flat_angled),
          Image(
              image: AssetImage('images/$icono.png'),
              height: 60,
              alignment: Alignment.bottomRight)
        ],
      ),
    );
  }

  Widget _crearInput(IconData icon, String label, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
            //counter: Text('Letras 0'),
            //helperText: 'Solo es el nombre',
            labelText: label,
            hintText: hint,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: const Color.fromRGBO(203, 99, 51, 1),
              ),
            ),
            suffixIcon: Icon(icon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
      ),
    );
  }

  Widget _submitVehiculo(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromRGBO(203, 99, 51, 1),
      child: MaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, '/vehiculos');
        },
        child: Text(
          'GUARDAR',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
