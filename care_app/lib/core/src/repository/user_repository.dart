import 'dart:io';

import 'package:care_app/core/src/models/transit_tax_model.dart';
import 'package:care_app/core/src/models/trip_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

import 'package:care_app/core/locator.dart';
import 'package:care_app/core/services/careapp_api/api.dart';
import 'package:care_app/core/src/models/image_model.dart';
import 'package:care_app/core/src/models/user_model.dart';



class UserRepository{

  final API _api = locator<API>();

  User user;
  String _profileImageURL;

  Future<Map<String, dynamic>> addUser(Map<String, dynamic> user) async {
    return await _api.postUser(user: user);
  }


  Future<bool> isSignedUp(String userEmail) async {
    return await _api.getUser(email: userEmail) != null;
  }

  Future<Map<String, dynamic>> postAccident(Map<String, dynamic> data) async {
    return await _api.postAccident(data: data);
}

  Future<String> uploadProfilePic(String userEmail, File image) async {
    final StorageReference storageReference = FirebaseStorage.instance.ref().child('images/$userEmail/profile-pictures/${path.basename(image.path)}}');
    final StorageUploadTask uploadTask = storageReference.putFile(image);
    final StorageTaskSnapshot downloadUrl = await uploadTask.onComplete;
    final String url = await downloadUrl.ref.getDownloadURL();
    _profileImageURL = url;
    return url;
  }

  Future<String> uploadAccidentPic(String userEmail, File image) async {
    final StorageReference storageReference = FirebaseStorage.instance.ref().child('images/$userEmail/accident-pictures/${path.basename(image.path)}}');
    final StorageUploadTask uploadTask = storageReference.putFile(image);
    final StorageTaskSnapshot downloadUrl = await uploadTask.onComplete;
    final String url = await downloadUrl.ref.getDownloadURL();
    return url;
  }

  Future<bool> passwordReset(Map<String, dynamic> data) async {
    final Map<String, dynamic> response = await _api.postPasswordReset(data: data);
    return !response.containsKey('error');
  }

  Future<ProfileImageModel> getProfilePicURL(int id) async {
    final ProfileImageModel response =  await _api.getProfilePicURL(id: id);
    if(response != null){
      if(response.user == 0){
        _profileImageURL = 'images/user_avatar.png';
        return response;
      }
      print('EN USER REPO: GETPROFILEPICURL: '+response.file);
      _profileImageURL = response.file;
    }
    return response;
  }

  Future<bool> commentsAndSuggestions(Map<String, dynamic> data) async {
    final Map<String, dynamic> response = await _api.postComments(data: data);
    return !response.containsKey('error');
  }

  Future<bool> addImage(Map<String, dynamic> image) async {
    final Map<String, dynamic> response = await _api.postProfilePic(image: image);
    return !response.containsKey('error');
  }

  Future<List<TransitTaxModel>> fetchTaxes(int userID) async {
    return await _api.getTransitTax(userID: userID);
  }

  Future<List<TripModel>> fetchTrips(int userID) async {
    List<TripModel> response = await _api.getTrips(userID: userID);
    print('EN USER REPO');
    print(response);
    return response;
  }

  Future<Map<String, dynamic>> postTaxes(Map<String, dynamic> data) async {
    return await _api.postTransitTax(tax: data);
  }


  String get profileImageURL => _profileImageURL;

}