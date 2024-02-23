import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../stores/auth.dart';
class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});
  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}
class _AnalyticsScreenState extends State<AnalyticsScreen> {
  dynamic count = 50;
  dynamic streak = 5;
  @override
  Widget build(BuildContext context) {
    var currentUser = context.read<Auth>().user;
    return Scaffold(
      backgroundColor:  Colors.black,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
              onPressed: () {},
              icon: const ImageIcon(AssetImage("assets/arrow_backward.png"))),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const ImageIcon(AssetImage("assets/rotate_left.png"))),
          ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Hey ${currentUser.name}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Your profile was viewed ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "$count",
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "times",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Your networking streak is $streak days",
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
