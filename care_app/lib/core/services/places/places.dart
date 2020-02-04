import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:meta/meta.dart' show required;


typedef OnSearch( dynamic data);

class Places{

  final String apiHost = 'https://nominatim.openstreetmap.org';
  StreamSubscription _searchSub;
  OnSearch onSearch;

 void search(String query) async {

   try{
     final String url = '$apiHost/search.php?q=${Uri.encodeFull(query)}&polygon_geojson=1&format=json';
     //Si tengo una peticin previa, la cancela
    _searchSub?.cancel();
    // final response = await http.get(url);
    _searchSub= http.get(url).asStream().listen((response){
      print(response.body);
      onSearch(jsonDecode(response.body));
    });
    // print(response.body);


   }catch(e){
     print('Search error: $e');
   }
    
    
  }


  dispose(){
    _searchSub?.cancel();
  }

}


  // https://nominatim.openstreetmap.org/search.php?q=guayaquil%2Cmall+del+sol&polygon_geojson=1&format=json