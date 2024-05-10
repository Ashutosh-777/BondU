import 'package:flutter/material.dart';

import 'create_profile.dart';
import 'create_profile_2.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int index = 0;
  final PageController _pageController = PageController();
  List<Widget> tabs = [
    const CreateProfile1(),
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
              this.index = index;PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    this.index = index;
                  });
                },
                children: tabs,
              );
            });
          },
          children: tabs,
        ),
      ),
    );
  }
}
