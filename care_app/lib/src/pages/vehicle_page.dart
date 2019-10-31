import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:care_app/src/components/my_icon_button.dart';
import 'package:care_app/src/components/my_menu.dart';
import 'package:care_app/services/backend/api.dart';
import 'package:care_app/src/components/my_card_button.dart';

import 'package:care_app/models/vehicle_model.dart';

class VehiclePage extends StatefulWidget {
  @override
  _VehiclePageState createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage> {
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//}
//
//
//class VehiclePage extends StatelessWidget {
  final API api = API();

  Future<List<Vehicle>> getCars() async {
    final List<Vehicle> myVehicles = await api.fetchVehicles();
    //await Future<dynamic>.delayed(Duration(seconds: 5));
    return myVehicles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MIS VEHÍCULOS',
          style: TextStyle(fontSize: 16),
        ),
        actions: <Widget>[
          MyIconButton(
            icon: Icons.add,
            color: const Color.fromRGBO(203, 99, 51, 1),
            route: 'addVehiclePage',
          ),
          MyIconButton(
            icon: Icons.note_add,
            color: const Color.fromRGBO(203, 99, 51, 1),
          ),
          MyIconButton(
            icon: Icons.event_note,
            color: const Color.fromRGBO(203, 99, 51, 1),
          ),
          //MaterialButton(onPressed: () async {getCars();},)
        ],
      ),
      body: Container(
        child: Center(
          child: ListView(
            children: <Widget>[
              Container(
                height: 200,
                child: FutureBuilder<List<Vehicle>>(
                  future: getCars(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Vehicle>> snapshot) {
                    return snapshot.hasData
                        ? Container(
                            child: snapshot.data.isNotEmpty
                                ? Swiper(
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return FadeInImage.assetNetwork(
                                        image: snapshot.data[index].imageURL,
                                        placeholder: 'images/auto-2.gif',
                                        fit: BoxFit.fill,
                                      ); //
                                    },
                                    itemCount: snapshot.data.length,
                                    pagination: const SwiperPagination(
                                      builder: DotSwiperPaginationBuilder(
                                        color: Colors.white,
                                        activeColor:
                                            Color.fromRGBO(210, 100, 50, 1),
                                      ),
                                    ),
                                    control: const SwiperControl(
                                      color: Color.fromRGBO(210, 100, 50, 1),
                                    ),
                                  )
                                : const Center(
                                    child: Text(
                                        'Actualmente no tienes registrado ningún vehículo'),
                                  ),
                          )
//                        : FadeInImage.assetNetwork(
//                            placeholder: 'images/auto-2.gif', image: '',fit: BoxFit.fill,);
                        : const Center(
                            child: SizedBox(
                              height: 20.0,
                              child: CircularProgressIndicator(),
                            ),
                          );
                  },
                ),
              ),
              //const SizedBox(height: 20.0),
              const Divider(color: Colors.white, height: 0),
              const MyCardButton(
                text: 'FILTROS',
                transparency: 1,
                icon: 'filtro',
                route: 'filterPage',
              ),
              //const SizedBox(height: 8.0),
              //Divider(color: Colors.grey,),
              const Divider(color: Colors.white, height: 0.0),
              const MyCardButton(
                text: 'FRENOS',
                transparency: 1,
                icon: 'frenos',
                route: 'brakePage',
              ),
              //const SizedBox(height: 8.0),
              const Divider(color: Colors.white, height: 0.0),
              const MyCardButton(
                text: 'LUCES',
                transparency: 1,
                icon: 'luces',
                route: 'lightPage',
              ),
              //const SizedBox(height: 8.0),
              const Divider(color: Colors.white, height: 0.0),
              const MyCardButton(
                text: 'MULTAS',
                transparency: 1,
                icon: 'multas',
                route: 'transitTaxPage',
              ),
              //const SizedBox(height: 8.0),
              const Divider(color: Colors.white, height: 0.0),
              const MyCardButton(
                text: 'KMS',
                transparency: 1,
                icon: 'kilometraje',
                route: 'kmPage',
              ),
              //const SizedBox(height: 8.0),
              const Divider(color: Colors.white, height: 0.0),
              const MyCardButton(
                text: 'GASOLINA',
                transparency: 1,
                icon: 'gasolina',
                route: 'gasolinePage',
              ),
              const MyCardButton(
                text: 'MAPA',
                transparency: 1,
                icon: 'gasolina',
                route: 'gasolinerasPage',
              ),
            ],
          ),
        ),
      ),
      drawer: MyMenu(),
    );
  }
}

