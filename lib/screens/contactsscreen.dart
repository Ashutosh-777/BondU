import 'package:flutter/material.dart';
import 'package:magicconnect/globals/colors.dart';
import 'package:magicconnect/widgets/contact.dart';
import 'package:magicconnect/widgets/sharescreen.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "BondU",
          style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 21, vertical: 12),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(50, 122, 122, 122),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  height: 45,
                  child: TextField(
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1.0),
                        ),
                        border: InputBorder.none,
                        labelText: "  Search",
                        filled: true,
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: count,
                    itemBuilder: (context, index) {
                      return const Contact(
                        contactName: 'Shiv Bhusan Singh',
                        designation: 'BondU Founder',
                        imagePath: 'assets/pp.png',
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