import 'package:bondu/globals/colors.dart';
import 'package:bondu/screens/add_link.dart';
import 'package:bondu/screens/add_social.dart';
import 'package:bondu/screens/create_profile.dart';
import 'package:bondu/screens/create_profile_2.dart';
import 'package:bondu/screens/home.dart';
import 'package:bondu/screens/moresettingsscreen.dart';
import 'package:bondu/screens/preview.dart';
import 'package:bondu/screens/sign_in.dart';
import 'package:bondu/screens/splash_screen.dart';
import 'package:bondu/services/firebase_api.dart';
import 'package:bondu/stores/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
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
      child: const MyApp(),

    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowMaterialGrid: false,
      title: 'BondU',
      // navigatorKey: ContextUtility.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig:_router,

    );
  }
}
final _router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/signin',
      builder: (context, state) => const SignIn(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const Home();
      },
      routes: [
        GoRoute(
          path: 'user/:userId',
          builder: (context, state) =>
              Preview(userid: state.pathParameters['userId']!),
        ),
        GoRoute(
          path: 'addSocial',
          builder: (context, state) =>
              const AddSocial(),
        ),
        GoRoute(
          path: 'addLink',
          builder: (context, state) {
            var extra =  state.extra as Map<String,String>;
            return AddLink(name: extra['name']!, url: extra['url']??'',);
          },
        ),
        GoRoute(
          path: 'moreSettingsScreen',
          builder: (context, state) => const MoreSettingsScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/createProfile1',
      builder: (context, state) => const CreateProfile1(),
    ),
    GoRoute(
      path: '/createProfile2/:name/:email',
      builder: (context, state) =>  CreateProfile2(name: state.pathParameters['name']!, email: state.pathParameters['email']!,),
    ),

  ],
);
