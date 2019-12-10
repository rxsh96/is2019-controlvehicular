import 'package:flutter/material.dart';

class KmsPage extends StatefulWidget {
  const KmsPage({Key key}) : super(key: key);

  @override
  _KmsPageState createState() => _KmsPageState();
}

class _KmsPageState extends State<KmsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: const Text('Kilometraje Page')),
    );
  }
}