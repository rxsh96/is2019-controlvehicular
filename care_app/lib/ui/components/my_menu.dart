import 'package:care_app/ui/pages/accident_report_page.dart';
import 'package:care_app/ui/pages/comments_page.dart';
import 'package:care_app/ui/pages/maintenance_guide_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:care_app/core/locator.dart';
import 'package:care_app/core/src/provider/login_provider.dart';
import 'package:care_app/ui/pages/login_page.dart';
import 'package:care_app/ui/pages/map/locals_page.dart';
import 'package:care_app/ui/pages/my_profile_page.dart';
import 'package:care_app/ui/pages/trip_page.dart';

import 'my_menu_options.dart';

class MyMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String pictureURL =
        Provider.of<LoginProvider>(context).userRepository.profileImageURL;

    Widget userAvatar;
    if(pictureURL == null){
      userAvatar = Image.asset(
        'images/user_avatar.png',
        height: 80,
        width: 80,
        fit: BoxFit.cover,
        color: const Color.fromRGBO(203, 99, 51, 1),
      );
    }
    else{
      userAvatar = FadeInImage(
        image: NetworkImage(pictureURL),
        placeholder:
        const AssetImage('images/auto-2.gif'),
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      );
    }

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
                        child: ClipOval(
                            child: userAvatar,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, MyProfilePage.ID,
                              arguments: Provider.of<LoginProvider>(context)
                                  .userRepository);
                        },
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        Provider.of<LoginProvider>(context)
                            .userRepository
                            .user
                            .name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(203, 99, 51, 1),
                            fontSize: 16),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, MyProfilePage.ID,
                            arguments: Provider.of<LoginProvider>(context)
                                .userRepository);
                      },
                    )
                  ],
                ),
              ),

              const Divider(color: Colors.grey),
              const MyMenuOptions(
                optionName: 'Locales',
                icon: 'location_pointer',
                route: LocalsPage.ID,
              ),
              const MyMenuOptions(
                optionName: 'Viajes',
                icon: 'menu_viajes',
                route: TripPage.ID,
              ),
              const MyMenuOptions(
                optionName: 'Notificaciones',
                icon: 'menu_notificaciones',
                route: null,
              ),
              ListTile(
                leading: Image.asset(
                  'images/menu_reporte.png',
                  width: 20,
                  height: 20,
                ),
                title: GestureDetector(
                  child: const Text(
                    'Comentarios y Sugerencias',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, CommentsPage.ID,
                        arguments:
                            Provider.of<LoginProvider>(context).userRepository);
                  },
                ),
              ),
              const MyMenuOptions(
                optionName: 'Guía de mantenimiento',
                icon: 'menu_guia',
                route: MaintenanceGuidePage.ID,
              ),
              const MyMenuOptions(
                optionName: 'Reporte de Incidentes',
                icon: 'menu_reporte',
                route: AccidentReportPage.ID,
              ),
              ListTile(
                leading: Icon(
                  Icons.call,
                  color: const Color.fromRGBO(203, 99, 50, 1),
                ),
                title: GestureDetector(
                  child: const Text(
                    'Botón de Pánico',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  onTap: () {
                    launch('tel://911');
                  },
                ),
              ),
              const SizedBox(height: 10.0),
              const Divider(color: Colors.grey, height: 5.0),
              const SizedBox(height: 5.0),
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
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        LoginPage.ID, (Route<dynamic> route) => false);
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
