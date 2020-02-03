import 'package:flutter/material.dart';

import 'package:care_app/core/src/repository/user_repository.dart';


class MyProfilePage extends StatelessWidget {
  const MyProfilePage(this.userRepo);

  static const String ID = 'myProfilePage';

  final UserRepository userRepo;

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
            if (userRepo.profileImageURL != 'images/user_avatar.png')
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: GestureDetector(
                  child: ClipOval(
                    child: FadeInImage(
                      image: NetworkImage(userRepo.profileImageURL),
                      placeholder:
                      const AssetImage('images/auto-2.gif'),
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: GestureDetector(
                  child: ClipOval(
                    child: Image.asset(
                      'images/user_avatar.png',
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                      color: const Color.fromRGBO(203, 99, 51, 1),
                    ),
                  ),
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            Text(
              userRepo.user.name + ' ' + userRepo.user.lastname,
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
                  userRepo.user.phone_number,
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
                  userRepo.user.email,
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
