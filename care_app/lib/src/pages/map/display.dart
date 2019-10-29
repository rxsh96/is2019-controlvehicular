import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

class Display extends StatefulWidget {


  Display(this.tab);
  final String tab;
  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {

  // @override
  // void initState() {
  //   super.initState();
  //   _myActivity = '';
  //   _myActivityResult = '';
  // }

  // _saveForm() {
  //   var form = formKey.currentState;
  //   if (form.validate()) {
  //     form.save();
  //     setState(() {
  //       _myActivityResult = _myActivity;
  //     });
  //   }
  // } 


  String _myActivity;

  String _myActivityResult;

  final formKey = new GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return ListView(
      children:<Widget>[
        _showFilter(),
        // Center(
        //  child: Text('Estas en la pantalla ${widget.tab}'),
        // ),
        makeCard('localdetail'),
        makeCard('localdetail'),
        makeCard('localdetail'),
        makeCard('localdetail'),
        makeCard('localdetail'),
        makeCard('localdetail')
        

      ]
    );
  }




 ListTile _makeListTile (){
   return ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child: Icon(Icons.autorenew, color: Colors.white),
        ),
        title: Text(
          "Introduction to Driving",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: Row(
          children: <Widget>[
            Icon(Icons.linear_scale, color: Colors.yellowAccent),
            Text(" Intermediate", style: TextStyle(color: Colors.white))
          ],
        ),
        trailing:
            Icon(Icons.star_border, color: Colors.white, size: 30.0)
    );
 } 


 Widget makeCard ( String ruta ){
   return GestureDetector(
          onTap: (){
            //Aquí pasaremos el parámetro para redirigir al perfil del local
            //Navigator.pushNamed(context, '/$ruta', arguments: argumento);
            Navigator.pushNamed(context, '/$ruta');
          },
        child: Card(

        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(103, 110, 122, .6)),
          child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: Icon(Icons.local_car_wash, color: Colors.white),
          ),
          title: Text(
            "Nombre de local",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              Icon(Icons.linear_scale, color: Colors.orangeAccent),
              Text(" Resumen de la actividad", style: TextStyle(color: Colors.white))
            ],
          ),
          trailing:
              Icon(Icons.star,  color: Colors.white  , size: 30.0),
              
      ),
        ),
  ),
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

                  titleText: 'Mis mantenimientos',
                  hintText: 'Escoja mantenimientos a filtrar',
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
                  dataSource: const <Map<String, String>>[
                    {
                      "display": "Filtros de aceite",
                      "value": "Filtros de aceite",
                    },
                    {
                      "display": "Revisión de frenos",
                      "value": "Revisión de frenos",
                    },
                    {
                      "display": "Cambio de aceite",
                      "value": "Cambio de aceite",
                    },
                    {
                      "display": "Mantenimiento general",
                      "value": "Mantenimiento general",
                    },
                    {
                      "display": "Revisión de luces",
                      "value": "Revisión de luces",
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
}