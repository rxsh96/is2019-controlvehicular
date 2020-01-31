import 'package:flutter/material.dart';
import 'package:care_app/core/src/provider/business_provider.dart';


import 'base_page.dart';

class LightsPage extends StatefulWidget {
  const LightsPage({Key key}) : super(key: key);
  static const String ID = 'lightsPage';

  @override
  _LightsPageState createState() => _LightsPageState();
}

class _LightsPageState extends State<LightsPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage<BusinessProvider>(
        builder: (BuildContext context, BusinessProvider businessProvider,
        Widget child) {

          businessProvider.fetchBusiness();

          return SafeArea( child: Scaffold(
            body: MaterialButton(onPressed: () {
              print(businessProvider.business);
            }, child: const Text('Ver'),),
      ));
    });
  }
}