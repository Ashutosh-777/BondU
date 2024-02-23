import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../globals/styles.dart';
import '../stores/auth.dart';

class VisitingCard extends StatefulWidget {
  final String userName;
  final String designation;
  const VisitingCard(
      {Key? key, required this.userName, required this.designation})
      : super(key: key);

  @override
  State<VisitingCard> createState() => _VisitingCardState();
}

class _VisitingCardState extends State<VisitingCard> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final height = deviceHeight / 3.33626373;
    return Container(
      margin: const EdgeInsets.only(top: 32, left: 32, right: 32),
      child: Stack(
          //alignment: Alignment.center,
          children: [
            Column(
              children: [
                Container(
                  width: deviceWidth * .72,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(175, 255, 255, 255),
                          blurRadius: 4,
                          offset: Offset(0, 5),
                        ),
                        BoxShadow(
                          color: Color.fromARGB(175, 255, 255, 255),
                          blurRadius: 4,
                          offset: Offset(0, 0),
                        ),
                      ]),
                  height: height * .3,
                ),
                Container(
                  width: deviceWidth * .72,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18)),
                      color: Color(0xff1b1b1b),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(175, 255, 255, 255),
                          blurRadius: 4,
                          offset: Offset(0, 5),
                        ),
                        BoxShadow(
                          color: Color.fromARGB(175, 255, 255, 255),
                          blurRadius: 4,
                          offset: Offset(0, 0),
                        )
                      ]),
                  height: height * .7,
                ),
              ],
            ),
             VisitingCardName(
              userName: context.read<Auth>().user.name!,
              designation: context.read<Auth>().user.designation!,
            ),
          ]),
    );
  }
}

class VisitingCardName extends StatefulWidget {
  final String userName;
  final String designation;
  const VisitingCardName(
      {Key? key, required this.userName, required this.designation})
      : super(key: key);
  @override
  State<VisitingCardName> createState() => _VisitingCardNameState();
}

class _VisitingCardNameState extends State<VisitingCardName> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final height = deviceHeight / (3.33626373);
    return Container(
      margin: EdgeInsets.only(top: height * .3 - 29, bottom: 1),
      height: height,
      color: Colors.transparent,
      width: deviceWidth * .72,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/userProfile.png',
            width: 59,
            height: 59,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              widget.userName,
              style: Styles.cardName,
            ),
          ),
          Text(
            widget.designation,
            style: Styles.designation,
          )
        ],
      ),
    );
  }
}
