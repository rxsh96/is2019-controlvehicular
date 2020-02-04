import 'package:flutter/material.dart';

import 'package:care_app/core/src/provider/login_provider.dart';
import 'package:care_app/ui/forms/add_user_form.dart';


import 'base_page.dart';

class AddUserPage extends StatefulWidget {
  static const String ID = 'addUserPage';

  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {

  @override
  Widget build(BuildContext context) {
    return BasePage<LoginProvider>(
      builder:
          (BuildContext context, LoginProvider loginProvider, Widget child) =>
              SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text('Registro', style: TextStyle(fontSize: 18)),
                Image.asset(
                  'images/logo2.png',
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
          body:  ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30.0),
          children: <Widget>[
            AddUserForm(),
          ],
        ),
        ),
      ),
    );
  }
}



