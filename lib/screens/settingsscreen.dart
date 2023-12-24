import 'package:flutter/material.dart';
import 'package:magicconnect/screens/moresettingsscreen.dart';
import 'package:magicconnect/widgets/sharescreen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  dynamic name = "Shiv Bhushan";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                showModalBottomSheet<dynamic>(
                    isDismissible: true,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (builder) {
                      return const Wrap(children: [SharingScreen()]);
                    });
              },
              icon: const ImageIcon(AssetImage("assets/sendnew.png"))),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const ImageIcon(AssetImage("assets/gift.png"))),
          ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: deviceWidth(context) * 0.9,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xff1b1b1b),
              borderRadius: BorderRadius.circular(6),
            ),
            //color: Color(0xff1b1b1b),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: [
                  Image.asset(
                    "assets/whitedot.png",
                    color: Colors.white,
                    width: 25,
                    height: 25,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "$name",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: deviceWidth(context) * 0.9,
            decoration: BoxDecoration(
              color: const Color(0xff1b1b1b),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Activate Device",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Container(
            width: deviceWidth(context) * 0.9,
            decoration: BoxDecoration(
              color: const Color(0xff1b1b1b),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "User Guide",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Container(
            width: deviceWidth(context) * 0.9,
            decoration: BoxDecoration(
              color: const Color(0xff1b1b1b),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Get a device",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Container(
            width: deviceWidth(context) * 0.9,
            decoration: BoxDecoration(
              color: const Color(0xff1b1b1b),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Current Main Card",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          const Divider(
            color: Colors.white,
            height: 0,
            thickness: 1,
          ),
          Container(
            width: deviceWidth(context) * 0.9,
            decoration: BoxDecoration(
              color: const Color(0xff1b1b1b),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "About",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Container(
            width: deviceWidth(context) * 0.9,
            decoration: BoxDecoration(
              color: const Color(0xff1b1b1b),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Privacy Policy",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Container(
            width: deviceWidth(context) * 0.9,
            decoration: BoxDecoration(
              color: const Color(0xff1b1b1b),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Help and Support",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          const Divider(
            color: Colors.white,
            height: 0,
            thickness: 1,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MoreSettingsScreen()));
            },
            child: Container(
              width: deviceWidth(context) * 0.9,
              decoration: BoxDecoration(
                color: const Color(0xff1b1b1b),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Settings",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: deviceWidth(context) * 0.9,
            decoration: BoxDecoration(
              color: const Color(0xff1b1b1b),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Dark Mode",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
