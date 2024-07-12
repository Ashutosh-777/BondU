import 'package:flutter/material.dart';
import 'package:magicconnect/globals/colors.dart';
import 'package:magicconnect/modals/contact_model.dart';
import 'package:magicconnect/services/api.dart';
import 'package:magicconnect/widgets/contact.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  int count = 8;
  List<ContactModel> contacts = [];

  void getContacts() async {
    contacts = await ApiService().getContacts();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "BondU",
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w900,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Contacts",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontFamily: 'Gilroy-Medium'),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                            onPressed: () {},
                            icon: const ImageIcon(
                              AssetImage("assets/upload.png"),
                              size: 24,
                              color: Colors.black,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: IconButton(
                            onPressed: () {},
                            color: Colors.black,
                            icon: const ImageIcon(
                                AssetImage("assets/User_scan_light.png"))),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(50, 122, 122, 122),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  height: 45,
                  child: TextField(
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: "Search",
                        hintStyle: const TextStyle(color: Colors.grey),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Colors.black12, width: 1.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Colors.black12, width: 1.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Colors.black12, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Colors.black12, width: 1.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Colors.black12, width: 1.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Colors.black12, width: 1.0),
                        ),
                        // labelText: "  Search",
                        filled: true,
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Container(
                height: 4,
                color: const Color(0xFFD0D0F2),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      return ContactTile(
                        contact: contacts[index],
                        imagePath: 'assets/pp.png',
                        onDelete: () {
                          getContacts();
                        },
                      );
                    }),
              ),
            ],
          ),
          //   Align(
          //     alignment: Alignment.bottomRight,
          //     child: FloatingActionButton(
          //       backgroundColor: Colors.transparent,
          //       onPressed: (){},
          //       child: Image.asset('assets/add_circle_half_dot.png',color: Colors.black,),
          //     ),
          //   ),
        ],
      ),
    );
  }
}



// Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                         onPressed: () {
//                           showModalBottomSheet<dynamic>(
//                               isScrollControlled: true,
//                               backgroundColor: Colors.transparent,
//                               context: context,
//                               builder: (builder) {
//                                 return const Wrap(children: [SharingScreen()]);
//                               });
//                         },
//                         icon: const ImageIcon(
//                           AssetImage("assets/sendnew.png"),
//                           size: 24,
//                           color: Colors.black,
//                         )),
//                   ],
//                 ),
//               ),