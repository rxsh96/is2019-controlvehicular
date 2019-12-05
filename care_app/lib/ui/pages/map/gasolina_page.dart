
import 'package:care_app/core/src/models/gasolineraModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
//import 'package:location/location.dart';
// import 'package:geolocator/geolocator.dart';

class GasolinaPage extends StatefulWidget {
  GasolinaPage({Key key}) : super(key: key);

  _GasolinaPageState createState() => _GasolinaPageState();
}

class _GasolinaPageState extends State<GasolinaPage> {


  final MapController map = MapController();
  
  List<String> mapas = ['streets', 'dark', 'light', 'outdoors', 'satellite'];
  int indexMap = 0;
  String typeMap = 'streets';
  
  final gasolinera = Gasolinera(
    nombre: "Primax",
    latitud: "-2.167747", 
    longitud: "-79.848035" , 
  );

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          _buttonRedict()
        ],
      ),
      body: _createMap(gasolinera),
      floatingActionButton: _createFloatingButton( context ),

    );
  }


Widget _createFloatingButton( BuildContext context){

  return FloatingActionButton.extended(
    label: Text('Mapas'),
    icon: Icon(Icons.track_changes),
    backgroundColor: Theme.of(context).primaryColor,
    onPressed: (){

        indexMap++;
        print(indexMap);
        if(indexMap > mapas.length-1){
            indexMap = 0;
        }
        setState((){
            typeMap = mapas[indexMap];    
        });

    },
  );

}


  Widget _buttonRedict(){
    return IconButton(
        onPressed: ()  { 

         
          //_actualPos();
          map.move(gasolinera.getLatLng(), 15);
        },
        icon: Icon(Icons.my_location),
    );
  }



// _actualPos() async {
//   Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//   print(position);
// }


  Widget _createMap( Gasolinera gasolinera){

    return FlutterMap(
      mapController: map,
      options: MapOptions(
        center: gasolinera.getLatLng(),
        zoom: 13.0,
      ),

      layers: [
        _mapa(),
        _createMarkets( gasolinera),
        
      ],
    );

  }

  TileLayerOptions _mapa(){
    return TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/v4/'
      '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      additionalOptions: {
        'accessToken':'pk.eyJ1Ijoic3RldmVuMTQ5NCIsImEiOiJjazJhenBjNDgxajcxM2hvamNqd293MDcyIn0.j4qB-a-2L68lTqO5Jns3fA',
        'id':'mapbox.streets'
        // Los tipos de mapas son :
        // mapbox.dark  , light , outdoors , satellite
      }
    );
  }


  MarkerLayerOptions _createMarkets( Gasolinera gasolinera){

    return MarkerLayerOptions(
      markers: <Marker> [
        Marker(
          width: 100.0,
          height: 100.0,
          point: gasolinera.getLatLng(),
          builder: ( BuildContext context) => Container(
            
            child: Column(children: <Widget>[
              Icon(
                Icons.location_on,
                size: 70.0,
                color: Theme.of(context).primaryColor,   
              ),
              Text(
                gasolinera.nombre,
                style: TextStyle(
                  fontSize: 10,
                ),
              )
            ],)
            )    
        )
      ]
    );
  }
}