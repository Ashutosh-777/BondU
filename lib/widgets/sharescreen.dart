import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magicconnect/globals/colors.dart';
import 'package:magicconnect/services/auth_user_helper.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_image_generator/qr_image_generator.dart';
import 'package:share_plus/share_plus.dart';
import 'package:toast/toast.dart';

class SharingScreen extends StatelessWidget {
  const SharingScreen({super.key});
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: deviceWidth(context),
        height: deviceHeight(context) * 0.6,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
          color: Colors.white,
        ),
        child: Stack(alignment: Alignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Image.asset('assets/backdrop.png'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  color: const Color.fromARGB(255, 113, 113, 113),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
                margin: const EdgeInsets.only(top: 8),
                height: 5,
                width: 136,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2,
                        offset: Offset(0, 3)),
                  ],
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
                ),
                child: QrImageView(
                  data:
                      'https://www.app.bondu.in/user/${AuthUserHelper.getUserID()}',
                  version: QrVersions.auto,
                  size: 175,
                  gapless: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await Share.share(
                            'Check out my BondU card \n https://www.app.bondu.in/user/${await AuthUserHelper.getUserID()}');
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFF9B51E0),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.share_outlined,
                                color: Colors.white,
                              ),
                              Text(
                                "  Share",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              await Clipboard.setData(ClipboardData(
                                  text:
                                      "https://www.app.bondu.in/user/${await AuthUserHelper.getUserID()}"));

                              ToastContext().init(context);
                              Toast.show("Link Copied",
                                  duration: 2, gravity: Toast.bottom);
                              // copied successfully
                              // ScaffoldMessenger.of(context)
                              //     .showSnackBar(const SnackBar(

                              //   content: Text("Copied to Clipboard!"),
                              // ));
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              // width: deviceWidth(context) * 0.40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color(0xFF9B51E0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    offset: const Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.copy, color: Colors.white),
                                    Text(
                                      "Copy Link",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              final generator = QRGenerator();
                              final Directory? downloadDir =
                                  await getDownloadsDirectory();
                              final String outputDir = downloadDir!.path;
                              await generator.generate(
                                data:
                                    "https://www.app.bondu.in/user/${AuthUserHelper.getUserID()}",
                                filePath: '$outputDir/yourQR.png',
                              );
                              ToastContext().init(context);
                              Toast.show("QR Code saved in downloads",
                                  duration: 2, gravity: Toast.bottom);
                              await Future.delayed(const Duration(seconds: 2));
                              OpenFilex.open('$outputDir/yourQR.png');
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              // width: deviceWidth(context) * 0.40,
                              decoration: BoxDecoration(
                                color: const Color(0xFF9B51E0),
                                // border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    offset: const Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.download, color: Colors.white),
                                    Text(
                                      "Download QR",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Divider(
                      color: Color(0xFF9B51E0),
                      thickness: 2,
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "BondU",
                        style: TextStyle(
                            color: Color(0xFF9B51E0),
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ]));
  }
}
