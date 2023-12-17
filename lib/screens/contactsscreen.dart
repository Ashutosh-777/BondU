
import 'package:flutter/material.dart';
import 'package:magicconnect/widgets/contact.dart';
import 'package:magicconnect/widgets/sharescreen.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  int count = 8;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet<dynamic>(
                          isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (builder) {
                              return const Wrap(children: [SharingScreen()]);
                            });
                      },
                      icon: const ImageIcon(
                        AssetImage("assets/sendnew.png"),
                        size: 24,
                        color: Colors.white,
                      )),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const ImageIcon(
                            AssetImage("assets/upload.png"),
                            size: 24,
                            color: Colors.white,
                          )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                        child: IconButton(
                            onPressed: () {},
                            color: Colors.white,
                            icon: const ImageIcon(
                                AssetImage("assets/User_scan_light.png"))),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(deviceWidth(context) * 0.075, 0, 0, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Contacts($count)",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Gilroy-Medium'),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21,vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 45,
                    width: deviceWidth(context)-88,
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                            borderSide:
                            const BorderSide(color: Colors.white, width: 1.0),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32)),
                          labelText: "  Search",
                          fillColor: Color(0xff1b1b1b),
                          filled: true,
                          labelStyle: const TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ),
                  const Image(
                    image: AssetImage("assets/filter_vertical.png"),
                    color: Colors.white,
                    height: 32,
                    width: 32,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: count,
                  itemBuilder:(context,index ){
                    return  const Contact(
                      contactName: 'Shiv Bhusan Singh',
                      designation: 'BondU Founder',
                      imagePath: 'assets/pp.png',);
                  }
              ),
            ),
          ],
        ),
        //   Align(
        //     alignment: Alignment.bottomRight,
        //     child: FloatingActionButton(
        //       backgroundColor: Colors.transparent,
        //       onPressed: (){},
        //       child: Image.asset('assets/add_circle_half_dot.png',color: Colors.white,),
        //     ),
        //   ),
        ],
      ),
    );
  }
}
