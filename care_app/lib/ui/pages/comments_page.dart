import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {
  @override
  _CommentsPageState createState() => _CommentsPageState();
  static const String ID = 'comments';
  
}

class _CommentsPageState extends State<CommentsPage> {

   Color color ;
   Icon emoji ;


   Widget _floatingButton( Icon emoji, Color color){
     emoji = Icon( Icons.mood_bad );
     color = Colors.grey;
     return FloatingActionButton.extended(
            label: const Text('¿Te gusta CareApp?'),     
            icon: emoji,
            backgroundColor: color,
            onPressed: (){
              print('hiakjhakhakgha');
                setState(() {
                    emoji = Icon( Icons.mood );
                    color = Colors.yellow;
     
                });
            });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'COMENTARIOS Y SUGERENCIAS',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: ListView(

        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
        children: <Widget>[
 
          Padding(
            padding: const EdgeInsets.only(top:25),
            child: const Text('Asunto'),
          ),

          TextField(
            controller:null ,
            maxLines: 1,
            decoration: InputDecoration(
                hintText: 'Ingrese su comentario o sugerencia.',  
                border: OutlineInputBorder()
            )
          ),


          Padding(
            padding: const EdgeInsets.only(top:25),
            child: const Text('Ingrese su comentario o sugerencia'),
          ),

          TextField(
            controller:null ,
            maxLines: 7,
            decoration: InputDecoration(
                hintText: '¿Qué tal?.',  
                border: OutlineInputBorder()
            )
          ),


          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                
               Column(
                  children: <Widget>[
                         _floatingButton( emoji , color)

                      ],
                )

              ],
            ),
          )

        ]        
      ),
      bottomNavigationBar:BottomAppBar(
       color: const Color.fromRGBO(203, 99, 51, 1),
        child: MaterialButton(
            onPressed: () {},
            child: const Text( 'Enviar',
            textAlign: TextAlign.center,
                style: TextStyle(
                 color: Colors.white,
                ),
            ),
        ),
      ),   
    );
  }
}