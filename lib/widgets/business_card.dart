import 'package:flutter/material.dart';
import 'package:magicconnect/globals/colors.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 3, offset: Offset(0, 3)),
            //BoxShadow(color: Colors.blue)
          ],
          border: Border.all(color: primaryColor, width: 4.0),
          borderRadius: BorderRadius.circular(12.0),
          color: const Color.fromARGB(220, 255, 255, 255)),
      width: MediaQuery.of(context).size.width * 0.8,
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(10.0),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jason Reily",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text("CEO"),
                SizedBox(
                  height: 10,
                ),
                Text("8109206619"),
                Text("jason.reily@gmail.com"),
              ],
            ),
            Container(
              height: 100,
              width: 100,
              child: Image.asset(
                'assets/qrcode.png',
              ),
            )
          ]),
    );
  }
}
