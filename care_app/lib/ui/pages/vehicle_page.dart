import 'package:care_app/ui/pages/map/gasoline_map_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

import 'package:care_app/core/locator.dart';
import 'package:care_app/core/src/models/vehicle_model.dart';
import 'package:care_app/core/src/provider/login_provider.dart';
import 'package:care_app/core/src/provider/vehicle_provider.dart';
import 'package:care_app/ui/components/my_card_button.dart';
import 'package:care_app/ui/components/my_icon_component.dart';
import 'package:care_app/ui/components/my_menu.dart';
import 'package:care_app/ui/pages/add_vehicle_page.dart';
import 'package:care_app/ui/pages/gasoline_page.dart';
import 'package:care_app/ui/pages/map/gasoline_page.dart';

import 'base_page.dart';
import 'filter_page.dart';

class VehiclePage extends StatelessWidget {
  static const String ID = 'vehiclePage';

  @override
  Widget build(BuildContext context) {
    return BasePage<VehicleProvider>(
      onModelReady: (VehicleProvider vehicleProvider){
        //vehicleProvider.fetchVehicleModels();
        //vehicleProvider.fetchVehicleBrands();
        vehicleProvider.fetchVehicleBrandsModels();
        locator<LoginProvider>().getProfilePic();
      },
      builder: (BuildContext context, VehicleProvider vehicleProvider, Widget child) =>
          SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: const Text(
                  'MIS VEHÍCULOS',
                  style: TextStyle(fontSize: 16),
                ),
                actions: <Widget>[
                  MyIconButton(
                    icon: Icons.add,
                    color: const Color.fromRGBO(203, 99, 51, 1),
                    route: AddVehiclePage.ID,
                    argument: Provider.of<LoginProvider>(context).userRepository.user,
                  ),
                  MyIconButton(
                    icon: Icons.note_add,
                    color: const Color.fromRGBO(203, 99, 51, 1),
                  ),
                  MyIconButton(
                    icon: Icons.event_note,
                    color: const Color.fromRGBO(203, 99, 51, 1),
                  ),
                ],
              ),
              body: ListView(
                children: <Widget>[
                  Container(
                    height: 200.0,
                    child: FutureBuilder<List<Vehicle>>(
                        future: locator<VehicleProvider>().fetchUserVehicles(
                            Provider.of<LoginProvider>(context).userRepository.user),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Vehicle>> snapshot) {
                          if (snapshot.connectionState == ConnectionState.done) {
                            if (snapshot.data.isEmpty) {
                              return const Center(
                                child: Text(
                                    '¡No tienes vehículos registrados!'),
                              );
                            }
                            return Swiper(
                              itemBuilder: (BuildContext context, int index) {
                                //vehicleProvider.selectVehicle(snapshot.data[index]);
                                if(snapshot.data[index].imageURL != null){
                                  return FadeInImage.assetNetwork(
                                    image: snapshot.data[index].imageURL,
                                    placeholder: 'images/auto-2.gif',
                                    fit: BoxFit.fill,
                                  );
                                }
                                return const Center(
                                  child: Text(
                                      'Hubo un problema descargando la imagen'),
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
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color.fromRGBO(203, 99, 51, 1),
                                ),
                              ),
                            );
                          }
                        }),
                  ),
                  const Divider(color: Colors.white, height: 0),
                  MyCardButton(
                    text: 'FILTROS',
                    transparency: 1,
                    icon: 'filtro',
                    route: FilterPage.ID,
                  ),
                  const Divider(color: Colors.white, height: 0.0),
                  const MyCardButton(
                    text: 'FRENOS',
                    transparency: 1,
                    icon: 'frenos',
                    route: 'brakePage',
                  ),
                  const Divider(color: Colors.white, height: 0.0),
                  const MyCardButton(
                    text: 'LUCES',
                    transparency: 1,
                    icon: 'luces',
                    route: 'lightPage',
                  ),
                  const Divider(color: Colors.white, height: 0.0),
                  const MyCardButton(
                    text: 'MULTAS',
                    transparency: 1,
                    icon: 'multas',
                    route: 'transitTaxPage',
                  ),
                  const Divider(color: Colors.white, height: 0.0),
                  const MyCardButton(
                    text: 'KMS',
                    transparency: 1,
                    icon: 'kilometraje',
                    route: 'kmPage',
                  ),
                  const Divider(color: Colors.white, height: 0.0),
                  const MyCardButton(
                    text: 'GASOLINA',
                    transparency: 1,
                    icon: 'gasolina',
                    route: GasolinePage.ID,
                  ),
                  const MyCardButton(
                    text: 'GASOLINERAS',
                    transparency: 1,
                    icon: 'gasolina',
<<<<<<< HEAD
                    route: GasolineMapPage.ID,
=======
                    route: GasolinaPage.ID,
>>>>>>> 520f8165bcfa5f107580e060f785626eedecab86
                  ),
                ],
              ),
              drawer: MyMenu(),
            ),
          ),
    );
  }
}


































