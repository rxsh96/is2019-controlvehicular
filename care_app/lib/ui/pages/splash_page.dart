import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: Container(
          height: 100,
          child: Image.asset(
            'images/logo2.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
