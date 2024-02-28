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
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
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
            scale: 4.5,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10.0,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: 70,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String assetImage;
  final String title;
  final int index;
  final Function onTap;
  final bool isSelected;
  const NavBarItem(
      {super.key,
      required this.assetImage,
      required this.title,
      required this.index,
      required this.onTap,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ImageIcon(
          AssetImage(assetImage),
          color: isSelected ? primaryColor : Colors.black,
        ),
        Text(
          title,
          style: TextStyle(
              color: isSelected ? primaryColor : Colors.black, fontSize: 12),
        )
      ]),
    );
  }
}
