import 'package:flutter/material.dart';


class MyBanner extends StatefulWidget {

  const MyBanner({this.label, this.icon});

  final String label;
  final String icon;
  
  @override
  _MyBannerState createState() => _MyBannerState(
    label:label,
    icon:icon
  );
}

class _MyBannerState extends State<MyBanner> {

     _MyBannerState({this.label, this.icon });
    final String label;
    final String icon;




  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromRGBO(203, 99, 51, 1),
      child: Row(
        children: <Widget>[
          MaterialButton(
            onPressed: () {
              //Navigator.pushNamed(context, VehiclePage.ID);
            },
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0
              ),
            ),
          ),
          const SizedBox(height: 105.0, width: 165),
          Image(
              image: AssetImage('images/$icon.png'),
              height: 60,
              alignment: Alignment.bottomRight)
        ],
      ),
    );
  }
}