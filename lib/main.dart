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
import 'package:bondu/services/auth_user_helper.dart';
import 'package:bondu/services/context_utility.dart';
import 'package:bondu/services/firebase_api.dart';
import 'package:bondu/services/uni_services.dart';
import 'package:bondu/stores/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
bool temp =false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
  //gives context error for now
  // await UniServices.init();
  usePathUrlStrategy();
  final isLoggedIn = await AuthUserHelper.getLoginStatus();
  temp=isLoggedIn;
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
  void initState(){
    super.initState();
    // UniServices.init();
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
      // home: const SharedPreferenceReader(),
      // home: widget.isLoggedIn ? const SplashScreen() : const SignIn(),
      // initialRoute: widget.isLoggedIn? '/':'/signIn',
      // routes: {
      //   '/':(_)=>const SplashScreen(),
      //   '/signIn': (_) => const SignIn(),
      // },
      routerConfig:_router,

    );
  }
}
final _router = GoRouter(
  initialLocation: temp?'/splash':'/signin',
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
        if(!temp){
          return const SignIn();
        }
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
