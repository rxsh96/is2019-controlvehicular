import 'dart:io';

import 'package:care_app/core/services/careapp_api/api.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;


import '../../locator.dart';

class UserRepository{

  final API _api = locator<API>();

  Future<Map<String, dynamic>> addUser(Map<String, dynamic> user) async {
    return await _api.postUser(user: user);
  }


  Future<String> uploadProfilePic(File image) async {
    final StorageReference storageReference = FirebaseStorage.instance.ref().child('user-pictures/${path.basename(image.path)}}');
    final StorageUploadTask uploadTask = storageReference.putFile(image);
    final StorageTaskSnapshot downloadUrl = await uploadTask.onComplete;
    final String url = await downloadUrl.ref.getDownloadURL();
    return url;
  }

  Future<bool> addImage(Map<String, dynamic> image) async {
    final Map<String, dynamic> response = await _api.postProfilePic(image: image);
    return !response.containsKey('error');
  }

}