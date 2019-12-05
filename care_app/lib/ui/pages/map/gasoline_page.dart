import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class GasolinePage extends StatefulWidget {

  const GasolinePage({Key key}) : super(key: key);

  @override
  _GasolinePageState createState() => _GasolinePageState();
}

class _GasolinePageState extends State<GasolinePage> {

  final CameraPosition _position = CameraPosition(
      target: const LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414
  );

  StreamSubscription<Position> _positionStream;

  @override
  void initState() {
    super.initState();
    _startTracking();
  }

  void _startTracking(){
    final Geolocator geoLocator = Geolocator();
    final LocationOptions locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 5);

    _positionStream = geoLocator.getPositionStream(locationOptions).listen(_onLocationUpdate);
  }

  void _onLocationUpdate( Position position){
    if(position!=null){
      print('position ${position.latitude},${position.longitude}');
    }
  }

  @override
  void dispose() {
    if(_positionStream!=null){
      _positionStream.cancel();
      _positionStream=null;
    }
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition: _position,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              onTap: ( LatLng p){
                print('p: ${p.latitude},${p.longitude}');
              },
            ),
          ],
        ),
      ),
    );
  }



}