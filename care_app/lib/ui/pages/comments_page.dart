import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {


  
  @override
  _CommentsPageState createState() => _CommentsPageState();
  static const String ID = 'comments';
  
}

class _CommentsPageState extends State<CommentsPage> {

    bool flag = true;
    Icon emoji = Icon( Icons.mood_bad );
    Color color = Colors.grey;
    


   Widget _floatingButton( ){ 
     return FloatingActionButton.extended(
            label: flag ? const Text('¿Te gusta CareApp?', style: TextStyle(color: Colors.white)) 
                        : const Text('Gracias por valorar.',  style: TextStyle(color: Colors.black)),     
            icon: flag ? emoji :Icon( Icons.mood , color: Colors.black ) ,
            backgroundColor: flag ? color : Colors.yellow ,
            onPressed: (){
              print('hiakjhakhakgha');
              flag = true;
              setState(()=>flag= false);
            });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

           const Text(
              'COMENTARIOS Y SUGERENCIAS',
              style: TextStyle(fontSize: 18),
            ),
            
            Image.asset(
                  'images/logo2.png',
                  fit: BoxFit.contain,
            ),

          ],

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
                         _floatingButton( )

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