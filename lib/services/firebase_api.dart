import 'dart:convert';
import 'package:bondu/screens/contactsscreen.dart';
import 'package:bondu/services/api.dart';
import 'package:bondu/services/auth_user_helper.dart';
import 'package:bondu/services/context_utility.dart';
import 'package:bondu/services/uni_services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import '../screens/home.dart';
Future<void> handleBackgroundMessage(RemoteMessage message) async{
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}
void handleMessage(RemoteMessage? message ){
  if(message==null) return;
  // Navigator.of(ContextUtility.context!).push(
  //   MaterialPageRoute(builder: (_)=>const Home()),
  // );
}
class FirebaseApi {
  final firebaseMessaging = FirebaseMessaging.instance;
  final androidchannel = const AndroidNotificationChannel(
    'contactId', // id
    'Contact Notifications', // name
    description: 'This channel is used for providing Connection updates to Users',
    // description
    importance: Importance.high,
  );
  final localNotif = FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    await firebaseMessaging.requestPermission();
    final fCMToken = await firebaseMessaging.getToken();
    print("Token: $fCMToken");
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    print("16");
    bool fCMTokenset = await AuthUserHelper.getFCMToken();
    if(!fCMTokenset&&fCMToken!=null){
      ApiService().updatefCMToken(fCMToken);
    }
    initPushNotifications();
    initLocalNotifications();
    print("initlocal called");
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true
    );
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notif = message.notification;
      if (notif == null) return;
      localNotif.show(
          notif.hashCode,
          notif.title,
          notif.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              androidchannel.id,
              androidchannel.name,
              channelDescription: androidchannel.description,
              icon: '@drawable/ic_launcher'
            )
          ),
        payload: jsonEncode(message.toMap())
      );
    });
  }
  Future initLocalNotifications() async{
    // const ios = IOSInitializationSettings();
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const settings = InitializationSettings(android: android);
    await localNotif.initialize(
      settings,
      // onDidReceiveBackgroundNotificationResponse: (payload){
      //   print("hello");
      //   print(payload);
      //   final message = RemoteMessage.fromMap(jsonDecode(payload.toString()));
      //   handleMessage(message);
      //   handleBackgroundMessage(message);
      // }
      //   onDidReceiveNotificationResponse: (payload){
      //     print("===");
      //     print(payload.runtimeType);
      //   final msg = RemoteMessage.fromMap(jsonDecode(payload.toString()));
      //   print(msg);
      //   print("===");
      //   handleBackgroundMessage(msg);
      //   handleMessage(msg);
      //   }
        onDidReceiveNotificationResponse: ( x) async {
          print("Received notification response:");
          // print(payload);
          try {
            final RemoteMessage msg = RemoteMessage.fromMap(jsonDecode(x.payload!));
            print("Parsed RemoteMessage:");
            print(msg);

            // Handle your background message here
            handleBackgroundMessage(msg);
            handleMessage(msg);
          } catch (e) {
            print('Error handling notification response: $e');
          }
        }

    );
    final platform = localNotif.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(androidchannel);
  }
}