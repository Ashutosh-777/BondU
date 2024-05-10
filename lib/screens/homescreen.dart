import 'package:flutter/material.dart';
import 'package:magicconnect/modals/user_model.dart';
import 'package:magicconnect/screens/add_link.dart';
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
    ConnectionData('Feb5', 4),
    ConnectionData('Feb6', 10),
    ConnectionData('Feb7', 3),
    ConnectionData('Feb8', 18),
    ConnectionData('Feb9', 15)
  ];
  @override
  Widget build(BuildContext context) {
    UserInfo user = context.read<Auth>().userDetails;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final TextEditingController text1 = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          "BondU",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
              children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: ClipPath(
                clipper: BottomEllipticalClipper(),
                child: Container(
                  height: height * 0.19,
                  color: primaryColor,
                  padding: EdgeInsets.only(
                      bottom: height * 0.020, left: 12, right: 12),
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.05, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Align(
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
                            Align(
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
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const ImageIcon(
                                  AssetImage("assets/User_scan_light.png"),
                                  color: Colors.white,
                                  size: 24,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const ImageIcon(
                                  AssetImage("assets/Bell_pin.png"),
                                  color: Colors.white,
                                  size: 24,
                                )),
                          ],
                        )
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
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3,
                        offset: Offset(0, 3)),
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
                            builder: (BuildContext context, AsyncSnapshot<ViewModel> snapshot) {
                              if(snapshot.hasData){
                                return  Text(
                                  "${snapshot.data?.views??0} new connections today",
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      color: Color(0xff555555),
                                      fontSize: 16,
                                      fontFamily: 'Gilroy-Bold'),
                                );
                              }else{
                                return RefreshProgressIndicator();
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
          ]),
          Center(
            child: BusinessCard(
              user: user,
              deviceWidth: width,
              deviceHeight: height,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 24, top: 17, bottom: 8),
            child: Row(
              children: [
                const Text(
                  'Active',
                  style: TextStyle(fontSize: 16, fontFamily: 'Gilroy-Bold'),
                ),
                const SizedBox(
                  width: 18,
                ),
                Row(
                  children: [
                    user.socialMediaHandles?['Whatsapp']==null?const SizedBox():Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Image.asset(
                        'assets/Whatsapp.png',
                        height: 16,
                        width: 16,
                      ),
                    ),
                    user.socialMediaHandles?['LinkedIn']==null?const SizedBox():Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Image.asset(
                        'assets/LinkedIn.png',
                        height: 16,
                        width: 16,
                      ),
                    ),
                    user.socialMediaHandles?['Twitter']==null?const SizedBox():Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Image.asset(
                        'assets/Twitter.png',
                        height: 16,
                        width: 16,
                      ),
                    ),
                    user.socialMediaHandles?['Behance']==null?const SizedBox():Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Image.asset(
                        'assets/Behance.png',
                        height: 16,
                        width: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder:(context) => const AddSocial())
                        );
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
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              'Analytics',
              style: TextStyle(fontSize: 24, fontFamily: 'Gilroy-Bold'),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24,left: 8,right: 8),
              child: SfCartesianChart(
                  primaryXAxis: const CategoryAxis(),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <CartesianSeries<ConnectionData, String>>[
                    LineSeries<ConnectionData, String>(
                      color: primaryColor,
                      dataSource: data,
                      xValueMapper: (ConnectionData sales, _) => sales.date,
                      yValueMapper: (ConnectionData sales, _) => sales.connection,
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
