import 'dart:io';

import 'package:care_app/core/services/careapp_api/api.dart';
import 'package:care_app/core/src/models/device_model.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../locator.dart';

class FirebaseNotifications {
  FirebaseMessaging _firebaseMessaging;

  final API _api = locator<API>();

  void setUpFirebase() {
    _firebaseMessaging = FirebaseMessaging();
    firebaseCloudMessagingListeners();

  }

  Future<void> firebaseCloudMessagingListeners() async {

    String deviceID = '';
    String deviceType = '';

    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      iosPermission();
      final IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      deviceID = iosDeviceInfo.identifierForVendor;
      deviceType = 'ios';
    }

    if(Platform.isAndroid){
      final AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      deviceID = androidDeviceInfo.androidId;
      deviceType = 'android';
    }

    final String token = await _firebaseMessaging.getToken();

    final DeviceModel device = await _api.getFCMDevice(deviceID: deviceID);
    final DeviceModel deviceModel = DeviceModel(name: '', type: deviceType,
        deviceId: deviceID, registrationId: token, active: true);

    if(device == null){
      final Map<String, dynamic> fcmResponse = await _api.postFCMDevice(deviceInformation: deviceModel);
      print('FCM RESPONSE AFTER POST');
      print(fcmResponse);
    }
    else{
      print('DEVICE MODEL INFO, INSIDE ELSE ON FIREBASE NOTIFICATIONS');
      print(device.toString());
      final Map<String, dynamic> fcmResponse = await _api.putFCMDevice(deviceInformation: deviceModel, registrationToken: device.registrationId);
      print('FCM RESPONSE AFTER PUT');
      print(fcmResponse);
    }



    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
      },
    );
  }

  void iosPermission() {
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print('Settings registered: $settings');
    });
  }
}