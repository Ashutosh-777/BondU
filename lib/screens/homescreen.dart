import 'package:flutter/material.dart';
import 'package:magicconnect/modals/user_model.dart';
import 'package:magicconnect/services/api.dart';
import 'package:magicconnect/widgets/business_card.dart';
import 'package:magicconnect/widgets/sharescreen.dart';
import 'package:magicconnect/widgets/visiting_card.dart';
import 'package:provider/provider.dart';
import '../globals/colors.dart';
import '../stores/auth.dart';
import '../widgets/views_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String connections = "12";
  @override
  Widget build(BuildContext context) {
    UserInfo user = context.read<Auth>().user;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "BondU",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: primaryColor,
            padding:
                EdgeInsets.only(bottom: height * 0.020, left: 12, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.05,
                        top: 10,
                      ),
                      child: const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Hello",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Gilroy-Bold'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.05),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          user.name!,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Gilroy-Medium'),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const ImageIcon(
                          AssetImage("assets/User_scan_light.png"),
                          color: Colors.white,
                          size: 100,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const ImageIcon(
                          AssetImage("assets/Bell_pin.png"),
                          color: Colors.white,
                          size: 100,
                        )),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(width * 0.05, 16, width * 0.05, 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 3, offset: Offset(0, 3)),
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(width * 0.025,
                                height * 0.012, width * 0.025, height * 0.0025),
                            child: const Text(
                              "Great! Keep going",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Gilroy-Bold'),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(width * 0.05,
                                height * 0.0025, 0, height * 0.012),
                            child: Text(
                              "$connections new connections today",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  color: Color(0xff555555),
                                  fontSize: 16,
                                  fontFamily: 'Gilroy-Bold'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8, 8, 20, 8),
                      child: Image(
                        image: AssetImage('assets/rocket.png'),
                        height: 32,
                        width: 32,
                      ),
                    ),
                  ]),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const BusinessCard(),
                const BusinessCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}



            // Stack(children: [
            //   VisitingCard(
            //     userName: user.name!,
            //     designation: user.designation!,
            //   ),
            //   const ViewsCard(
            //     views: 2560,
            //   ),
            // ]),

            // InkWell(
            //   onTap: () {
            //     showModalBottomSheet<dynamic>(
            //         backgroundColor: Colors.transparent,
            //         isScrollControlled: true,
            //         context: context,
            //         builder: (builder) {
            //           return const Wrap(children: [SharingScreen()]);
            //         });
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            //     child: Container(
            //       decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.circular(12),
            //           boxShadow: const [
            //             BoxShadow(
            //                 color: Colors.grey,
            //                 blurRadius: 3,
            //                 offset: Offset(0, 3)),
            //             //BoxShadow(color: Colors.blue)
            //           ]),
            //       child: Padding(
            //         padding:
            //             EdgeInsets.fromLTRB(width * 0.35, 15, width * 0.35, 15),
            //         child: const Text(
            //           "Share",
            //           style: TextStyle(
            //               color: Colors.black,
            //               fontWeight: FontWeight.bold,
            //               fontSize: 24),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),