import 'package:flutter/material.dart';
import 'package:magicconnect/globals/colors.dart';
import 'package:magicconnect/modals/user_model.dart';
import 'package:magicconnect/screens/editcardscreen.dart';
import 'package:magicconnect/services/database_strings.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BusinessCard extends StatefulWidget {
  final UserInfo user;
  final double deviceWidth;
  final double deviceHeight;
  const BusinessCard({super.key, required this.user, required this.deviceWidth, required this.deviceHeight});

  @override
  State<BusinessCard> createState() => _BusinessCardState();
}

class _BusinessCardState extends State<BusinessCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.grey, blurRadius: 3, offset: Offset(0, 3)),
          ],
          border: Border.all(color: primaryColor, width: 4.0),
          borderRadius: BorderRadius.circular(12.0),
          color: const Color.fromARGB(220, 255, 255, 255)),
      width: widget.deviceWidth*0.8,
      height: widget.deviceHeight*.2118226,
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(top: 23),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user.name ?? "UserName",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(widget.user.designation ?? "Designation"),
                const SizedBox(
                  height: 10,
                ),
                Text(widget.user.phone.toString()),
                Text(widget.user.email?.characters.take(20).toString() ?? "EMAIL"),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                boxShadow: const [
                  BoxShadow(
                    offset:Offset(
                      0,1
                    ),
                    spreadRadius: 5,
                    blurRadius: 3,
                    color: Color.fromRGBO(197, 138, 252, 0.13),
                  )
                ],
                color: Colors.white
              ),
              child: QrImageView(
                data: 'https://www.app.bondu.in/user/${BackendHelper.id}',
                version: QrVersions.auto,
                size: 72,
                gapless: false,
              ),
            )
          ]),
    );
  }
}
