import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magicconnect/screens/contactsscreen.dart';
class ContactBottomSheet extends StatelessWidget {
  final String name;
  final int? phone;
  const ContactBottomSheet({super.key, required this.name, required this.phone});


  @override
  Widget build(BuildContext context) {
    Item x = Item(
      label: 'Mobile Number',
      value: phone.toString()
    );
    Contact newContact = Contact(
      displayName: name,
      phones: [x]
    );
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal:24,vertical: 16 ),
            child: Text('Share Contact',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          GestureDetector(
            onTap: () async{
              await ContactsService.addContact(newContact);
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

