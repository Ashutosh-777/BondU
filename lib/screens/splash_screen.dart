import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:magicconnect/globals/colors.dart';
import 'package:magicconnect/screens/create_profile.dart';
import 'package:magicconnect/screens/home.dart';
import 'package:provider/provider.dart';

import '../modals/user_model.dart';
import '../services/api.dart';
import '../services/auth_user_helper.dart';
import '../services/database_strings.dart';
import '../stores/auth.dart';

class SplashScreen extends StatefulWidget {
  final bool loadUserData;
  const SplashScreen({
    Key? key,
    required this.loadUserData,
  }) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late String? sessionToken;
  late String? userID;
  // String accessToken = 'Unknown';
  // int tempPhone = 0;
  // var arg = {
  //   'appId': "51CF91N5R7AF9P34L2DP",
  // };
  // final _otplessFlutterPlugin = Otpless();
  // Future<void> openLoginPage() async {
  //   _otplessFlutterPlugin.openLoginPage((result) {
  //     var message = "";
  //     if (result['data'] != null) {
  //       final token = result['data']['token'];
  //       message = "token: $token";
  //       accessToken=token;
  //     } else {
  //       message = result['errorMessage'];
  //     }
  //   }, jsonObject: arg);
  // }
  Future<void> loadSessionToken() async {
    sessionToken = await AuthUserHelper.getSessionToken();
    userID = await AuthUserHelper.getUserID();
    if (sessionToken != null && userID != null) {
      BackendHelper.id = userID ?? "";
      BackendHelper.sessionToken = sessionToken ?? "";

      if (widget.loadUserData) {
        UserInfo user = await ApiService().getUser();
        await AuthUserHelper.setUserData(jsonEncode(user.toJson()));
      }
      UserInfo user = await AuthUserHelper.getUserData();
      // if(!mounted) return;
      // if(user.name!.isEmpty){
      //   print("khikhih______SDSDSD_____________");
      //   Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder:(context)=>const CreateProfile1()),
      //   );
      // }
      var currentUser = context.read<Auth>();
      currentUser.addDetails(user);
    } else {
      print("Error");
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 2)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              final loginState = await AuthUserHelper.getLoginStatus();
              print(loginState);
              // if(!loginState){
              //   try{
              //     print("need to open login page_____________________________");
              //      _otplessFlutterPlugin.openLoginPage((result) {
              //       var message = "";
              //       if (result['data'] != null) {
              //         final token = result['data']['token'];
              //         message = "token: $token";
              //         setState(() {
              //           accessToken=token;
              //         });
              //       } else {
              //         message = result['errorMessage'];
              //       }
              //     } , arg);
              //   }catch(e){
              //     print("Error caught $e ______________________");
              //     return;
              //   }
              //   await ApiService().verifyUser(accessToken);
              //   while(accessToken=='Unknown'){
              //     print("need to login ");
              //   }
              //   await ApiService().getUser();
              // }
              await loadSessionToken();
              print("Now moving to HomePage");
              if (!mounted) return;
              UserInfo user = context.read<Auth>().userDetails;
              if (user.name!.isEmpty) {
                print("hello ${user.name}");
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const CreateProfile1()));
              } else {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              }
            });
          }
          return Center(
            child: Opacity(
              opacity: _animation.value,
              child: const Text(
                'BONDU',
                style: TextStyle(
                  fontSize: 56.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          );
          // }else{
          //
          // }
        },
      ),
    );
  }
}
