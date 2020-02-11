import 'package:care_app/core/locator.dart';
import 'package:care_app/core/src/enums/my_enum.dart';
import 'package:care_app/core/src/models/model_model.dart';
import 'package:care_app/core/src/models/my_guide_model.dart';
import 'package:care_app/core/src/provider/vehicle_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MaintenanceGuidePage extends StatelessWidget {

  static const String ID = 'modelSelectionPage';
  List<MyGuideModel> _list = <MyGuideModel>[];

  Widget makeGuideCard(MyGuideModel model) {
    return Card(
      child: Center(
        child: Container(
          decoration:
              const BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          child: makeListTile(model),
        ),
      ),
    );
  }

  Widget makeListTile(MyGuideModel model) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      leading: Container(
        padding: const EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(width: 1.0, color: Colors.orange),
          ),
        ),
        child: Column(
          children: <Widget>[
            const Text('Kms',
              style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 10),
            ),
            Text(
              model.km.toString(),
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      title: Text(
        model.item,
        style: const TextStyle(
          color: Colors.white,
          textBaseline: TextBaseline.alphabetic
        ),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (model.isMaintenance)
            const Text(
              'Se le puede dar mantenimiento',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          if (model.isChange)
            const Text(
              'Se la puede reemplazar',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VehicleProvider>(
      create: (BuildContext context) => locator<VehicleProvider>(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Guía de Mantenimiento',
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
          body: Consumer<VehicleProvider>(
            builder: (BuildContext context, VehicleProvider vehicleProvider,
                    Widget child) =>
                Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    DropdownButton<ModelModel>(
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
                    if (vehicleProvider.state == ViewState.Busy)
                      const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color.fromRGBO(203, 99, 51, 1),
                        ),
                      )
                    else
                      MaterialButton(
                          child: const Text('Consultar mantenimientos'),
                          color: const Color.fromRGBO(203, 99, 51, 1),
                          onPressed: () async {
                            if(vehicleProvider.selectedModel == null){
                              Scaffold.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('¡Selecciona el modelo de tu vehículo!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                              return;
                            }
                            _list = await vehicleProvider.fetchMaintenanceGuide(
                                vehicleProvider.selectedModel.id);
                          }),
                    const Divider(color: Colors.grey, height: 10.0),
                    if (_list != null)
                      Expanded(
                        flex: 2,
                        child: ListView.builder(
                            itemCount: _list.length,
                            itemBuilder: (BuildContext context, int index) {
                              return makeGuideCard(_list[index]);
                            }),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
