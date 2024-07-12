import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magicconnect/globals/colors.dart';
import 'package:magicconnect/screens/sign_in.dart';
import 'package:magicconnect/screens/splash_screen.dart';
import 'package:magicconnect/services/auth_user_helper.dart';
import 'package:magicconnect/stores/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isLoggedIn = await AuthUserHelper.getLoginStatus();
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
      child: MyApp(
        isLoggedIn: isLoggedIn,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: isLoggedIn
          ? const SplashScreen(
              loadUserData: false,
            )
          : const SignIn(),
    );
  }
}
