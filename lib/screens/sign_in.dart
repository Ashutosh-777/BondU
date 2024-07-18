import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:bondu/screens/splash_screen.dart';
import 'package:bondu/services/auth_user_helper.dart';
import 'package:bondu/services/database_strings.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import 'package:otpless_flutter/otpless_flutter.dart';
import 'package:provider/provider.dart';
import '../globals/colors.dart';
import '../modals/user_model.dart';
import '../services/api.dart';
import '../stores/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String accessToken = 'Unknown';

  int tempPhone = 0;
  final _otplessFlutterPlugin = Otpless();
  late String? sessionToken;
  late String? userID;
  var arg = {
    'appId': "51CF91N5R7AF9P34L2DP",
  };
  @override
  void initState() {
    super.initState();
    openLoginPage();
  }

  Future<void> loadSessionToken() async {
    sessionToken = await AuthUserHelper.getSessionToken();
    userID = await AuthUserHelper.getUserID();
    log(sessionToken.toString());
    if (sessionToken != null && userID != null) {
      BackendHelper.id = userID ?? "";
      BackendHelper.sessionToken = sessionToken ?? "";
      UserInfo user = await ApiService().getUser();
      if (!mounted) return;
      var currentUser = context.read<Auth>();
      currentUser.addDetails(user);
      // if(user.name!.isEmpty ){
      //   Navigator.of(context).push(
      //     MaterialPageRoute(builder: (context)=> CreateProfile1()),
      //   );
      // }else {
      //   Navigator.of(context)
      //       .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
      // }
    }
  }

  Future<void> openLoginPage() async {
    try {
      _otplessFlutterPlugin.openLoginPage((result) {
        if (result['data'] != null) {
          final token = result['data']['token'];
          setState(() async {
            accessToken = token;
          });
          return;
        }
      }, arg);
    } catch (e) {
      log("Error caught $e ");
      return;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text('Login to BondU'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  accessToken == "Unknown"
                      ? GestureDetector(
                          onTap: () async {
                            await openLoginPage();
                            // await _otplessFlutterPlugin.signInCompleted();
                            // await ApiService().verifyUser(accessToken);
                            // loadSessionToken();
                            // if (BackendHelper.id != "id") {
                            //   UserInfo user = await ApiService().getUser();
                            //   currentUser.addDetails(user);
                            //   currentUser.addPhone(tempPhone);
                            //   await AuthUserHelper.setPhone(tempPhone.toString());
                            //   if(user.name!.isEmpty||user.email!.isEmpty ) {
                            //     Navigator.of(context)
                            //         .pushReplacement(MaterialPageRoute(
                            //         builder: (context) => CreateProfile1()));
                            //   }else{
                            //     Navigator.of(context).pushReplacement(
                            //         MaterialPageRoute(
                            //             builder: (context) => Home()));
                            //   }
                            // } else {
                            //   //if(!mounted) return;
                            //   Navigator.of(context)
                            //       .pushReplacement(MaterialPageRoute(
                            //       builder: (context) => CreateProfile1()));
                            // }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                "Login to continue",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        )
                      : FutureBuilder(
                          future:
                              Future.delayed(const Duration(milliseconds: 100)),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              WidgetsBinding.instance
                                  .addPostFrameCallback((_) async {
                                await ApiService().verifyUser(accessToken);
                                await ApiService().getUser();
                                UserInfo user = await ApiService().getUser();
                                var currentUser = context.read<Auth>();
                                currentUser.addDetails(user);
                                user = context.read<Auth>().userDetails;
                                print("=============================== ${user.name}");
                                if(user.name!=null&&user.name!.isNotEmpty){
                                  print("=============================== ${user.name}");
                                  context.go('/signedIn');
                                }else{
                                  context.go('/createProfile1');
                                }
                                // Navigator.of(context).pushReplacement(
                                //   MaterialPageRoute(
                                //     builder: (context) => const SplashScreen(),
                                //   ),
                                // );
                              });
                            }

                            return const SizedBox();
                          },
                        )
                  // GestureDetector(
                  //     child: Container(
                  //       width: MediaQuery.of(context).size.width * 0.9,
                  //       decoration: BoxDecoration(
                  //         color: const Color(0xff1b1b1b),
                  //         borderRadius: BorderRadius.circular(6),
                  //       ),
                  //       child: const Padding(
                  //         padding: EdgeInsets.all(12.0),
                  //         child: Text(
                  //           "Enter",
                  //           style:
                  //           TextStyle(color: Colors.white, fontSize: 20),
                  //         ),
                  //       ),
                  //     ),
                  //     onTap: () async {
                  //       log("Starting Authentication");
                  //       log(accessToken);
                  //       Map<String, dynamic> verify =
                  //       await ApiService().verifyUser(accessToken);
                  //      // _otplessFlutterPlugin.signInCompleted();
                  //
                  //       if (BackendHelper.id != "id") {
                  //         UserInfo user = await ApiService().getUser();
                  //         currentUser.addDetails(user);
                  //         currentUser.addPhone(tempPhone);
                  //         await AuthUserHelper.setPhone(tempPhone.toString());
                  //         Navigator.of(context).pushReplacement(
                  //             MaterialPageRoute(
                  //                 builder: (context) => Home()));
                  //       } else {
                  //         //if(!mounted) return;
                  //         Navigator.of(context)
                  //             .pushReplacement(MaterialPageRoute(
                  //             builder: (context) => UserInput(
                  //               user: currentUser.userDetails,
                  //             )));
                  //       }
                  //     }
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
