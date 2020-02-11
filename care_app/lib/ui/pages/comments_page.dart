import 'package:care_app/core/src/repository/user_repository.dart';
import 'package:care_app/ui/components/my_text_form_field.dart';
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
  Color color = Colors.grey;

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
            child: const Text('Comentarios', style: TextStyle(fontSize: 16),),
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
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 15.0,),
                MyTextFormField(controller: _inputTitle,
                hint: '¡Me gusta CareApp!', capitalization: TextCapitalization.sentences,
                label: 'Título', errorMsg: 'Ingresa un título',
                icon: Icons.title,),
                const SizedBox(height: 25.0,),
                MyTextFormField(controller: _inputDescription,
                  hint: '¡Me ayudan a estar al tanto de que mantenimientos hacerle a mi vehículo!', capitalization: TextCapitalization.sentences,
                  label: 'Descripción', errorMsg: 'Ingresa una descripción',
                  icon: Icons.description,
                  maxLines: 3,
                ),
                const SizedBox(height: 25.0,),
              ]),
        ),
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
