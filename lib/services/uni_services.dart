// import 'package:bondu/main.dart';
// import 'package:bondu/screens/contactsscreen.dart';
// import 'package:bondu/services/context_utility.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:go_router/go_router.dart';
// import 'package:logger/logger.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// import 'package:uni_links/uni_links.dart';
//
// import '../screens/preview.dart';
// import 'auth_user_helper.dart';
// final logger = Logger();
//
// class UniServices{
//   static String _userId = '';
//   static String get userId => userId;
//   static bool get hasUserid => _userId.isNotEmpty;
//
//   static void reset() => _userId='';
//
//   static init() async {
//     try{
//       final Uri? uri = await getInitialUri();
//       uniHandler(uri);
//       uriLinkStream.listen((Uri? uri) {
//         uniHandler(uri);
//         logger.d(uri.toString());
//       },onError: (e){
//         print("Error recieved line 23--- $e");
//       });
//     } on PlatformException{
//       logger.d("[fail34");
//
//       print("Failed to receive userid");
//     } on FormatException{
//       logger.d("[fail36");
//       print("Wring Format code received");
//     }
//   }
//   static uniHandler(Uri? uri){
//     if(uri==null) return;
//     // Extract the ID from the URL
//     String receivedUserId = uri.pathSegments.last;
//     ContextUtility.context?.push('/user/$receivedUserId');
//     print("________________________________________________________________________________________");
//   }
// }
