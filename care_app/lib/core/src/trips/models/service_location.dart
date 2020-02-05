import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class ServiceLocation {
  
  ServiceLocation(this.position, this.address);
  
  final LatLng position;
  final String address;


}
