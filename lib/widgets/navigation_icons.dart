import 'package:flutter/material.dart';
List<Widget> bottomNavIcons(){
  return [
     const NavigationDestination(
        icon: ImageIcon(AssetImage('assets/Home.png'),color: Colors.white,),
        label: '',
    ),
    const NavigationDestination(
      icon:  ImageIcon(AssetImage('assets/contact2.png'),color: Colors.white,),
      label: '',
    ),
    const NavigationDestination(
      icon:  ImageIcon(AssetImage('assets/Analytics.png'),color: Colors.white,),
      label: '',
    ),
    const NavigationDestination(
      icon:  ImageIcon(AssetImage('assets/Settings.png'),color: Colors.white,),
      label: '',
    )
  ];
}