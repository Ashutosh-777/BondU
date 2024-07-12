import 'package:flutter/material.dart';
import 'package:magicconnect/modals/contact_model.dart';
import 'package:magicconnect/screens/contact_bottom_sheet.dart';
import 'package:magicconnect/screens/view_contact.dart';
import '../globals/styles.dart';

class ContactTile extends StatelessWidget {
  final String imagePath;
  final ContactModel contact;
  final void Function() onDelete;
  const ContactTile(
      {Key? key,
      required this.imagePath,
      required this.contact,
      required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => ViewContact(
                    contact: contact,
                  )),
        );
      },
      child: Container(
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
                          contact.name ?? "",
                          style: Styles.contactName,
                        ),
                        Text(
                          "12 Oct",
                          style:
                              Styles.designation.copyWith(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () async {
                  final didDelete = await showModalBottomSheet<dynamic>(
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      context: context,
                      builder: (builder) {
                        return ContactBottomSheet(
                          name: contact.name ?? "",
                          phone: contact.phone,
                        );
                      });
                  if (didDelete == true) {
                    onDelete();
                  }
                },
                child: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
