import 'dart:async';
import 'package:care_app/ui/components/sliding_up.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';



class GasolinaPage extends StatefulWidget {
  const GasolinaPage({Key key}) : super(key: key);
    
  static const String ID = 'gasolineMapPage';

  _GasolinaPageState createState() => _GasolinaPageState();
}

class _GasolinaPageState extends State<GasolinaPage> {

  Completer<GoogleMapController> controller1;
  static LatLng _initialPosition;
  final  Set<Marker> _markers = Set();
  // Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  //Map<MarkerId,Marker> _markers = Map();

  static  LatLng _lastMapPosition = _initialPosition;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }


  Future<void> _getUserLocation() async {
    final Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    final List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      print('${placemark[0].name}');
    });
  }


  Future<void> _onMapCreated(GoogleMapController controller) {
    setState(() {
        // controller1.Carcomplete(controller);
    });
  }

  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  Future<void> _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }


  Future<void> _updateMarkerPosition( MarkerId markerId , LatLng p){
    //_markers[markerId] = _markers[markerId].copyWith(positionParam: p);

    //_markers[markerId] = _markers.add(Marker(markerId: markerId));
    print("la nueva posicion es $p");
  }

  Future<void> _onAddMarkerButtonPressed() {

    final id = "${_markers.length}";
    final markerId = MarkerId(id);

    setState(() {
      _markers.add(
          Marker(
              // markerId: MarkerId(_lastMapPosition.toString()),
              markerId: MarkerId(id),
              position: _lastMapPosition,
              draggable: true,

              onDragEnd: ( _lastMapPosition) => _updateMarkerPosition(markerId, _lastMapPosition),
              
              infoWindow: InfoWindow(
                  title: "Gasolinera ",
                  snippet: "${_lastMapPosition.latitude}, ${_lastMapPosition.longitude} ",
                  onTap: (){
                  }
              ),
              onTap: (){
              },

              icon: BitmapDescriptor.defaultMarker));
              setState(() {
                //Aquí se actualiza el estado del marker
               //_markers[markerId]= _markers;
              });
      
    });
  }

  Widget pop(){
    return Positioned(
      left: 20,
      right: 20,
      top: 20,
      child: SafeArea(
          child: Container(
            child: Row(children: <Widget>[
              FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Icon( 
                  Icons.arrow_back_ios,
                  color: Colors.deepOrange,
                  )
              )
            ],),    
        ),
      ),
    );
  }
  Widget mapButton(Function function, Icon icon, Color color) {
    return RawMaterialButton(
      onPressed: function,
      child: icon,
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: color,
      padding: const EdgeInsets.all(7.0),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _initialPosition == null ? Container(child: Center(child:Text('Cargando mapa..', style: TextStyle(fontFamily: 'Avenir-Medium', color: Colors.grey[400]),),),) : Container(
        child: SlidingUpPanel(
          body: Stack(children: <Widget>[
          GoogleMap(
            markers:_markers,
            // markers: Set.of(_markers.values),
            mapType: _currentMapType,
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 18.4746,
            ),
            onMapCreated: _onMapCreated,
            zoomGesturesEnabled: true,
            onCameraMove: _onCameraMove,
            myLocationEnabled: true,
            compassEnabled: true,
            myLocationButtonEnabled: false,
            

          ),
          
          Align(
            alignment: Alignment.topRight,
            child: Container(
                margin: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                child: Column(
                  children: <Widget>[
                    mapButton(_onAddMarkerButtonPressed,
                        Icon(
                            Icons.add_location
                        ), Colors.grey),
                    mapButton(
                        _onMapTypeButtonPressed,
                        Icon(
                          IconData(0xf473,
                              fontFamily: CupertinoIcons.iconFont,
                              fontPackage: CupertinoIcons.iconFontPackage),
                        ),
                        Colors.deepOrange[300]),
                  ],
                )),
          ),
          pop(),
        ]),
        panel: Sliding(),
        )
      ),
    );
  }
}



