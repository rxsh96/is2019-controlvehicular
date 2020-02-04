import 'package:care_app/core/services/places/places.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Toolbar extends StatefulWidget {
  @override
  _ToolbarState createState() => _ToolbarState();
}

class _ToolbarState extends State<Toolbar> {

 String query = '';
 final _places = Places();

 @override
 void initState(){
   super.initState();
   _places.onSearch = (data){
     print('result onSearch: $data');
   };
 }

 _onChanged( String text) async {
    setState((){
     query = text;
    });

    if(text.trim().length >0){
      await _places.search(text);
    }
 }

 @override
  void dispose() {
    _places.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10.0,
      right: 10.0,
      top: 15.0,
      child: SafeArea(
          child: Container(
          height: 50.0,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,    
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: <Widget>[
               Expanded(
                child:  CupertinoTextField(

                  placeholder: 'Buscando',

                  onChanged: _onChanged,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  style: TextStyle(color: Colors.black, ),
                  decoration: BoxDecoration(color:Colors.transparent),
                ),
              ),

              CupertinoButton(
                onPressed: (){},
                padding: const EdgeInsets.all(10.0),
                child:Icon(Icons.gps_fixed),
                
              )
            ],
         ),
        ),
      ),
    );
  }
}