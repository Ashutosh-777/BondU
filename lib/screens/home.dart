import 'package:flutter/material.dart';
import 'package:magicconnect/screens/analyticsscreen.dart';
import 'package:magicconnect/screens/contactsscreen.dart';
import 'package:magicconnect/screens/homescreen.dart';
import 'package:magicconnect/screens/settingsscreen.dart';
import 'package:magicconnect/widgets/navigation_icons.dart';
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
        child:  PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              this.index = index;
            });
          },
          children: tabs,
        ),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data:  const NavigationBarThemeData(
          backgroundColor: Colors.black,
          indicatorColor: Color(0xff1b1b1b),
        ),
        child: NavigationBar(
          height: 56,
          destinations: bottomNavIcons(),
          backgroundColor: Colors.black,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() {
            this.index =index;
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
