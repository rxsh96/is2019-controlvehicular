import 'package:flutter/material.dart';

class MyCardButton extends StatefulWidget {
  const MyCardButton({this.text, this.transparency, this.icon, this.route});

  final String text;
  final double transparency;
  final String icon;
  final String route;

  @override
  _MyCardButtonState createState() => _MyCardButtonState(
      text: text, transparency: transparency, icon: icon, route: route);
}

class _MyCardButtonState extends State<MyCardButton> {
  _MyCardButtonState({this.text, this.transparency, this.icon, this.route});

  final String text;
  final double transparency;
  final String icon;
  final String route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/$route');
      },
      child: BottomAppBar(
        color: Color.fromRGBO(210, 100, 50, transparency),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            MaterialButton(
              onPressed: () {},
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 75,
            ),
            Image.asset(
              'images/$icon.png',
              height: 50,
              alignment: Alignment.centerRight,
            ),
          ],
        ),
      ),
    );
  }
}