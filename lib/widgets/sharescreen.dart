import 'package:flutter/material.dart';
import 'package:magicconnect/globals/colors.dart';

class SharingScreen extends StatelessWidget {
  const SharingScreen({super.key});
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: deviceWidth(context),
        height: deviceHeight(context) * 0.55,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Color.fromARGB(255, 113, 113, 113),
              ),
              margin: const EdgeInsets.only(top: 8),
              height: 5,
              width: 136,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "Business",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 2, offset: Offset(0, 3)),
                ],
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white,
              ),
              child: Image.asset(
                'assets/qrcode.png',
                width: 200,
                height: 200,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: deviceWidth(context) * 0.9,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                          Text(
                            "  Share",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 8.0),
                      child: Container(
                        width: deviceWidth(context) * 0.40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black)),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.copy),
                              Text(
                                "Copy Link",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 8.0),
                      child: Container(
                        width: deviceWidth(context) * 0.40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.download),
                              Text(
                                "Download QR",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "BondU",
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 20),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
// class SharingScreen extends StatefulWidget {
//   const SharingScreen({super.key});

//   @override
//   State<SharingScreen> createState() => _SharingScreenState();
// }

// class _SharingScreenState extends State<SharingScreen> {

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [

//         ],
//       ),
//     );
//   }
// }