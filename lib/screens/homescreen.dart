import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:magicconnect/modals/user_model.dart';
import 'package:magicconnect/services/api.dart';
import 'package:magicconnect/widgets/business_card.dart';
import 'package:provider/provider.dart';
import '../globals/colors.dart';
import '../modals/view_model.dart';
import '../stores/auth.dart';
import '../widgets/custom_clipper.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'add_social.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String connections = "12";
  List<ConnectionData> data = [
    ConnectionData('Feb 5', 4),
    ConnectionData('Feb 6', 10),
    ConnectionData('Feb 7', 3),
    ConnectionData('Feb 8', 18),
    ConnectionData('Feb 9', 15)
  ];
  @override
  Widget build(BuildContext context) {
    UserInfo user = context.read<Auth>().userDetails;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: ClipShadowPath(
                  shadow: BoxShadow(
                    color: const Color(0xFF6C77AC).withOpacity(0.25),
                    blurRadius: 10,
                    // offset: const Offset(0, 10),
                  ),
                  clipper: BottomEllipticalClipper(),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        end: Alignment(1.0, -2.0),
                        begin: Alignment(-1.0, 1.0),
                        stops: [
                          -0.425,
                          -0.3631,
                          -0.3104,
                          -0.1143,
                          0.1195,
                          0.3533,
                          0.5871,
                          0.6701,
                          0.7682,
                          0.8889,
                          0.9341,
                          1.017,
                          1.0172,
                        ],
                        colors: [
                          Color(0xFF9B51E0),
                          Color(0xFF9951E0),
                          Color(0xFF9851E0),
                          Color(0xFF9251E0),
                          Color(0xFF8C51E0),
                          Color(0xFF8551E0),
                          Color(0xFF7F51E0),
                          Color(0xFF7C51E0),
                          Color(0xFF7A51E0),
                          Color(0xFF7651E0),
                          Color(0xFF7651E0),
                          Color(0xFF7651E0),
                          Color(0xFF7651E0),
                        ],
                      ),
                    ),
                    height: height * 0.19,
                    padding: EdgeInsets.only(
                        bottom: height * 0.020, left: 12, right: 12),
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.05, top: 10),
                      child: Column(
                        children: [
                          const Text(
                            "BondU",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 20),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      final user = await ApiService().getUser();
                                      log("user  ${user.toJson()}");
                                    },
                                    child: const Text(
                                      "Hello",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Gilroy-Bold'),
                                    ),
                                  ),
                                  Text(
                                    user.name ?? "",
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'Gilroy-Medium'),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const ImageIcon(
                                        AssetImage(
                                            "assets/User_scan_light.png"),
                                        color: Colors.white,
                                        size: 24,
                                      )),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      "assets/Bell_pin.png",
                                      height: 24,
                                      width: 24,
                                    ),
                                  )
                                  // IconButton(
                                  //     onPressed: () {},
                                  //     icon: const ImageIcon(
                                  //       AssetImage("assets/Bell_pin.png"),
                                  //       color: Colors.white,
                                  //       size: 24,
                                  //     )),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.133,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.064),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  width: width * 0.872,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xFF9B51E0).withOpacity(0.19),
                          blurRadius: 12,
                          offset: const Offset(3, 3)),
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Great! Keep going",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Gilroy-Bold'),
                            ),
                            FutureBuilder(
                              future: ApiService().getViews(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<ViewModel> snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    "${snapshot.data?.views ?? 0} new connections today",
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                        color: Color(0xff555555),
                                        fontSize: 16,
                                        fontFamily: 'Gilroy-Bold'),
                                  );
                                } else {
                                  return const RefreshProgressIndicator();
                                }
                              },
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
            ],
          ),
          Center(
            child: BusinessCard(
              user: user,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 24, top: 17),
            child: Row(
              children: [
                const Text(
                  'Active',
                  style: TextStyle(fontSize: 16, fontFamily: 'Gilroy-Bold'),
                ),
                const SizedBox(
                  width: 4,
                ),
                Row(
                  children: [
                    if (user.socialMediaHandles?['Whatsapp'] != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Image.asset(
                          'assets/Whatsapp.png',
                          height: 16,
                          width: 16,
                        ),
                      ),
                    if (user.socialMediaHandles?['LinkedIn'] != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Image.asset(
                          'assets/LinkedIn.png',
                          height: 16,
                          width: 16,
                        ),
                      ),
                    if (user.socialMediaHandles?['Twitter'] != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Image.asset(
                          'assets/Twitter.png',
                          height: 16,
                          width: 16,
                        ),
                      ),
                    if (user.socialMediaHandles?['Behance'] != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Image.asset(
                          'assets/Behance.png',
                          height: 16,
                          width: 16,
                        ),
                      ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AddSocial()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Image.asset(
                          'assets/addIcon.png',
                          height: 16,
                          width: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              'Analytics',
              style: TextStyle(fontSize: 24, fontFamily: 'Gilroy-Bold'),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24, left: 8, right: 8),
              child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(
                    name: "XAxis",
                    labelStyle: TextStyle(
                        color: const Color(0xFF000000).withOpacity(0.4),
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                  primaryYAxis: NumericAxis(
                    name: "YAxis",
                    labelStyle: TextStyle(
                        color: const Color(0xFF000000).withOpacity(0.4),
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <CartesianSeries<ConnectionData, String>>[
                    LineSeries<ConnectionData, String>(
                      // xAxisName: "abc",
                      // yAxisName: "Connections",
                      color: primaryColor,
                      dataSource: data,
                      xValueMapper: (ConnectionData sales, _) => sales.date,
                      yValueMapper: (ConnectionData sales, _) =>
                          sales.connection,
                      name: 'Sales',

                      // Enable data label
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

class ConnectionData {
  ConnectionData(this.date, this.connection);
  final String date;
  final double connection;
}
