import 'package:care_app/core/src/provider/login_provider.dart';
import 'package:care_app/ui/forms/login_form.dart';
import 'package:flutter/material.dart';

import 'base_page.dart';


class LoginPage extends StatelessWidget {
  static const String ID = 'loginPage';

  @override
  Widget build(BuildContext context) {
    return BasePage<LoginProvider>(
      builder:
          (BuildContext context, LoginProvider loginProvider, Widget child) =>
          SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'images/careapp_logo.png',
                      height: 200,
                      width: 200,
                    ),
                    LoginForm(),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
