import 'package:flutter/material.dart';

List<Widget> bottomNavIcons() {
  return [
    const NavigationDestination(
      icon: ImageIcon(
        AssetImage('assets/Home.png'),
        color: Colors.black,
      ),
      label: 'Home',
    ),
    const NavigationDestination(
      icon: ImageIcon(
        AssetImage('assets/contact2.png'),
        color: Colors.black,
      ),
      label: 'Connections',
    ),
    const NavigationDestination(
      icon: ImageIcon(
        AssetImage('assets/Analytics.png'),
        color: Colors.black,
      ),
      label: 'Analytics',
    ),
    const NavigationDestination(
      icon: ImageIcon(
        AssetImage('assets/Settings.png'),
        color: Colors.black,
      ),
      label: 'Settings',
    )
  ];
}
