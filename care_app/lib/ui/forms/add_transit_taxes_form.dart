import 'package:care_app/core/src/enums/view_state_enum.dart';
import 'package:care_app/core/src/provider/login_provider.dart';
import 'package:care_app/ui/components/my_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddTransitTaxesForm extends StatefulWidget {
  @override
  _AddTransitTaxesFormState createState() => _AddTransitTaxesFormState();
}

class _AddTransitTaxesFormState extends State<AddTransitTaxesForm> {
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _agentNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<String> _agency = <String>['ATM', 'CTE'];
  String _selected;
  bool flag = true;
  DateTime _date;

  void cleanFields() {
    _reasonController.text = _valueController.text =
        _placeController.text = _agentNameController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder:
          (BuildContext context, LoginProvider loginProvider, Widget widget) =>
              Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[

                MyTextFormField(
                  controller: _reasonController,
                  capitalization: TextCapitalization.words,
                  textInputType: TextInputType.text,
                  label: 'Motivo',
                  icon: Icons.power_input,
                  errorMsg: 'Ingrese su motivo',
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextField(
                  onTap: () async {
                    _date = await showRoundedDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime.now().year - 10),
                      lastDate: DateTime(DateTime.now().year + 1),
                      borderRadius: 16,
                    );
                    _dateController.text =
                        DateFormat('yyyy-MM-dd').format(_date);
                  },
                  focusNode: FirstDisabledFocusNode(),
                  controller: _dateController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    labelText: 'Fecha de la multa',
                    suffixIcon: Icon(Icons.calendar_today),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(203, 99, 51, 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                MyTextFormField(
                  controller: _valueController,
                  capitalization: TextCapitalization.words,
                  textInputType: TextInputType.number,
                  label: 'Valor a pagar',
                  icon: Icons.monetization_on,
                  errorMsg: 'Ingrese sus datos',
                ),
                const SizedBox(
                  height: 10.0,
                ),
                MyTextFormField(
                  controller: _placeController,
                  capitalization: TextCapitalization.words,
                  textInputType: TextInputType.text,
                  label: 'Lugar',
                  icon: Icons.place,
                  errorMsg: 'Ingrese sus datos',
                ),
                const SizedBox(
                  height: 25.0,
                ),
                DropdownButton<String>(
                  hint: const Text('Seleccione la agencia'),
                  value: _agency[0],
                  onChanged: (String newValue) {
                    setState(() {
                      _selected = newValue;
                    });
                  },
                  items: _agency.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                MyTextFormField(
                  controller: _agentNameController,
                  capitalization: TextCapitalization.words,
                  textInputType: TextInputType.text,
                  label: 'Nombre del agente',
                  icon: Icons.place,
                  errorMsg: 'Ingrese nombre del agente',
                ),
                if (loginProvider.state == ViewState.Busy)
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromRGBO(203, 99, 51, 1),
                    ),
                  ),
                const SizedBox(
                  height: 35.0,
                ),
                if (loginProvider.state == ViewState.Idle)
                  MaterialButton(
                    color: const Color.fromRGBO(203, 99, 51, 1),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {

                        final Map<String, String> tax = <String, String>{
                          'value': _valueController.text,
                          'date': _dateController.text,
                          'reason': _reasonController.text,
                          'address': _placeController.text,
                          'agency': _selected,
                          'agent': _agentNameController.text,
                          'user': loginProvider.userRepository.user.id.toString(),
                        };

                        print(tax);

                        final Map<String, dynamic> response =
                        await loginProvider.postTaxes(tax);

                        if (response.containsKey('error')) {
                          Scaffold.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Ha surgido un problema. Inténtalo de nuevo.'),
                            ),
                          );
                        } else {
                          Scaffold.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('¡Registro exitoso!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          cleanFields();
                        }
                      }
                    },
                    child: const Text(
                      'Registrarme',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FirstDisabledFocusNode extends FocusNode {
  @override
  bool consumeKeyboardToken() {
    return false;
  }
}
