
import 'package:care_app/core/locator.dart';
import 'package:care_app/core/src/provider/login_provider.dart';
import 'package:care_app/ui/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_menu_options.dart';

class MyMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: const Color.fromRGBO(32, 32, 32, 1),
          child: ListView(
            children: <Widget>[
              //Container(color: Color.fromRGBO(32, 32, 32, 1)),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: GestureDetector(
                        child: const CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 40.0,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/myProfilePage');
                        },
                      ),
                    ),
                    GestureDetector(
                      child: Text(Provider.of<LoginProvider>(context).user.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(203, 99, 51, 1),
                            fontSize: 16),),
                      onTap: () {
                        Navigator.pushNamed(context, '/myProfilePage');
                      },
                    )
                  ],
                ),
              ),

              const Divider(color: Colors.grey),
              const MyMenuOptions(
                optionName: 'Locales',
                icon: 'location_pointer',
                route: 'localesPage',
              ),
              const MyMenuOptions(
                optionName: 'Viajes',
                icon: 'menu_viajes',
                route: 'tripPage',
              ),
              const MyMenuOptions(
                optionName: 'Notificaciones',
                icon: 'menu_notificaciones',
                route: null,
              ),
              const MyMenuOptions(
                optionName: 'Encuesta',
                icon: 'menu_notificaciones',
                route: null,
              ),
              const MyMenuOptions(
                optionName: 'Guía de mantenimiento',
                icon: 'menu_guia',
                route: null,
              ),
              const MyMenuOptions(
                optionName: 'Reporte de accidentes',
                icon: 'menu_reporte',
                route: null,
              ),
              const SizedBox(height: 45.0),
              const Divider(color: Colors.grey, height: 5.0),
              const SizedBox(height: 15.0),
              const MyMenuOptions(
                optionName: 'Configuración',
                icon: 'menu_configuracion',
                route: null,
              ),
              ListTile(
                leading: Image.asset(
                  'images/flecha_atras.png',
                  width: 20,
                  height: 20,
                ),
                title: GestureDetector(
                  child: const Text(
                    'Cerrar Sesión',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  onTap: () {
                    locator<LoginProvider>().signOut();
                    Navigator.pushNamed(context, LoginPage.ID);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//
//
//class MyMenu extends StatefulWidget {
//  @override
//  _MyMenuState createState() => _MyMenuState();
//}
//
//class _MyMenuState extends State<MyMenu> {
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: Drawer(
//        child: Container(
//          color: const Color.fromRGBO(32, 32, 32, 1),
//          child: ListView(
//            children: <Widget>[
//              //Container(color: Color.fromRGBO(32, 32, 32, 1)),
//              Container(
//                child: Row(
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.all(30.0),
//                      child: GestureDetector(
//                        child: const CircleAvatar(
//                          backgroundColor: Colors.grey,
//                          radius: 40.0,
//                        ),
//                        onTap: () {
//                          Navigator.pushNamed(context, '/myProfilePage');
//                        },
//                      ),
//                    ),
//                    GestureDetector(
//                      child: Text('Usuario',
//                        style: TextStyle(
//                            fontWeight: FontWeight.bold,
//                            color: const Color.fromRGBO(203, 99, 51, 1),
//                            fontSize: 16),),
//                      onTap: () {
//                        Navigator.pushNamed(context, '/myProfilePage');
//                      },
//                    )
//                  ],
//                ),
//              ),
//
//              const Divider(color: Colors.grey),
//              const MyMenuOptions(
//                optionName: 'Locales',
//                icon: 'location_pointer',
//                route: 'localesPage',
//              ),
//              const MyMenuOptions(
//                optionName: 'Viajes',
//                icon: 'menu_viajes',
//                route: 'tripPage',
//              ),
//              const MyMenuOptions(
//                optionName: 'Notificaciones',
//                icon: 'menu_notificaciones',
//                route: null,
//              ),
//              const MyMenuOptions(
//                optionName: 'Encuesta',
//                icon: 'menu_notificaciones',
//                route: null,
//              ),
//              const MyMenuOptions(
//                optionName: 'Guía de mantenimiento',
//                icon: 'menu_guia',
//                route: null,
//              ),
//              const MyMenuOptions(
//                optionName: 'Reporte de accidentes',
//                icon: 'menu_reporte',
//                route: null,
//              ),
//              const SizedBox(height: 45.0),
//              const Divider(color: Colors.grey, height: 5.0),
//              const SizedBox(height: 15.0),
//              const MyMenuOptions(
//                optionName: 'Configuración',
//                icon: 'menu_configuracion',
//                route: null,
//              ),
//              ListTile(
//                leading: Image.asset(
//                  'images/flecha_atras.png',
//                  width: 20,
//                  height: 20,
//                ),
//                title: GestureDetector(
//                  child: const Text(
//                    'Cerrar Sesión',
//                    style: TextStyle(color: Colors.white, fontSize: 15),
//                  ),
//                  onTap: () {
//                    locator<LoginProvider>().signOut();
//                    Navigator.pushNamed(context, LoginPage.ID);
//                  },
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
