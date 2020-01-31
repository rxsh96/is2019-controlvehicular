import 'package:care_app/core/src/enums/view_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:care_app/core/src/provider/business_provider.dart';


import 'package:provider/provider.dart';

class LightsPage extends StatefulWidget {
  const LightsPage({Key key}) : super(key: key);
  static const String ID = 'lightsPage';

  @override
  _LightsPageState createState() => _LightsPageState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


class _LightsPageState extends State<LightsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BusinessProvider>(
        builder: (BuildContext context, BusinessProvider businessProvider, _){
        return Scaffold(
        body: Form(
          key: _formKey,
          child: ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
            children: <Widget>[
              if (businessProvider.state == ViewState.Busy)
                Container(
                  width: 50 ,
                  height: 50,
                  child: const CircularProgressIndicator(                
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromRGBO(203, 99, 51, 1),
                    ),
                  )
                ),
              if (businessProvider.state == ViewState.Idle)
                MaterialButton(
                  color: const Color.fromRGBO(203, 99, 51, 1),
                  onPressed: () async {
                    if (_formKey.currentState.validate())  {
                      final String response = await businessProvider.fetchBusiness().toString();
                      final Map<String, dynamic> business = <String, dynamic>{
                        'lat': response.toString(),
                      };  
                      print(business);
                    }
                  },
                  child: const Text(
                    'Añadir Vehículo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}