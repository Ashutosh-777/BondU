import 'package:flutter/material.dart';
import 'package:magicconnect/screens/contact_bottom_sheet.dart';
import '../globals/styles.dart';
import 'package:contacts_service/contacts_service.dart' as cp;

class Contact extends StatelessWidget {
  final String contactName;
  final String designation;
  final String imagePath;
  final int? phone;
  const Contact(
      {Key? key,
      required this.contactName,
      required this.designation,
        required this.phone,
      required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 23, vertical: 8),
      height: 67,
      width: MediaQuery.of(context).size.width - 46,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12))),
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipOval(
                    child: Image.asset(
                  imagePath,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                )),
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contactName,
                        style: Styles.contactName,
                      ),
                      Text(
                        "12 Oct",
                        style: Styles.designation.copyWith(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: (){
                showModalBottomSheet<dynamic>(
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (builder) {
                      return  Wrap(children: [
                        ContactBottomSheet(name: contactName, phone: phone,)
                      ]);
                    });
              },
              child: const Icon(
                Icons.more_vert,
                color: Colors.black,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
