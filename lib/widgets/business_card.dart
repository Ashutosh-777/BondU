import 'package:flutter/material.dart';
import 'package:magicconnect/globals/colors.dart';
import 'package:magicconnect/modals/user_model.dart';
import 'package:magicconnect/screens/editcardscreen.dart';

class BusinessCard extends StatelessWidget {
  final UserInfo user;
  const BusinessCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EditCardScreen(
                  user: user,
                )));
      }),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey, blurRadius: 3, offset: Offset(0, 3)),
              //BoxShadow(color: Colors.blue)
            ],
            border: Border.all(color: primaryColor, width: 4.0),
            borderRadius: BorderRadius.circular(12.0),
            color: const Color.fromARGB(220, 255, 255, 255)),
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.5,
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.all(10.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name!,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(user.designation!),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(user.phone.toString()),
                  Text(user.email.toString()),
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
      ),
    );
  }
}
