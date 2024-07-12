import 'dart:developer';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:magicconnect/modals/contact_model.dart';
import 'package:magicconnect/services/api.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewContact extends StatefulWidget {
  const ViewContact({super.key, required this.contact});

  final ContactModel contact;

  @override
  State<ViewContact> createState() => _ViewContactState();
}

class _ViewContactState extends State<ViewContact> {
  bool userExists = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkContactExists();
    });
    super.initState();
  }

  Future<void> checkContactExists() async {
    if (widget.contact.phone == null) return;
    userExists = await ApiService().getContactExists(widget.contact.phone!);
    log("Contact Exists $userExists");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 24,
            ),
            Container(
              height: 90,
              width: 90,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF8E42EF),
                    Color(0xFFB378FF),
                  ],
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: FittedBox(
                  child: AutoSizeText(
                    "DD",
                    style: TextStyle(color: Colors.white),
                    // maxFontSize: 20,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.contact.name ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 4),
            SizedBox(
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AutoSizeText(
                    widget.contact.companyName ?? "",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AutoSizeText(
                  "Email",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 20),
                if (widget.contact.email != null)
                  Expanded(
                    child: AutoSizeText(
                      widget.contact.email ?? "",
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4F4F4F),
                      ),
                      maxLines: 1,
                    ),
                  )
                else
                  const Expanded(
                    child: AutoSizeText(
                      "No Email",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4F4F4F),
                      ),
                      maxLines: 1,
                    ),
                  )
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AutoSizeText(
                  "Phone no.",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 20),
                if (widget.contact.phone != null)
                  Expanded(
                    child: AutoSizeText(
                      "+91${widget.contact.phone}",
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4F4F4F),
                      ),
                      maxLines: 1,
                    ),
                  )
                else
                  const Expanded(
                    child: AutoSizeText(
                      "No Phone Number ",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4F4F4F),
                      ),
                      maxLines: 1,
                    ),
                  )
              ],
            ),
            const SizedBox(height: 36),
            GestureDetector(
              onTap: () async {
                final contactVCard = Contact.fromVCard('BEGIN:VCARD\n'
                    'VERSION:3.0\n'
                    'N:;${widget.contact.name};;;\n'
                    'TEL;TYPE=HOME:${widget.contact.phone.toString()}\n'
                    'END:VCARD');
                String vCard = contactVCard.toVCard();
                final directory = await getApplicationDocumentsDirectory();
                final path = '${directory.path}/contact.vcf';
                final File file = File(path);
                await file.writeAsString(vCard);
                XFile xFile = XFile(path);
                Share.shareXFiles([xFile], text: 'Contact');
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: Colors.black.withOpacity(0.8), width: 1),
                ),
                child: Text(
                  "SHARE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.8), fontSize: 16),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    if (widget.contact.phone == null) {
                      return;
                    }
                    final phoneNumber = 'tel:${widget.contact.phone}';
                    if (await canLaunch(phoneNumber)) {
                      await launch(phoneNumber);
                    } else {
                      throw 'Could not launch $phoneNumber';
                    }
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/call.png",
                        height: 15,
                        width: 15,
                      ),
                      const SizedBox(width: 6),
                      AutoSizeText(
                        "Call",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.8)),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (widget.contact.email == null) {
                      return;
                    }
                    final Uri emailUri = Uri(
                      scheme: 'mailto',
                      path: '${widget.contact.email}',
                    );

                    if (await canLaunch(emailUri.toString())) {
                      await launch(emailUri.toString());
                    } else {
                      throw 'Could not launch $emailUri';
                    }
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/email.png",
                        height: 15,
                        width: 15,
                      ),
                      const SizedBox(width: 6),
                      AutoSizeText(
                        "Email",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.8)),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    try {
                      final test = await FlutterContacts.requestPermission();
                      if (!test) return;
                      final newContact = Contact()
                        ..name.first = widget.contact.name ?? ""
                        ..name.last = ' '
                        ..phones = [
                          Phone(
                            widget.contact.phone.toString(),
                          ),
                        ];
                      await newContact.insert();
                      ToastContext().init(context);
                      Toast.show("Contact Saved!!",
                          duration: 2, gravity: Toast.bottom);
                    } catch (e) {
                      ToastContext().init(context);
                      Toast.show("Some Error Occured",
                          duration: 2, gravity: Toast.bottom);
                    }
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/save_contact.png",
                        height: 15,
                        width: 15,
                      ),
                      const SizedBox(width: 6),
                      AutoSizeText(
                        "Save Contact",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.8)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            if (!userExists) ...[
              const Divider(
                color: Color(0xFFCBCBCB),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/warning.png",
                          height: 12,
                          width: 12,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: AutoSizeText(
                            "${widget.contact.name} isn't on BondU",
                            overflow: TextOverflow.ellipsis,
                            minFontSize: 1,
                            maxFontSize: 20,
                            maxLines: 1,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {
                        Share.share('Join me on BondU');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/invite.png",
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Expanded(
                            child: AutoSizeText(
                              "Invite",
                              overflow: TextOverflow.ellipsis,
                              minFontSize: 1,
                              maxFontSize: 20,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xFF8635EE),
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ]
          ],
        ),
      ),
    );
  }
}
