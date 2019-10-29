import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:care_app/src/components/my_text_form_field.dart';
import 'package:care_app/src/components/my_pass_form_field.dart';
import 'package:care_app/services/backend/api.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({Key key}) : super(key: key);

  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _inputName = TextEditingController();
  final TextEditingController _inputLastName = TextEditingController();
  final TextEditingController _inputMail = TextEditingController();
  final TextEditingController _inputPassword = TextEditingController();
  final TextEditingController _inputPhone = TextEditingController();
  File _image;
  final API api = API();

  Future<void> getImage({ImageSource source}) async {
    final File image = await ImagePicker.pickImage(source: source);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Form myUserForm = Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 15.0),
          MyTextFormField(
              controller: _inputName,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.text,
              label: 'Nombres',
              icon: Icons.font_download,
              errorMsg: 'Ingresa tu nombre'),
          const SizedBox(height: 15.0),
          MyTextFormField(
              controller: _inputLastName,
              capitalization: TextCapitalization.words,
              textInputType: TextInputType.text,
              label: 'Apellido',
              icon: Icons.font_download,
              errorMsg: 'Ingresa tu apellido'),
          const SizedBox(height: 15.0),
          MyTextFormField(
              controller: _inputPhone,
              capitalization: TextCapitalization.none,
              textInputType: TextInputType.phone,
              label: 'Teléfono',
              icon: Icons.phone,
              errorMsg: 'Ingresa tu teléfono'),
          const SizedBox(height: 15.0),
          MyTextFormField(
              controller: _inputMail,
              capitalization: TextCapitalization.none,
              textInputType: TextInputType.emailAddress,
              label: 'Correo Electrónico',
              icon: Icons.mail,
              errorMsg: 'Ingresa tu correo electrónico'),
          const SizedBox(height: 15.0),
          MyPassFormField(
            controller: _inputPassword,
            textInputType: TextInputType.text,
            label: 'Contraseña',
            icon: Icons.enhanced_encryption,
            errorMsg: 'Ingresa una contraseña',
            isLogin: false,
          ),
          const SizedBox(height: 35.0),
        ],
      ),
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('Registro', style: TextStyle(fontSize: 18)),
              Image.asset(
                'images/logo2.png',
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30.0),
          children: <Widget>[
            Container(
              child: Center(
                child: RawMaterialButton(
                  child: Container(
                    child: _image == null
                        ? CircleAvatar(
                            child: Icon(
                              Icons.add_a_photo,
                              size: 50.0,
                              color: Colors.white,
                            ),
                            backgroundColor: const Color.fromRGBO(203, 99, 51, 1),
                            radius: 50.0,
                          )
                        : CircleAvatar(
                            backgroundImage: FileImage(_image),
                            radius: 50.0,
                            backgroundColor: const Color.fromRGBO(203, 99, 51, 1),
                          ),
                  ),
                  onPressed: () {getImage(source: ImageSource.camera);}
                ),
              ),
            ),
            myUserForm,
          ],
        ),
        bottomNavigationBar: _submitUser(),
        //onTap: () { Navigator.pop(context);}
      ),
    );
  }


  void registerUser() {
    if (_formKey.currentState.validate()) {

      final Map<String, String> body = <String, String>{
        'name': _inputName.text,
        'lastname': _inputLastName.text,
        'phone_number': _inputPhone.text,
        'email': _inputMail.text.toLowerCase(),
        'password': _inputPassword.text,
        'is_active': 'true'
      };

//      if(_image != null){
//        final Map<String, String> img = <String, String>{
//          'file': _inputName.text,
//          'user': '1',
//        };
//        //api.postImage(img: img);
//      }
      api.postUser(user: body);
      //api<User>('users/', body: body);
      Navigator.pushNamed(context, '/loginPage');
    }
  }

  Widget _submitUser() {
    return BottomAppBar(
      color: const Color.fromRGBO(203, 99, 51, 1),
      child: MaterialButton(
        onPressed: () {
          registerUser();
        },
        child: Text(
          'REGISTRARSE',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
