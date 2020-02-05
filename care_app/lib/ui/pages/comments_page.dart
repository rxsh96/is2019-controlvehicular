import 'package:care_app/core/src/repository/user_repository.dart';
import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage(this.userRepo);

  final UserRepository userRepo;

  @override
  _CommentsPageState createState() => _CommentsPageState(userRepo);
  static const String ID = 'comments';
}

class _CommentsPageState extends State<CommentsPage> {
  _CommentsPageState(this.userRepo);

  UserRepository userRepo;
  final TextEditingController _inputTitle = TextEditingController();
  final TextEditingController _inputDescription = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool flag = true;
  Icon emoji = Icon(Icons.mood_bad);
  Color color = Colors.grey;

  Widget _floatingButton() {
    return FloatingActionButton.extended(
        label: flag
            ? const Text('¿Te gusta CareApp?',
                style: TextStyle(color: Colors.white))
            : const Text('Gracias por valorar',
                style: TextStyle(color: Colors.black)),
        icon: flag ? emoji : Icon(Icons.mood, color: Colors.black),
        backgroundColor: flag ? color : Colors.yellow,
        onPressed: () {
          flag = true;
          setState(() => flag = false);
        });
  }

  void cleanFields() {
    _inputTitle.text = _inputDescription.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            child: const Text('Comentarios'),
          ),
          Image.asset(
            'images/logo2.png',
            fit: BoxFit.contain,
            height: 32,
          ),
        ],
      )),
      body: Form(
        key: _formKey,
        child: ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text('Asunto'),
              ),
              TextFormField(
                  controller: _inputTitle,
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: 'Título', border: OutlineInputBorder()),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Ingresa un título';
                    }
                    return null;
                  }),
              const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text('Ingrese su comentario o sugerencia'),
              ),
              TextFormField(
                  controller: _inputDescription,
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: 'Descripción', border: OutlineInputBorder()),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Ingresa una descripción';
                    }
                    return null;
                  }),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[_floatingButton()],
                    )
                  ],
                ),
              )
            ]),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromRGBO(203, 99, 51, 1),
        child: MaterialButton(
          onPressed: () async {
            if (_formKey.currentState.validate()) {
              final Map<String, String> body = <String, String>{
                'title': _inputTitle.text,
                'comment_suggestion': _inputDescription.text,
                'user_suggestion': userRepo.user.id.toString()
              };
              final bool response = await userRepo.commentsAndSuggestions(body);
              if (response) {
                showDialog<dynamic>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Comentarios y Sugerencias'),
                        content: const Text('¡Gracias por su sugerencia!'),
                        actions: <Widget>[
                          FlatButton(
                            child: const Text('Listo'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
                cleanFields();
              } else {
                showDialog<dynamic>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Comentarios y Sugerencias'),
                        content: const Text(
                            'Ha surgido un problema. Vuelve a intentarlo más luego.'),
                        actions: <Widget>[
                          FlatButton(
                            child: const Text('Listo'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              }
            }
          },
          child: const Text(
            'Enviar',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
