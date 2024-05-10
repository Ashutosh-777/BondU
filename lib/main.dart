import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magicconnect/globals/colors.dart';
import 'package:magicconnect/screens/home.dart';
import 'package:magicconnect/screens/sign_in.dart';
import 'package:magicconnect/services/auth_user_helper.dart';
import 'package:magicconnect/stores/auth.dart';
import 'package:provider/provider.dart';

void main() async{
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: primaryColor,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  final loginState = await AuthUserHelper.getLoginStatus();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
      ],
      child: MyApp(loginState: loginState,),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool loginState;
  MyApp({super.key, required this.loginState});
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
      home: loginState? const Home() :const SignIn(),
    );
  }
}
