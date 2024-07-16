import 'package:bondu/globals/colors.dart';
import 'package:bondu/screens/home.dart';
import 'package:bondu/screens/sign_in.dart';
import 'package:bondu/screens/splash_screen.dart';
import 'package:bondu/services/auth_user_helper.dart';
import 'package:bondu/services/context_utility.dart';
import 'package:bondu/services/firebase_api.dart';
import 'package:bondu/services/uni_services.dart';
import 'package:bondu/stores/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
  //gives context error for now
  await UniServices.init();
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

class MyApp extends StatefulWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  // Future<void> initState() async {
  //   await UniServices.init();
  //   super.initState();
  // }
  // @override
  // void didChangeDependencies() async{
  //   super.didChangeDependencies();
  //   // Initialize UniServices only when it hasn't been initialized yet
  //   // await UniServices.init();
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      title: 'BondU',
      navigatorKey: ContextUtility.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      // home: const SharedPreferenceReader(),
      // home: widget.isLoggedIn ? const SplashScreen() : const SignIn(),
      initialRoute: widget.isLoggedIn? '/':'/signIn',
      routes: {
        '/':(_)=>const SplashScreen(),
        '/signIn': (_) => const SignIn(),
      },
    );
  }
}
