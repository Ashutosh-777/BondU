import 'dart:developer';

import 'package:bondu/modals/user_model.dart';
import 'package:bondu/screens/analyticsscreen.dart';
import 'package:bondu/screens/contactsscreen.dart';
import 'package:bondu/screens/homescreen.dart';
import 'package:bondu/screens/settingsscreen.dart';
import 'package:bondu/services/firebase_api.dart';
import 'package:bondu/widgets/sharescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import '../services/api.dart';
import '../services/auth_user_helper.dart';
import '../services/database_strings.dart';
import '../stores/auth.dart';
import '../widgets/nav_bar.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  final PageController _pageController = PageController();
  final tabs = [
    const HomeScreen(),
    const ContactsScreen(),
    const AnalyticsScreen(),
    const SettingsScreen(),
  ];
  late String? sessionToken;
  late String? userID;
  Future<void> loadSessionToken() async {
    sessionToken = await AuthUserHelper.getSessionToken();
    userID = await AuthUserHelper.getUserID();
    if (sessionToken != null && userID != null) {
      BackendHelper.id = userID ?? "";
      BackendHelper.sessionToken = sessionToken ?? "";
      UserInfo user = await ApiService().getUser();
      if (!mounted) return;
      var currentUser = context.read<Auth>();
      print(user);
      print(user.name);
      currentUser.addDetails(user);
      await uploadToken();
    } else {
      print("Error");
      return;
    }
  }
  Future<void> uploadToken() async{
    bool fCMTokensent = await AuthUserHelper.getFCMTokenSent();
    String? id = await AuthUserHelper.getUserID();
    String? fCMToken = await AuthUserHelper.getFCMToken();
    print("=====================================5656565656565656565656565656==== $fCMTokensent $id $fCMToken");
    if(!fCMTokensent&&fCMToken!=null&&id!=null){
      log("=====================================61616161616161616161616116161616161616====");
      ApiService().updatefCMToken(fCMToken);
      Toast.show("updated +++++++++++++++++++++++ $fCMToken");
    }
  }
  @override
  void initState() {
    super.initState();
    loadSessionToken();
  }

  void changeIndex(int index) {
    setState(() {
      this.index = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          // child: SingleChildScrollView(
          //   child: Container(
          //     height: MediaQuery.of(context).size.height * 5,
          //     color: Colors.black,
          //   ),
          // ),
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                this.index = index;
              });
            },
            children: tabs,
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: (() {
            showModalBottomSheet<dynamic>(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (builder) {
                  return const SharingScreen();
                });
          }),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF6D6DC5).withOpacity(0.3),
                    blurRadius: 11,
                    offset: const Offset(0, 20),
                  ),
                  BoxShadow(
                    color: const Color(0xFF9b51e0).withOpacity(0.19),
                    blurRadius: 11,
                    offset: const Offset(0, -5),
                  )
                ]),
            height: 70,
            width: 70,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Image.asset(
                "assets/share_button.png",
                scale: 4.5,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF9b51e0).withOpacity(0.12),
                blurRadius: 10,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: BottomAppBar(
            elevation: 5,
            color: Colors.white,
            shadowColor: Colors.white,
            surfaceTintColor: Colors.white,
            notchMargin: 10.0,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 70,
              color: Colors.white,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NavBarItem(
                      assetImage: 'assets/house.png',
                      title: "Home",
                      index: 0,
                      onTap: changeIndex,
                      isSelected: index == 0,
                    ),
                    NavBarItem(
                        assetImage: 'assets/people.png',
                        title: "Contacts",
                        index: 1,
                        isSelected: index == 1,
                        onTap: changeIndex),
                    const SizedBox(width: 10),
                    NavBarItem(
                        assetImage: 'assets/chart-pie.png',
                        title: "Analytics",
                        index: 2,
                        isSelected: index == 2,
                        onTap: changeIndex),
                    NavBarItem(
                        assetImage: 'assets/dashboard.png',
                        title: "Settings",
                        isSelected: index == 3,
                        index: 3,
                        onTap: changeIndex)
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
