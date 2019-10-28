import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:care_app/auth/auth.dart';
import 'package:care_app/src/components/my_menu_options.dart';

class MyMenu extends StatefulWidget {
  @override
  _MyMenuState createState() => _MyMenuState();
}

class _MyMenuState extends State<MyMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: const Text('User'),
                      radius: 40.0,
                    ),
                  ),
                  Text('NOMBRE USUARIO',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(203, 99, 51, 1),
                          fontSize: 16))
                ],
              ),
            ),

            Divider(color: Colors.grey),
            const MyMenuOptions(
              optionName: 'Locales',
              icon: 'location_pointer',
              onTap: null,
            ),
            const MyMenuOptions(
              optionName: 'Viajes',
              icon: 'menu_viajes',
              onTap: null,
            ),
            const MyMenuOptions(
              optionName: 'Notificaciones',
              icon: 'menu_notificaciones',
              onTap: null,
            ),
            const MyMenuOptions(
              optionName: 'Encuesta',
              icon: 'menu_notificaciones',
              onTap: null,
            ),
            const MyMenuOptions(
              optionName: 'Guía de mantenimiento',
              icon: 'menu_guia',
              onTap: null,
            ),
            const MyMenuOptions(
              optionName: 'Reporte de accidentes',
              icon: 'menu_reporte',
              onTap: null,
            ),
            const SizedBox(height: 45.0),

            Divider(color: Colors.grey, height: 5.0),

            const SizedBox(height: 15.0),
            const MyMenuOptions(
              optionName: 'Configuración',
              icon: 'menu_configuracion',
              onTap: null,
            ),
            RaisedButton(
                child: const Text('Cerrar Sesión'),
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                }),
          ],
        ),
      ),
    );
  }
}
