
import 'package:app_settings/app_settings.dart';
import 'package:e_comm/controllers/banners-controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class NotificationService{
  FirebaseMessaging messaging = FirebaseMessaging.instance;

//for notification requueest
  void requestNotificationPermission()async{
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true
        ,
      sound: true,
    );

    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print('user granted permission');
    }else if(settings.authorizationStatus==
    AuthorizationStatus.provisional){
      print('user provisional granted permission');
    } else{
      Get.snackbar(
        'Notification permission denied',
        "Please allow notifications to receive updates.",
        snackPosition: SnackPosition.BOTTOM,
      );
      Future.delayed(Duration(seconds: 2),(){
        AppSettings.openAppSettings(type: AppSettingsType.notification);
      });
    }
  }
  //get token
Future<String> getDeviceToken()async{
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    String ? token = await messaging.getToken();
    print("token=> $token");
    return token!;
}
}