import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Sliding extends StatefulWidget {
  Sliding ({this.name,this.position,this.pc});

  final String name;
  final LatLng position;
  final PanelController pc;
  @override
  _SlidingState createState() => _SlidingState(
    name: name,
    position:position,
    pc:pc
  );
}

class _SlidingState extends State<Sliding> {
  _SlidingState ({this.name,this.position,this.pc});
  final String name;
  final LatLng position;
  final PanelController pc;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
              child: CupertinoButton(
              onPressed: () => pc.open(),
              color: const Color(0xfff0f0f0),
              padding: const EdgeInsets.symmetric(horizontal:15.0,vertical: 15.0 ),            
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                    Expanded(
                      child: Text('${name}\n\n${position.latitude},${position.longitude}',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 19,
                      ),
                  ),
                    ),
                  IconButton(
                      icon: Icon(
                      Icons.close, color: Colors.black12,size: 30 ,
                    ),
                    onPressed: (){
                        pc.hide();
                    },
                  )
                ],
              ),
                
            ),
          )
        ],
      )
    );
  }
}