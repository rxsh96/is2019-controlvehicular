import 'package:care_app/core/locator.dart';
import 'package:care_app/core/src/enums/view_state_enum.dart';
import 'package:care_app/core/src/provider/vehicle_provider.dart';
import 'package:care_app/core/src/repository/user_repository.dart';
import 'package:flutter/material.dart';

import 'package:care_app/ui/components/my_text_form_field.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class AddCostGasolinePage extends StatefulWidget {
  const AddCostGasolinePage({Key key}) : super(key: key);

  @override
  _AddCostGasolinePageState createState() => _AddCostGasolinePageState();

  static const String ID = 'gasolinePage';
}

class _AddCostGasolinePageState extends State<AddCostGasolinePage> {
  final TextEditingController _buyController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _namePlaceController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<String> _gasolineList = <String>['Super', 'Eco', 'Diesel'];
  String _selectedGasoline;

  final List<String> _paymentList = <String>['Efectivo', 'T. Crédito', 'T. Débito'];
  String _selectedPayment;

  DateTime _buyDate;

  void cleanFields(){
    _buyController.text = _valueController.text = _namePlaceController.text = _addressController.text = '';
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
              child: const Text(
                'Registro de Gasolina',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Image.asset(
              'images/logo2.png',
              fit: BoxFit.contain,
              height: 32,
            ),
          ],
        ),
      ),
      body: ChangeNotifierProvider<VehicleProvider>(
        create: (BuildContext context) => locator<VehicleProvider>(),
        child: Consumer<VehicleProvider>(
            builder: (BuildContext context, VehicleProvider vehicleProvider,
                Widget child) =>
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      DropdownButton<String>(
                        hint: const Text('Seleccione tipo de gasolina'),
                        value: _selectedGasoline,
                        onChanged: (String newValue) {
                          setState(() {
                            _selectedGasoline = newValue;
                          });
                        },
                        items: _gasolineList.map((String gasolineType) {
                          return DropdownMenuItem<String>(
                            child: Text(gasolineType),
                            value: gasolineType,
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 15.0),
                      MyTextFormField(
                          controller: _valueController,
                          capitalization: TextCapitalization.none,
                          textInputType: TextInputType.number,
                          label: 'Precio',
                          icon: Icons.attach_money,
                          errorMsg: 'Ingresa valor de la compra'),
                      const SizedBox(height: 15,),
                      DropdownButton<String>(
                        hint: const Text('Seleccione forma de pago'),
                        value: _selectedPayment,
                        onChanged: (String newValue) {
                          setState(() {
                            _selectedPayment = newValue;
                          });
                        },
                        items: _paymentList.map((String paymentType) {
                          return DropdownMenuItem<String>(
                            child: Text(paymentType),
                            value: paymentType,
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 15,),
                      TextField(
                        onTap: () async {
                          _buyDate = await showRoundedDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(DateTime.now().year - 10),
                            lastDate: DateTime(DateTime.now().year + 1),
                            borderRadius: 16,
                          );
                          _buyController.text =
                              DateFormat('yyyy-MM-dd').format(_buyDate);
                        },
                        focusNode: FirstDisabledFocusNode(),
                        controller: _buyController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          labelText: 'Fecha de la compra',
                          suffixIcon: Icon(Icons.calendar_today),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(203, 99, 51, 1),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      MyTextFormField(
                          controller: _namePlaceController,
                          capitalization: TextCapitalization.words,
                          textInputType: TextInputType.text,
                          label: 'Nombre del establecimiento',
                          icon: Icons.text_fields,
                          errorMsg: 'Ingresa nombre del local'),
                      const SizedBox(height: 15,),
                      MyTextFormField(
                          controller: _addressController,
                          capitalization: TextCapitalization.words,
                          textInputType: TextInputType.text,
                          label: 'Dirección',
                          icon: Icons.map,
                          errorMsg: 'Ingresa la dirección del local'),
                      const SizedBox(height: 15,),
                      if (vehicleProvider.state == ViewState.Busy)
                        const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color.fromRGBO(203, 99, 51, 1),
                          ),
                        ),
                      if (vehicleProvider.state == ViewState.Idle)
                        MaterialButton(
                          color: const Color.fromRGBO(203, 99, 51, 1),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {

                            final Map<String, dynamic> data = <String, dynamic>{
                              'expense_value': _valueController.text,
                              'payment_method': _selectedPayment,
                              'date': _buyController.text,
                              'address': _addressController.text,
                              'name': _namePlaceController.text,
                              'user': locator<UserRepository>().user.id.toString(),
                            };

                            print(data);

                              final Map<String, dynamic> response = await vehicleProvider.postExpense(data);

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
                                  ),
                                  //Navigator.pushNamed(context, VehiclePage.ID)
                                );
                                cleanFields();
                              }
                            }
                          },
                          child: const Text(
                            'Añadir Vehículo',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ],
                      ),
                ),
              ),
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