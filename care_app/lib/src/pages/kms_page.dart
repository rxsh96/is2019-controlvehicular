import 'package:flutter/material.dart';

class KmsPage extends StatefulWidget {
  KmsPage({Key key}) : super(key: key);

  _KmsPageState createState() => _KmsPageState();
}

class _KmsPageState extends State<KmsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text('Kilometraje Page')),
    );
  }
}