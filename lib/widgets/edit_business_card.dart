import 'package:flutter/material.dart';
import 'package:magicconnect/modals/user_model.dart';
import 'package:magicconnect/screens/editcardscreen.dart';
import 'package:magicconnect/services/database_strings.dart';
import 'package:qr_flutter/qr_flutter.dart';

class EditBusinessCard extends StatefulWidget {
  final UserInfo user;
  const EditBusinessCard({super.key, required this.user});

  @override
  State<EditBusinessCard> createState() => _EditBusinessCardState();
}

class _EditBusinessCardState extends State<EditBusinessCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        showModalBottomSheet<dynamic>(
            backgroundColor: Colors.transparent,
            context: context,
            isScrollControlled: true,
            builder: (builder) {
              return EditCardScreen(user: widget.user);
            });
      }),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: const Color(0xFF9B51E0).withOpacity(0.19),
                blurRadius: 12,
                offset: const Offset(3, 3)),
          ],
          borderRadius: BorderRadius.circular(20.0),
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
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF7F0FF),
            borderRadius: BorderRadius.circular(20.0),
          ),

          // height: widget.deviceHeight * .2118226,
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 50),
          child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                Container(
                  height: 72,
                  width: 72,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      boxShadow: const [
                        // BoxShadow(
                        //   offset: Offset(0, 1),
                        //   spreadRadius: 5,
                        //   blurRadius: 3,
                        //   color: Color.fromRGBO(197, 138, 252, 0.13),
                        // )
                      ],
                      color: Colors.white),
                  child: QrImageView(
                    data: 'https://www.app.bondu.in/user/${BackendHelper.id}',
                    version: QrVersions.auto,
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
