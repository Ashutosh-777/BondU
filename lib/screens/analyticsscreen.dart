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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Check your \n BondU \n Trends",
                  style: TextStyle(fontSize: 30),
                ),
                IconButton(
                    onPressed: () {},
                    icon:
                        const ImageIcon(AssetImage("assets/rotate_left.png"))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Text(
              "Coming Soon",
              style: TextStyle(fontSize: 36, color: Colors.grey.shade700),
            ),
          )
        ],
      ),
    );
  }
}
