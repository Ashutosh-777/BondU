// import 'package:flutter/material.dart';
// import 'package:magicconnect/screens/create_profile.dart';
// import 'package:magicconnect/screens/user_input.dart';
// import 'package:magicconnect/services/auth_user_helper.dart';
// import 'package:magicconnect/services/database_strings.dart';
// import 'dart:async';
// import 'package:otpless_flutter/otpless_flutter.dart';
// import 'package:provider/provider.dart';
// import '../globals/colors.dart';
// import '../modals/user_model.dart';
// import '../services/api.dart';
// import '../stores/auth.dart';
// import 'home.dart';
//
// class SignIn extends StatefulWidget {
//   const SignIn({Key? key}) : super(key: key);
//
//   @override
//   State<SignIn> createState() => _SignInState();
// }
//
// class _SignInState extends State<SignIn> {
//   String accessToken = 'Unknown';
//   int tempPhone = 0;
//   final _otplessFlutterPlugin = Otpless();
//   final TextEditingController urlTextContoller = TextEditingController();
//   var extra = {
//     "method": "get",
//     "params": {"cid": "YNVNTQ8OGP5AVUYQ1RKA0GARKVLG77DC"}
//   };
//   late String? sessionToken;
//   late String? userID;
//
//   @override
//   void initState() {
//     super.initState();
//     loadSessionToken();
//     // _otplessFlutterPlugin.hideFabButton();
//   }
//
//   void loadSessionToken() async {
//     sessionToken = await AuthUserHelper.getSessionToken();
//     userID = await AuthUserHelper.getUserID();
//     print(sessionToken);
//     if (sessionToken != null && userID != null) {
//       BackendHelper.id = userID ?? "";
//       BackendHelper.sessionToken = sessionToken ?? "";
//       UserInfo user = await ApiService().getUser();
//       var currentUser = context.read<Auth>();
//       currentUser.addDetails(user);
//       if(user.name!.isEmpty ){
//         Navigator.of(context).push(
//           MaterialPageRoute(builder: (context)=> CreateProfile1()),
//         );
//       }else {
//         Navigator.of(context)
//           .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
//       }
//     }
//   }
//
//   Future<void> openLoginPage() async {
//     _otplessFlutterPlugin.openLoginPage((result) {
//       var message = "";
//       var phone = result['data']['mobile']['number'];
//       tempPhone = int.parse(phone);
//       print(tempPhone.runtimeType);
//       if (result['data'] != null) {
//         final token = result['data']['token'];
//         message = token;
//       }
//       setState(() {
//         accessToken = message;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     urlTextContoller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var currentUser = context.read<Auth>();
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       appBar: AppBar(
//         backgroundColor: Colors.grey,
//         title: const Text('Login to BondU'),
//       ),
//
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:magicconnect/screens/create_profile.dart';
import 'package:magicconnect/screens/user_input.dart';
import 'package:magicconnect/services/auth_user_helper.dart';
import 'package:magicconnect/services/database_strings.dart';
import 'dart:async';
import 'package:otpless_flutter/otpless_flutter.dart';
import 'package:provider/provider.dart';
import '../globals/colors.dart';
import '../modals/user_model.dart';
import '../services/api.dart';
import '../stores/auth.dart';
import 'home.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String accessToken = 'Unknown';
  int tempPhone = 0;
  final _otplessFlutterPlugin = Otpless();
  final TextEditingController urlTextContoller = TextEditingController();
  var extra = {
    "method": "get",
    "params": {"cid": "YNVNTQ8OGP5AVUYQ1RKA0GARKVLG77DC"}
  };
  late String? sessionToken;
  late String? userID;

  @override
  void initState() {
    super.initState();
    loadSessionToken();
    // _otplessFlutterPlugin.hideFabButton();
  }

  void loadSessionToken() async {
    sessionToken = await AuthUserHelper.getSessionToken();
    userID = await AuthUserHelper.getUserID();
    print(sessionToken);
    if (sessionToken != null && userID != null) {
      BackendHelper.id = userID ?? "";
      BackendHelper.sessionToken = sessionToken ?? "";
      UserInfo user = await ApiService().getUser();
      var currentUser = context.read<Auth>();
      currentUser.addDetails(user);
      if(user.name!.isEmpty ){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=> CreateProfile1()),
        );
      }else {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
      }
    }
  }

  Future<void> openLoginPage() async {
    _otplessFlutterPlugin.openLoginPage((result) {
      var message = "";
      var phone = result['data']['mobile']['number'];
      tempPhone = int.parse(phone);
      print(tempPhone.runtimeType);
      if (result['data'] != null) {
        final token = result['data']['token'];
        message = token;
      }
      setState(() {
        accessToken = message;
      });
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    urlTextContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var currentUser = context.read<Auth>();
    return Scaffold(
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
                  onTap: () async{
                    openLoginPage();
                    await _otplessFlutterPlugin.signInCompleted();
                    await ApiService().verifyUser(accessToken);
                    loadSessionToken();
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
                      color: primaryColor ,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "Login to continue",
                        style:
                        TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                )
                    :
                GestureDetector(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: const Color(0xff1b1b1b),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "Enter",
                          style:
                          TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    onTap: () async {
                      print("Starting Authentication");
                      print(accessToken);
                      Map<String, dynamic> verify =
                      await ApiService().verifyUser(accessToken);
                      _otplessFlutterPlugin.signInCompleted();

                      if (BackendHelper.id != "id") {
                        UserInfo user = await ApiService().getUser();
                        currentUser.addDetails(user);
                        currentUser.addPhone(tempPhone);
                        await AuthUserHelper.setPhone(tempPhone.toString());
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => Home()));
                      } else {
                        //if(!mounted) return;
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(
                            builder: (context) => UserInput(
                              user: currentUser.userDetails,
                            )));
                      }
                    }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
