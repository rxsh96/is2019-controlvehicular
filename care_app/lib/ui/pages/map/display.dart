import 'package:care_app/ui/pages/map/local_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

class Display extends StatefulWidget {

  
  Display(this.tab);
  final String tab;
  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {

   @override
   void initState() {
     super.initState();
     _myActivity = '';
     _myActivityResult = '';
   }

  //  void _saveForm() {
  //    var form = formKey.currentState;
  //    if (form.validate()) {
  //      form.save();
  //      setState(() {
  //        _myActivityResult = _myActivity;
  //      });
  //    }
  //  }


  String _myActivity;

  String _myActivityResult;

  final formKey = GlobalKey<FormState>();

  bool isPressed=false;


  @override
  Widget build(BuildContext context) {
    return ListView(
      children:<Widget>[
        _showFilter(),
        // Center(
        //  child: Text('Estas en la pantalla ${widget.tab}'),
        // ),
        makeCard(LocalDetailPage.ID),
        makeCard(LocalDetailPage.ID),
        makeCard(LocalDetailPage.ID),
        makeCard(LocalDetailPage.ID),
        makeCard(LocalDetailPage.ID),
        makeCard(LocalDetailPage.ID),
        

      ]
    );
  }


 Widget makeCard ( String ruta ){
   return GestureDetector(
          onTap: (){
            //Aquí pasaremos el parámetro para redirigir al perfil del local
            //Navigator.pushNamed(context, '/$ruta', arguments: argumento);
            Navigator.pushNamed(context, '$ruta');
          },
        child: Card(

        elevation: 8.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: const Color.fromRGBO(103, 110, 122, .6)),
          child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: const EdgeInsets.only(right: 12.0),
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1.0, color: Colors.white24))),
            child: Icon(Icons.local_car_wash, color: Colors.white),
          ),
          title: Text(
            'Nombre de local',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              Icon(Icons.linear_scale, color: Colors.orangeAccent),
              Text('Resumen de la actividad', style: TextStyle(color: Colors.white))
            ],
          ),
          trailing:
              IconButton(
                icon: Icon(Icons.star, size: 30.0,
                            color: isPressed ? Colors.yellow
                                             : Colors.grey[300]
                          ),
                onPressed: (){
                  setState(()=>isPressed= true); 
                },
              ),       
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
                padding: const EdgeInsets.all(16),
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