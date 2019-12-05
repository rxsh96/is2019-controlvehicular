import 'package:flutter/material.dart';

import 'display.dart';

class LocalesPage extends StatefulWidget {
  const LocalesPage({Key key}) : super(key: key);

  @override
  _LocalesPageState createState() => _LocalesPageState();
}

class _LocalesPageState extends State<LocalesPage> with SingleTickerProviderStateMixin {

  TabController _controller;

  
  @override
  void initState(){
    super.initState();
    _controller = TabController(length: 2 , vsync: this );
  }
  @override
  void dispose (){
    //eliminando recursos 
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text('LOCALES') ,
          bottom: _getTabBar(),
        ),
      
      
      body: _getTabBarView(
        <Widget>[
          Display('Primera'),
          Display('Segunda')
        ]
      ),
      
    );
  }

 TabBar _getTabBar(){
  return TabBar(
    tabs: <Tab>[
      Tab(icon:Icon(Icons.clear_all),
          child: Text('Todos'),
      ),
      Tab(icon:Icon(Icons.star),
          child: Text('Favoritos'),
      
      ),
    ],
    controller: _controller,
  );
 }

 TabBarView _getTabBarView(dynamic displays){
   return TabBarView(
     children: displays,
     controller: _controller,
   );
 }

 
}