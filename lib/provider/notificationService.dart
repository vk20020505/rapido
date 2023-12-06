
import 'dart:developer'as dev;
import 'dart:io';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../screens.dart/profile.dart';
// import 'package:mytrust/profilePage.dart'; 

Future<void> backgroundHandler(RemoteMessage message) async{
  dev.log('message received! ${message.notification!.title}');
}

class NotificationService{

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    Future<void> initialize() async{
      NotificationSettings settings = await FirebaseMessaging.instance.requestPermission();
      if(settings.authorizationStatus == AuthorizationStatus.authorized){
        print('user granted permission');
     
        FirebaseMessaging.onBackgroundMessage(backgroundHandler);
       dev.log('message Intialize');
      } 
    }


      Future<String> getDeviceToken()async{
        String? token = await FirebaseMessaging.instance.getToken();
        return token!;
      }

   // when device token is refreshed;
      void isTokenRefresh() async{
        FirebaseMessaging.instance.onTokenRefresh.listen((event) {
          event.toString();
         dev.log('Token is refreshed');
        });
      }

     void initLocalNotification(context, RemoteMessage message) async{

       var androidInitializationSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');
       var iosInitializationSettings = const DarwinInitializationSettings();

      var initializationSettings = InitializationSettings(
        android:  androidInitializationSettings,
        iOS: iosInitializationSettings

      );

      await _flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (payload) {
          // handleMessage(context, message);
        },
      );

    }

     void firebaseInit(BuildContext context){
       FirebaseMessaging.onMessage.listen((message) {
        dev.log('message title is ${message.notification!.body}');
        dev.log('message title is ${message.notification!.title}');
           dev.log('message data is ${message.data}');
         if(Platform.isAndroid){
            initLocalNotification(context, message);
            showNotification(message);
         }else{
           showNotification(message);
         }
        
   });
    }

    Future<void> setupInteractMessage(BuildContext context) async{

      // when app is terminated
      RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
      print('vinayKumar');
      print(initialMessage);
      if(initialMessage != null){
      handleMessage(context, initialMessage);
      dev.log('App is in terminated condition');
      }

      // when app is in background
      FirebaseMessaging.onMessageOpenedApp.listen((event) {
        handleMessage(context, event);
         dev.log('App is in background condition');
      });
    
    }

    void handleMessage( BuildContext context, RemoteMessage message, ){
      if(message.data['type'] == 'profile'){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return const Profile();
        }));
      }
    }

    Future<void> showNotification(RemoteMessage message)async{

      AndroidNotificationChannel channel = AndroidNotificationChannel(
       Random.secure().nextInt(10000).toString() , 
        'High Importance Notifications',
        importance: Importance.max
        );

        AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
       channel.id.toString(), 
        channel.name.toString(), 
        channelDescription: 'Your channel description',
        importance: Importance.high,
        priority: Priority.high,
        ticker: 'ticker'
        );
        DarwinNotificationDetails iosNotificationDetails = const DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true
        );
        NotificationDetails notificationDetails = NotificationDetails(
          android: androidNotificationDetails,
          iOS: iosNotificationDetails
        );



      Future.delayed(Duration.zero,
      (){
           _flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title.toString(),
         message.notification!.body.toString(),
           notificationDetails);
      }
   
      );
    }


}