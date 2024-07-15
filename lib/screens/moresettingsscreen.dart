import 'package:flutter/material.dart';
import 'package:bondu/globals/colors.dart';
import 'package:bondu/screens/sign_in.dart';
import 'package:bondu/services/auth_user_helper.dart';

class MoreSettingsScreen extends StatefulWidget {
  const MoreSettingsScreen({super.key});
  @override
  State<MoreSettingsScreen> createState() => _MoreSettingsScreenState();
}

class _MoreSettingsScreenState extends State<MoreSettingsScreen> {
  void signOut() async {
    await AuthUserHelper.signOut();
    Navigator.of(context).pushAndRemoveUntil<void>(
      MaterialPageRoute<void>(
          builder: (BuildContext context) => const SignIn()),
      ModalRoute.withName('/'),
    );
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: const Text(
            "BondU",
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const ImageIcon(
                AssetImage("assets/arrow_backward.png"),
                color: primaryColor,
              )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              height: 50,
              width: deviceHeight(context),
            ),
            
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              width: deviceWidth(context) * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0xFF000000).withOpacity(0.05),
                      blurRadius: 12,
                      offset: const Offset(3, 4),
                      spreadRadius: 0),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade300))),
                    padding: const EdgeInsets.all(12.0),
                    child: const Text(
                      "Edit Email and Phone",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  GestureDetector(
                    onTap: signOut,
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "Sign Out",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              width: deviceWidth(context) * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0xFF000000).withOpacity(0.05),
                      blurRadius: 12,
                      offset: const Offset(3, 4),
                      spreadRadius: 0),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade300))),
                    padding: const EdgeInsets.all(12.0),
                    child: const Text(
                      "Deactivate Account",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "Delete Account",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: deviceHeight(context) * 0.45,
            ),
          ],
        ),
      ),
    );
  }
}
