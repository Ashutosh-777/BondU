import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:share_plus/share_plus.dart';
class ContactBottomSheet extends StatefulWidget {
  final String name;
  final int? phone;
  const ContactBottomSheet({super.key, required this.name, required this.phone});

  @override
  State<ContactBottomSheet> createState() => _ContactBottomSheetState();
}

class _ContactBottomSheetState extends State<ContactBottomSheet> {
  List<Contact>? _contacts;
  bool _permissionDenied = false;
  // Import contact from vCard
  Contact contact = Contact.fromVCard('BEGIN:VCARD\n'
  'VERSION:3.0\n'
  'N:;Joe;;;\n'
  'TEL;TYPE=HOME:123456\n'
  'END:VCARD');
  @override
  void initState(){
    super.initState();
    _fetchContacts();
  }
  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts();
      setState(() => _contacts = contacts);
    }
  }
  @override
  Widget build(BuildContext context) {
    Size device(BuildContext context) => MediaQuery.of(context).size;
    return Container(
        width: device(context).width,
        height: device(context).height * 0.27,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
          color: Colors.white,
        ),
    child:  Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.file_present),
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  content: Text(
                      contact.toVCard(withPhoto: false, includeDate: true)),
                ),
              );
            },
          ),
          GestureDetector(
            onTap: () async{
              String vCard = contact.toVCard();
              await Share.share(vCard);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal:24,vertical: 16 ),
              child: Text('Share Contact',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async{
              final newContact = Contact()
                ..name.first = widget.name
                ..name.last = ' '
                ..phones = [Phone(widget.phone.toString())];
              await newContact.insert();
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal:24,vertical: 16 ),
              child: Text('Save Contact',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
              showModalBottomSheet<dynamic>(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (builder) {
                    return const Wrap(children: [
                      DeleteBottomSheet()
                    ]);
                  });
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal:24,vertical: 16 ),
              child: Text('Delete Contact',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(252, 47, 47, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    // child: Text(''),
    );
  }
}
class DeleteBottomSheet extends StatelessWidget {
  const DeleteBottomSheet({super.key});
  Size device(BuildContext context) => MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: device(context).width,
      height: device(context).height * 0.27,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
        color: Colors.white,
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal:16,vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text('Delete Contact',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 16,),
            Text('are you sure you want to delete this contact from your contacts?',
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 0.6),
              ),
            ),
            DeleteButton()
          ],
        ),
      ),
    );
  }
}
class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 18),
        height: deviceSize.height*0.0541,
        width: deviceSize.width,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(252, 47, 47, 1),
          borderRadius: BorderRadius.circular(8)
        ),
        child: const Center(
          child: Text('Delete Contact',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
        ),
      ),
    );
  }
}

