import 'package:flutter/material.dart';

class LocalDetailPage extends StatefulWidget {
  @override
  _LocalDetailPageState createState() => _LocalDetailPageState();
}

class _LocalDetailPageState extends State<LocalDetailPage> {


final TextEditingController _textController1 = TextEditingController();
final TextEditingController _textController2 = TextEditingController();

  @override
  void initState() {   
    super.initState();
    _textController1.text = "Dirección del local";
    _textController2.text = "Teléfono del local";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Theme.of(context).primaryColor,
         title: Text('LOCALES'),
       ),
       body: _showLocal(),

    );
  }

  Widget _showLocal(){
    return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10.0),
              child: ListTile(
              title: Text(
               'Nombre local',
                style: TextStyle(
                 fontWeight: FontWeight.bold , fontSize: 25
                ),
              ) ,
             subtitle:Text(
               'Descripción del local',
                style: TextStyle(
                 fontSize: 10
                ),
             ), 
             trailing: CircleAvatar(
             radius: 70.0,
             backgroundColor: Color.fromRGBO(103, 110, 122, .9)),
           ),
          ),
          _crearInput( _textController1 ,Icons.map , 'Dirección' , 'Ingrese la dirección del local'),
          _crearInput( _textController2 ,Icons.phone_android , 'Teléfono' , 'Ingrese la dirección del local'),
          _crearButton()


          ], 
      
    );
    
  }

  Widget _crearButton(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 75.0, horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          
          _crearFlat('Desafiliarme' , 'gasolineras'),
          _crearFlat('Ver en mapa', 'gasolineras')

          
        ],
      ),
    );
  }


  Widget _crearFlat( String texto , String ruta){
    return FlatButton(
         color: Color.fromRGBO(203, 99, 51, 0.9),
         textColor: Colors.white,
         disabledColor: Colors.grey,
         disabledTextColor: Colors.black,
         padding: EdgeInsets.all(18.0),
         splashColor: Colors.blueAccent,
         onPressed: () {
           //Aquí pasamos el parámetro del lat y long de este local como un argument a la ruta
           Navigator.pushNamed(context, '/$ruta');
         },
         child: Text(
          "$texto",
          style: TextStyle(fontSize: 20.0),
         ),
       );
  }


 Widget _crearInput( TextEditingController _textController ,IconData icon , String label , String hint ){
   
  return Padding(
    padding: EdgeInsets.symmetric( horizontal: 12.0 , vertical: 5.0),
    child: TextField (
      controller: _textController,
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

}