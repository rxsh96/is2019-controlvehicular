import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sliding extends StatefulWidget {
  @override
  _SlidingState createState() => _SlidingState();
}

class _SlidingState extends State<Sliding> {
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
              onPressed: (){},
              color: const Color(0xfff0f0f0),
              padding: const EdgeInsets.symmetric(horizontal:15.0,vertical: 15.0 ),            
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  
                    Text('Donde quieres ir?',
                    style: TextStyle(
                      color: Colors.black12,
                      fontSize: 19,
                    ),
                  ),
                  Icon(Icons.style, color: Colors.black12,size: 30,)
                ],
              ),
                
            ),
          )
        ],
      )
    );
  }
}