/*

class VehiclePage extends StatefulWidget {
  const VehiclePage() : super();

  @override
  _VehiclePageState createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage> {
  final API api = API();

  Future<List<Vehicle>> getCars() async {
    return await api.fetchVehicles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MIS VEHÍCULOS', style: TextStyle(fontSize: 16)),
        actions: <Widget>[
          MyIconButton(
            icon: Icons.add,
            color: const Color.fromRGBO(203, 99, 51, 1),
            route: '/addVehiclePage',
          ),
          MyIconButton(
            icon: Icons.note_add,
            color: const Color.fromRGBO(203, 99, 51, 1),
          ),
          MyIconButton(
            icon: Icons.event_note,
            color: const Color.fromRGBO(203, 99, 51, 1),
          ),
          //MaterialButton(onPressed: () async {getCars();},)
        ],
      ),
      body: Container(
        child: Center(
          child: ListView(
            children: <Widget>[
              Container(
                height: 200,
                width: 50,
                child: FutureBuilder<List<Vehicle>>(
                  future: getCars(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return snapshot.hasData
                        ? Container(
                            child: Swiper(
                              itemBuilder: (BuildContext context, int index) {
                                return Image.network(
                                  snapshot.data[index].imageURL,
                                  fit: BoxFit.fill,
                                );
                              },
                              itemCount: snapshot.data.length,
                              pagination: const SwiperPagination(
                                builder: DotSwiperPaginationBuilder(
                                  color: Colors.white,
                                  activeColor: Color.fromRGBO(210, 100, 50, 1),
                                ),
                              ),
                              control: const SwiperControl(
                                color: Color.fromRGBO(210, 100, 50, 1),
                              ),
                            ),
                          )
                        : Center(child: const CircularProgressIndicator());
                  },
                ),
              ),
              //const SizedBox(height: 20.0),
              const Divider(color: Colors.white, height: 0),
              const MyCardButton(
                text: 'FILTROS',
                transparency: 1,
                icon: 'filtro',
                route: 'filterPage',
              ),
              //const SizedBox(height: 8.0),
              //Divider(color: Colors.grey,),
              const Divider(color: Colors.white, height: 0.0),
              const MyCardButton(
                text: 'FRENOS',
                transparency: 1,
                icon: 'frenos',
                route: 'brakePage',
              ),
              //const SizedBox(height: 8.0),
              const Divider(color: Colors.white, height: 0.0),
              const MyCardButton(
                text: 'LUCES',
                transparency: 1,
                icon: 'luces',
                route: 'lightPage',
              ),
              //const SizedBox(height: 8.0),
              const Divider(color: Colors.white, height: 0.0),
              const MyCardButton(
                text: 'MULTAS',
                transparency: 1,
                icon: 'multas',
                route: 'transitTaxPage',
              ),
              //const SizedBox(height: 8.0),
              const Divider(color: Colors.white, height: 0.0),
              const MyCardButton(
                text: 'KMS',
                transparency: 1,
                icon: 'kilometraje',
                route: 'kmPage',
              ),
              //const SizedBox(height: 8.0),
              const Divider(color: Colors.white, height: 0.0),
              const MyCardButton(
                text: 'GASOLINA',
                transparency: 1,
                icon: 'gasolina',
                route: 'gasolinePage',
              ),
            ],
          ),
        ),
      ),
      drawer: MyMenu(),
    );
  }
 }
*/
