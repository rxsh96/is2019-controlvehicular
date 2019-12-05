import 'package:care_app/core/src/models/user_model.dart';
import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage(this.user);

  static const String ID = 'myProfilePage';

  final User user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'MI PERFIL',
            style: TextStyle(fontSize: 18),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text(
                'User',
                style: TextStyle(color: Colors.black),
              ),
              radius: 60.0,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              user.name + ' ' + user.lastname,
              style: const TextStyle(
                fontSize: 30.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.black,
              ),
            ),
            Card(
              color: Colors.white,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                ),
                title: Text(
                  user.phone_number,
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                ),
                title: Text(
                  user.email,
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
