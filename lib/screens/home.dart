import 'package:flutter/material.dart';
import 'package:magicconnect/globals/colors.dart';
import 'package:magicconnect/screens/analyticsscreen.dart';
import 'package:magicconnect/screens/contactsscreen.dart';
import 'package:magicconnect/screens/homescreen.dart';
import 'package:magicconnect/screens/settingsscreen.dart';
import 'package:magicconnect/widgets/navigation_icons.dart';
import 'package:magicconnect/widgets/sharescreen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
      floatingActionButton: Container(
        height: 75,
        width: 75,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: (() {
            showModalBottomSheet<dynamic>(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (builder) {
                  return const Wrap(children: [SharingScreen()]);
                });
          }),
          child: Image.asset(
            "assets/share_button.png",
            scale: 4,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(indicatorColor: Colors.transparent),
        child: NavigationBar(
          elevation: 30,
          height: 80,
          destinations: bottomNavIcons(),
          backgroundColor: Colors.white,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() {
            this.index = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }),
        ),
      ),
    );
  }
}
