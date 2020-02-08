import 'package:flutter/material.dart';

class InfoCard extends StatefulWidget {

  const InfoCard({this.route, this.localName, this.description, this.iconLeading});

  final String route;
  final String localName;
  final String description;
  final IconData iconLeading;

  @override
  _InfoCardState createState() => _InfoCardState(
     route: route, localName: localName, description: description, iconLeading: iconLeading
  );
}

class _InfoCardState extends State<InfoCard> {
  _InfoCardState({this.route, this.localName, this.description, this.iconLeading});
  final String route;
  final String localName;
  final String description;
  final IconData iconLeading;

  bool isPressed = false;
  int count = 1 ;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: (){
            //Navigator.pushNamed(context, '/$ruta', arguments: argumento);
            Navigator.pushNamed(context, '$route');
          },
        child: Card(
        elevation: 8.0,
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: const BoxDecoration(color:  Color.fromRGBO(103, 110, 122, .6)),
          child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: const EdgeInsets.only(right: 12.0),
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1.0, color: Colors.white24))),
            child: Icon(iconLeading, color: Colors.white),
          ),
          title: Text(
            localName,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize:20.0 ),
          ),
          
          subtitle: Row(
            children: <Widget>[
              Icon(Icons.linear_scale, color: const Color.fromRGBO(203, 99, 51, 1),),
              Text(description, style: const TextStyle(color: Colors.white))
            ],
          ),
          trailing:
              IconButton(
                icon: Icon(Icons.star, size: 30.0,
                            color: isPressed ? Colors.yellow
                                             : Colors.grey[300]
                ),
                onPressed: (){
                  count ++ ;
                  count.isEven ? 
                              setState(() => isPressed= true ) 
                              : 
                              setState(() => isPressed= false );              
                },
              )
                
        ),
      ),
     ),
   );
  }
}