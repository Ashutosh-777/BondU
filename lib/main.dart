import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magicconnect/globals/colors.dart';
import 'package:magicconnect/screens/home.dart';
import 'package:magicconnect/screens/profile_screen.dart';
import 'package:magicconnect/screens/sign_in.dart';
import 'package:magicconnect/stores/auth.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const SignIn(),
    );
  }
}
