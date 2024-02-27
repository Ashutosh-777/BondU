import 'package:flutter/material.dart';
import 'package:magicconnect/globals/colors.dart';

class MoreSettingsScreen extends StatefulWidget {
  const MoreSettingsScreen({super.key});
  @override
  State<MoreSettingsScreen> createState() => _MoreSettingsScreenState();
}

class _MoreSettingsScreenState extends State<MoreSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;
    return Scaffold(
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
            height: 4,
            color: Colors.purple.withAlpha(75),
          ),
          Container(
            margin: const EdgeInsets.all(12.0),
            width: deviceWidth(context) * 0.9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Edit Email and Phone",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Sign Out",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(12.0),
            width: deviceWidth(context) * 0.9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Deactivate Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Delete Account",
                    textAlign: TextAlign.center,
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
    );
  }
}
