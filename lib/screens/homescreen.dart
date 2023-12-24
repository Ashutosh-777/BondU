import 'package:flutter/material.dart';
import 'package:magicconnect/widgets/sharescreen.dart';
import 'package:magicconnect/widgets/visiting_card.dart';
import '../globals/colors.dart';
import '../widgets/views_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String username = "Ashutosh Kumar";
  String connections = "12";
  String designation = "App Developer";
  int mode = 1;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const ImageIcon(AssetImage("assets/User_scan_light.png"))),
          IconButton(
              onPressed: () {},
              icon: const ImageIcon(AssetImage("assets/Bell_pin.png"))),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(bottom: height * 0.020, left: 12, right: 12),
              child: Column(
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
                        username,
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
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(width * 0.05, 16, width * 0.05, 8),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xff1b1b1b),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  width * 0.025,
                                  height * 0.012,
                                  width * 0.025,
                                  height * 0.0025),
                              child: const Text(
                                "Great! Keep going",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.white,
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
            Padding(
              padding: EdgeInsets.fromLTRB(
                  width * 0.075, height * 0.012, width * 0.075, 0),
              // Original padding was (30, 40, 30, 50)
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xff1b1b1b),
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          mode = 1;
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: (mode == 1)
                                  ? const [
                                      BoxShadow(
                                          color: Color.fromARGB(
                                              130, 255, 255, 255),
                                          blurRadius: 4,
                                          offset: Offset(0, 2))
                                    ]
                                  : null,
                              color: (mode == 1) ? color2 : color1,
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                width * 0.12, 10, width * 0.12, 10),
                            child: Text(
                              "Personal",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: (mode == 1) ? color1 : color2),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (() {
                          mode = 0;
                          setState(() {});
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: (mode == 0)
                                  ? const [
                                      BoxShadow(
                                          color: Color.fromARGB(
                                              130, 255, 255, 255),
                                          blurRadius: 4,
                                          offset: Offset(0, 2))
                                    ]
                                  : null,
                              color: (mode == 0) ? color2 : color1,
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                width * 0.12, 10, width * 0.12, 10),
                            child: Text(
                              "Business",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: (mode == 0) ? color1 : color2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Stack(children: [
              VisitingCard(
                userName: username,
                designation: designation,
              ),
              const ViewsCard(
                views: 2560,
              ),
            ]),
            InkWell(
              onTap: () {
                showModalBottomSheet<dynamic>(
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (builder) {
                      return const Wrap(children: [SharingScreen()]);
                    });
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3,
                            offset: Offset(0, 3)),
                        //BoxShadow(color: Colors.blue)
                      ]),
                  child: Padding(
                    padding:
                        EdgeInsets.fromLTRB(width * 0.35, 15, width * 0.35, 15),
                    child: const Text(
                      "Share",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 15, 40, 20),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xff9D9D9D),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding:
                      EdgeInsets.fromLTRB(width * 0.06, 5, width * 0.06, 5),
                  // original padding from top and bottom 10
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Every year, more than 2 million trees are cut to make paper business cards",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
