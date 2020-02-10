import 'package:care_app/core/locator.dart';
import 'package:care_app/core/src/enums/view_state_enum.dart';
import 'package:care_app/core/src/models/model_model.dart';
import 'package:care_app/core/src/provider/vehicle_provider.dart';
import 'package:care_app/ui/components/my_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class KmsPage extends StatelessWidget {

  static const String ID = 'kmsPage';

  final TextEditingController _kmController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void cleanFields(){
    _kmController.text = '';
  }

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
                  'Mi Kilometraje',
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
        body: Center(
          child: ChangeNotifierProvider<VehicleProvider>(
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
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
                            const SizedBox(height: 30.0),
                            MyTextFormField(
                              controller: _kmController,
                              capitalization: TextCapitalization.words,
                              textInputType: TextInputType.number,
                              label: 'Kilometraje',
                              icon: Icons.attach_money,
                              errorMsg: 'Ingresa el nuevo kilometraje',
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
                                  if(vehicleProvider.selectedVehicle == null){
                                    Scaffold.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('¡Selecciona el modelo de tu vehículo!'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                    return;
                                  }

                                  if (_formKey.currentState.validate()) {
                                    final Map<String, dynamic> data = <String, dynamic>{
                                      'km': _kmController.text,
                                    };

                                    final Map<String,
                                        dynamic> response = await vehicleProvider
                                        .updateKm(vehicleProvider.selectedVehicle.id, data);

                                    if (response.containsKey('error')) {
                                      Scaffold.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Ha surgido un problema. Inténtalo de nuevo.'),
                                        ),
                                      );
                                    }
                                    else {
                                      Scaffold.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('¡Kilometraje Actualizado!'),
                                        ),
                                      );
                                      print(response);
                                      cleanFields();
                                    }
                                  }
                                },
                                child: const Text(
                                  'Actualizar Kilometraje',
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
      ),
    );
  }
}
