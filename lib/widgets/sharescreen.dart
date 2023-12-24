import 'package:flutter/material.dart';

class SharingScreen extends StatelessWidget {
  const SharingScreen({super.key});
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: deviceWidth(context),
        height: deviceHeight(context) * 0.70,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
          color: Colors.black,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Colors.white,
              ),
              margin: const EdgeInsets.only(top: 8),
              height: 5,
              width: 136,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
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
                      color: const Color(0xff1b1b1b),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "Share",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: deviceWidth(context) * 0.9,
                    decoration: BoxDecoration(
                      color: const Color(0xff1b1b1b),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "Copy Link",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: deviceWidth(context) * 0.9,
                    decoration: BoxDecoration(
                      color: const Color(0xff1b1b1b),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "Download QR Code",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: deviceWidth(context) * 0.9,
                    decoration: BoxDecoration(
                      color: const Color(0xff1b1b1b),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "Share via WhatsApp",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: deviceWidth(context) * 0.9,
                    decoration: BoxDecoration(
                      color: const Color(0xff1b1b1b),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "Share via LinkedIn",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
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