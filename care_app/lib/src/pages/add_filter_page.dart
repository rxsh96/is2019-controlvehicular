import 'package:flutter/material.dart';

class AddFilterPage extends StatefulWidget {
  AddFilterPage({Key key}) : super(key: key);

  _AddFilterPageState createState() => _AddFilterPageState();
}

class _AddFilterPageState extends State<AddFilterPage> {


  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text("MIS VEHICULOS", style: TextStyle(fontSize: 17)),

          ),
          body: ListView(

            children: <Widget>[

              _crearFranjas( context ,'FILTROS', 1.0, 'filtro'),
              SizedBox(height: 5.0),
              _radioBottom("Cambio"),
              _radioBottom("Mantenimiento"),
              _crearInput(Icons.local_laundry_service , 'Servicio' , 'Ingrese el servicio proporcionado'),
              SizedBox(height: 5.0),
              _crearFecha( context),
              SizedBox(height: 5.0),
              _crearInput(Icons.attach_money , 'Costo' , 'Ingrese el costo del servicio'),
              SizedBox(height: 5.0),
              _crearInput(Icons.explore , 'Dirección' , 'Ingrese la dirección del servicio'),
              SizedBox(height: 35.0),
              _submitVehiculo(context)



            ],
          ),


        ));
  }

  Widget _crearFecha( BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric( horizontal: 12.0 , vertical: 5.0),
      child: TextField(
        enableInteractiveSelection: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: 'Fecha de mantenimiento',
          labelText: 'Fecha de mantenimiento',
          suffixIcon: Icon(Icons.calendar_today)
        ),
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate( context );
        },
      ),
    );
  }


   _selectDate(BuildContext context) async{
    DateTime picked = await showDatePicker(
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
  }



  Widget _crearFranjas(BuildContext context ,String mantenimiento, double transparencia , String icono) {
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
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
              ),
            ),

          ),

          SizedBox(height: 105.0, width: 165),
          //Icon(Icons.airline_seat_flat_angled),
          Image(
              image: AssetImage('images/$icono.png'),
              height: 60,
              alignment: Alignment.bottomRight)
        ],
      ),
    );
  }



  Widget _crearInput( IconData icon , String label , String hint ){
    return Padding(
      padding: EdgeInsets.symmetric( horizontal: 12.0 , vertical: 5.0),
      child: TextField (
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          //counter: Text('Letras 0'),
          //helperText: 'Solo es el nombre',
            labelText: label ,
            hintText: hint,
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(203, 99, 51, 1),)),
            suffixIcon: Icon(icon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            )

        ),
      ),
    );
  }




  Widget _submitVehiculo( BuildContext context ) {
    return BottomAppBar(
      color: Color.fromRGBO(203, 99, 51, 1),
      child: MaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, '/vehiculos');
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
