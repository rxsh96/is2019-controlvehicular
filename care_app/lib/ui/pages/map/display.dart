import 'package:care_app/ui/components/my_info_card.dart';
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
        widget.tab == 'Primera' ? _showFilter() : const Padding(padding:  EdgeInsets.all(20.0),),
        // Center(
        //  child: Text('Estas en la pantalla ${widget.tab}'),
        // ),
        const InfoCard( route: LocalDetailPage.ID, localName: 'Nombre del local', description: 'Descripción del local', iconLeading: Icons.local_car_wash, ),
        // makeCard(LocalDetailPage.ID),
      ]
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