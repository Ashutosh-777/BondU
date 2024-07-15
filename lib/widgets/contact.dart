import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bondu/globals/colors.dart';

import 'package:bondu/modals/contact_model.dart';
import 'package:bondu/screens/contact_bottom_sheet.dart';
import 'package:bondu/screens/view_contact.dart';

import '../globals/styles.dart';

class ContactTile extends StatefulWidget {
  final ContactModel contact;
  final void Function() onDelete;
  const ContactTile({
    Key? key,
    required this.contact,
    required this.onDelete,
  }) : super(key: key);

  @override
  State<ContactTile> createState() => _ContactTileState();
}

class _ContactTileState extends State<ContactTile> {
  String initials = "";
  @override
  void initState() {
    try {
      final words = widget.contact.name!.split(" ");
      initials = words.map((e) => e[0].toUpperCase()).join();
    } catch (e) {
      initials = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ViewContact(
              contact: widget.contact,
            ),
          ),
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
                  if (initials.isNotEmpty)
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: primaryColor),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: FittedBox(
                          child: AutoSizeText(
                            initials,
                            style: const TextStyle(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    )
                  else
                    ClipOval(
                      child: Image.asset(
                        'assets/pp.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.contact.name ?? "",
                          style: Styles.contactName,
                        ),
                        if (widget.contact.date != null)
                          Text(
                            DateFormat("d MMM").format(widget.contact.date!),
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
                          name: widget.contact.name ?? "",
                          phone: widget.contact.phone,
                        );
                      });
                  if (didDelete == true) {
                    widget.onDelete();
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
