import 'package:flutter/material.dart';
import 'package:magicconnect/globals/colors.dart';
import 'package:magicconnect/modals/user_model.dart';
import 'package:magicconnect/screens/editcardscreen.dart';
import 'package:magicconnect/services/database_strings.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BusinessCard extends StatefulWidget {
  final UserInfo user;
  final bool isEdit;
  const BusinessCard({
    super.key,
    required this.user,
    this.isEdit = false,
  });

  @override
  State<BusinessCard> createState() => _BusinessCardState();
}

class _BusinessCardState extends State<BusinessCard> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.744,
      child: GestureDetector(
        onTap: (() {
          if (widget.isEdit) return;
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) =>
                    Material(child: EditCardScreen(user: widget.user))),
          );
        }),
        child: Container(
          // padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: const Color(0xFF9B51E0).withOpacity(0.19),
                  blurRadius: 12,
                  offset: const Offset(3, 3)),
            ],
            borderRadius: BorderRadius.circular(19.0),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFB180FF),
                Color(0xFF4B21A4),
              ],
              stops: [0.0275, 1],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF7F0FF),
                borderRadius: BorderRadius.circular(16.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.user.name ?? "UserName",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "${widget.user.designation ?? ""} : ${widget.user.companyName ?? ""}",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (widget.user.phone != null)
                        Text(widget.user.phone.toString(),
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400)),
                      Text(widget.user.email ?? "EMAIL",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
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
                    height: 72,
                    width: 72,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(3, 3),
                            spreadRadius: 0,
                            blurRadius: 11.2,
                            color: const Color(0xFF9B51E0).withOpacity(0.19),
                          )
                        ],
                        color: Colors.white),
                    child: QrImageView(
                      data: 'https://www.app.bondu.in/user/${BackendHelper.id}',
                      version: QrVersions.auto,
                    ),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
