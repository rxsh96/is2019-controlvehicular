import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: const CircularProgressIndicator(
          backgroundColor: Color.fromRGBO(203, 99, 51, 1),
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
}
