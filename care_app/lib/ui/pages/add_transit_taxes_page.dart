import 'package:care_app/core/src/provider/login_provider.dart';
import 'package:care_app/ui/forms/add_transit_taxes_form.dart';
import 'package:flutter/material.dart';

import 'base_page.dart';


class AddTransitTaxesPage extends StatefulWidget {

  static const String ID = 'addTransitTaxesPage';
  @override
  _AddTransitTaxesPageState createState() => _AddTransitTaxesPageState();
}

class _AddTransitTaxesPageState extends State<AddTransitTaxesPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage<LoginProvider>(
      builder:
          (BuildContext context, LoginProvider loginProvider, Widget child) =>
      SafeArea(
        child: Scaffold(
           appBar: AppBar(
             title: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Container(
                   padding: const EdgeInsets.all(8.0),
                   child: const Text(
                     'Añadir Multa',
                     style: TextStyle(fontSize: 16),
                   ),
                 ),
                 Image.asset(
                   'images/logo2.png',
                   fit: BoxFit.contain,
                   height: 32,
                 ),
               ],
             ),
           ),
          body: ListView(
            padding:
            const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30.0),
            children: <Widget>[
              AddTransitTaxesForm(),
            ],
          ),
        ),
      ),
    );
  }

}