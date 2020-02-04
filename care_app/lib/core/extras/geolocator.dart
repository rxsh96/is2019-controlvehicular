// import 'dart:async';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';



// class Geolocator {


//   Future<void> getUserLocation( LatLng _initialPosition) async {
//       final Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//       final List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);
//       _initialPosition = LatLng(position.latitude, position.longitude);
//       print('${placemark[0].name}');
//       return _initialPosition;
//   }

// }