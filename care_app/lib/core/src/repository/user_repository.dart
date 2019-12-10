import 'dart:io';

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


  Future<String> uploadProfilePic(File image) async {
    final StorageReference storageReference = FirebaseStorage.instance.ref().child('user-pictures/${path.basename(image.path)}}');
    final StorageUploadTask uploadTask = storageReference.putFile(image);
    final StorageTaskSnapshot downloadUrl = await uploadTask.onComplete;
    final String url = await downloadUrl.ref.getDownloadURL();
    _profileImageURL = url;
    return url;
  }

  Future<bool> passwordReset(Map<String, dynamic> data) async {
    final Map<String, dynamic> response = await _api.postPasswordReset(data: data);
    return !response.containsKey('error');
  }

  Future<ProfileImageModel> getProfilePicURL(int owner) async {
    final ProfileImageModel response =  await _api.getProfilePicURL(owner: owner);
    if(response != null){
      _profileImageURL = response.file;
    }
    return response;
  }


  Future<bool> addImage(Map<String, dynamic> image) async {
    final Map<String, dynamic> response = await _api.postProfilePic(image: image);
    return !response.containsKey('error');
  }

  String get profileImageURL => _profileImageURL;

}