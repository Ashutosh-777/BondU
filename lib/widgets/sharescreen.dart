import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:magicconnect/globals/colors.dart';
import 'package:magicconnect/services/auth_user_helper.dart';
import 'package:magicconnect/services/database_strings.dart';
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
        // height: deviceHeight(context) * 0.6,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
          color: Colors.white,
        ),
        child:
            Stack(fit: StackFit.loose, alignment: Alignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 140),
            child: Image.asset(
              'assets/backdrop.png',
              width: 1.44 * deviceWidth(context),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 13),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: Color(0xFF717171),
                ),
                margin: const EdgeInsets.only(top: 8),
                height: 4,
                width: 132,
              ),
              const SizedBox(height: 55),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width + 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(45),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                color:
                                    const Color(0xFFC58AFC).withOpacity(0.13),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(11)),
                                    child: Center(
                                      child: QrImageView(
                                        data:
                                            'https://www.app.bondu.in/user/${BackendHelper.id}',
                                        version: QrVersions.auto,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
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
                    data: 'https://www.app.bondu.in/user/${BackendHelper.id}',
                    version: QrVersions.auto,
                    size: 175,
                    gapless: false,
                  ),
                ),
              ),
              const SizedBox(height: 46),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await Share.share(
                            'Check out my BondU card \n https://www.app.bondu.in/user/${await AuthUserHelper.getUserID()}');
                      },
                      child: InnerShadow(
                        shadows: [
                          Shadow(
                            color: const Color(0xFF000000).withOpacity(0.25),
                            blurRadius: 2,
                            offset: const Offset(-1, -2),
                          ),
                          Shadow(
                            color: const Color(0xFFFFFFFF).withOpacity(0.25),
                            blurRadius: 2,
                            offset: const Offset(1, 2),
                          )
                        ],
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          decoration: BoxDecoration(
                              color: const Color(0xFF9B51E0),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xFF000000).withOpacity(0.12),
                                  offset: const Offset(3, 3),
                                  blurRadius: 8,
                                )
                              ]),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
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
                                      fontSize: 12, color: Colors.white),
                                ),
                              ],
                            ),
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
                            },
                            child: InnerShadow(
                              shadows: [
                                Shadow(
                                  color:
                                      const Color(0xFF000000).withOpacity(0.25),
                                  blurRadius: 2,
                                  offset: const Offset(-1, -2),
                                ),
                                Shadow(
                                  color:
                                      const Color(0xFFFFFFFF).withOpacity(0.25),
                                  blurRadius: 2,
                                  offset: const Offset(1, 2),
                                )
                              ],
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.copy,
                                        color: Colors.black,
                                        size: 12,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Copy Link",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                    ],
                                  ),
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
                            child: InnerShadow(
                              shadows: [
                                Shadow(
                                  color:
                                      const Color(0xFF000000).withOpacity(0.25),
                                  blurRadius: 2,
                                  offset: const Offset(-1, -2),
                                ),
                                Shadow(
                                  color:
                                      const Color(0xFFFFFFFF).withOpacity(0.25),
                                  blurRadius: 2,
                                  offset: const Offset(1, 2),
                                )
                              ],
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border:
                                      Border.all(color: Colors.black, width: 1),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.download,
                                        color: Colors.black,
                                        size: 12,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Download QR",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "BondU",
                        style: TextStyle(
                            color: Color(0xFF8635EE),
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
