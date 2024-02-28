import 'package:flutter/material.dart';

List<BottomNavigationBarItem> bottomNavIcons() {
  return [
    const BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage('assets/Home.png'),
        color: Colors.black,
      ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage('assets/contact2.png'),
        color: Colors.black,
      ),
      label: 'Connections',
    ),
    const BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage('assets/Analytics.png'),
        color: Colors.black,
      ),
      label: 'Analytics',
    ),
    const BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage('assets/Settings.png'),
        color: Colors.black,
      ),
      label: 'Settings',
    )
  ];
}
