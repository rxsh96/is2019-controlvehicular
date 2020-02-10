import 'package:care_app/core/locator.dart';
import 'package:care_app/core/src/enums/view_state_enum.dart';
import 'package:care_app/core/src/models/business_model.dart';
import 'package:care_app/core/src/models/item_model.dart';
import 'package:care_app/core/src/models/model_model.dart';
import 'package:care_app/core/src/provider/business_provider.dart';
import 'package:care_app/core/src/provider/vehicle_provider.dart';
import 'package:care_app/ui/components/my_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddMaintenancePage extends StatelessWidget {
  static const String ID = 'addMaintenancePage';

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  DateTime _matDate;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'Mis Mantenimientos',
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child:
                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
            children: <Widget>[

                    DropdownButton<ItemModel>(
                      isExpanded: true,
                      hint: const Text('Seleccione el servicio'),
                      value: vehicleProvider.selectedItem,
                      onChanged: (ItemModel newValue) {
                        vehicleProvider.selectItem(newValue);
                      },
                      items: vehicleProvider.items
                          .map<DropdownMenuItem<ItemModel>>(
                              (ItemModel value) {
                            return DropdownMenuItem<ItemModel>(
                              value: value,
                              child: Text(value.item),
                            );
                          }).toList(),
                    ),
              const SizedBox(height: 15.0),
              TextField(
                    onTap: () async {
                      _matDate = await showRoundedDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year - 10),
                        lastDate: DateTime(DateTime.now().year + 1),
                        borderRadius: 16,
                      );
                      _dateController.text =
                          DateFormat('yyyy-MM-dd').format(_matDate);
                    },
                    focusNode: FirstDisabledFocusNode(),
                    controller: _dateController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      labelText: 'Fecha del mantenimiento',
                      suffixIcon: Icon(Icons.calendar_today),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(203, 99, 51, 1),
                        ),
                      ),
                    ),
              ),
              const SizedBox(height: 15.0),
              MyTextFormField(
                    controller: _costController,
                    capitalization: TextCapitalization.words,
                    textInputType: TextInputType.number,
                    label: 'Costo del mantenimiento',
                    icon: Icons.attach_money,
                    errorMsg: 'Ingresa el costo',
              ),

              const SizedBox(height: 15.0),
              DropdownButton<BusinessModel>(
                    isExpanded: true,
                    hint: const Text('Seleccione local'),
                    value: locator<BusinessProvider>().selectedBusiness,
                    onChanged: (BusinessModel newValue) {
                      locator<BusinessProvider>().selectBusiness(newValue);
                    },
                    items: locator<BusinessProvider>().business
                        .map<DropdownMenuItem<BusinessModel>>(
                            (BusinessModel value) {
                          return DropdownMenuItem<BusinessModel>(
                            value: value,
                            child: Text(value.businessName),
                          );
                        }).toList(),
              ),
              const SizedBox(height: 15.0),
              DropdownButton<ModelModel>(
                isExpanded: true,
                hint: const Text('Seleccione su modelo'),
                value: vehicleProvider.selectedModel,
                onChanged: (ModelModel newValue) {
                  vehicleProvider.selectModel(newValue);
                },
                items: vehicleProvider.myModels
                    .map<DropdownMenuItem<ModelModel>>(
                        (ModelModel value) {
                      return DropdownMenuItem<ModelModel>(
                        value: value,
                        child: Text(value.model),
                      );
                    }).toList(),
              ),
              const SizedBox(height: 15.0),
              MyTextFormField(
                    controller: _addressController,
                    capitalization: TextCapitalization.words,
                    textInputType: TextInputType.number,
                    label: 'Dirección del Local',
                    icon: Icons.map,
                    errorMsg: 'Ingresa la dirección',
              ),

              const SizedBox(height: 30.0),
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
                              'date': "2020-02-06T15:30:00Z",
                              'price': "200.00",
                              'km': "20000",
                              'item': 3,
                              'vehicle': 2,
                              'local': 2
                            };
                          }
                          //print(vehiclesBrandsModelsList);

//                          if (response.containsKey('error')) {
//                            Scaffold.of(context).showSnackBar(
//                              const SnackBar(
//                                content: Text(
//                                    'Ha surgido un problema. Inténtalo de nuevo.'),
//                              ),
//                            );
//                          } else {
//                            Scaffold.of(context).showSnackBar(
//                              const SnackBar(
//                                content: Text('¡Registro exitoso!'),
//                              ),
//                              //Navigator.pushNamed(context, VehiclePage.ID)
//                            );
//                          }
//                        }
                        },
                        child: const Text(
                          'Registrar Mantenimiento',
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
    ));
  }
}

class FirstDisabledFocusNode extends FocusNode {
  @override
  bool consumeKeyboardToken() {
    return false;
  }
}