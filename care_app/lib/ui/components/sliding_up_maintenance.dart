import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SlidingMaintenance extends StatefulWidget {
  SlidingMaintenance ({this.name});

  final String name;
  @override
  _SlidingMaintenanceState createState() => _SlidingMaintenanceState(
    name: name,
    
  );
}

class _SlidingMaintenanceState extends State<SlidingMaintenance> {
  _SlidingMaintenanceState ({this.name});
  final String name;

  
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
              // onPressed: () => pc.open(),
              color: const Color(0xfff0f0f0),
              padding: const EdgeInsets.symmetric(horizontal:15.0,vertical: 15.0 ),            
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                    Expanded(
                      child: Text('Hola',
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
                        // pc.hide();
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