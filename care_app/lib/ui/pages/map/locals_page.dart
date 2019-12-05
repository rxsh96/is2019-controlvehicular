import 'package:flutter/material.dart';

import 'display.dart';

class LocalsPage extends StatefulWidget {


  const LocalsPage({Key key}) : super(key: key);

  static const String ID= 'localsPage';

  @override
  _LocalsPageState createState() => _LocalsPageState();
}

class _LocalsPageState extends State<LocalsPage> with SingleTickerProviderStateMixin {

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