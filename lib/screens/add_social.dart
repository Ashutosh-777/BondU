import 'package:flutter/material.dart';
import 'package:magicconnect/screens/add_link.dart';

import '../globals/colors.dart';

class AddSocial extends StatefulWidget {
  const AddSocial({super.key});

  @override
  State<AddSocial> createState() => _AddSocialState();
}

class _AddSocialState extends State<AddSocial> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
        leading: GestureDetector(
          onTap: Navigator.of(context).pop,
          child: const Icon(
            Icons.close,
            size: 24,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: Icon(
              Icons.check,
              size: 24,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Add Link's",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    color: const Color.fromRGBO(217, 217, 217, 1)),
                margin: const EdgeInsets.only(top: 10),
                height: 38,
                width: deviceWidth * .768,
                padding: const EdgeInsets.only(left: 16,top: 16),
                child: const TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: "Search link's",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                      border: InputBorder.none),
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            const Text(
              "Recommended",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            const CustomSocialTile(name: 'LinkedIn'),
            const CustomSocialTile(name: 'Whatsapp'),
            const CustomSocialTile(name: 'Behance'),
            const CustomSocialTile(name: 'Twitter'),
            SizedBox(
              height: 24,
            ),
            const Text(
              "Other link's",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            const CustomSocialTile(name: 'LinkedIn'),
            const CustomSocialTile(name: 'Whatsapp'),
            const CustomSocialTile(name: 'Behance'),
            const CustomSocialTile(name: 'Twitter'),
          ],
        ),
      ),
    );
  }
}

class CustomSocialTile extends StatelessWidget {
  final String name;
  const CustomSocialTile({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=> AddLink(name: name,)),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 12),
        height: 56,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              offset: Offset(4,4),
              blurRadius: 4,
              spreadRadius: 0
            ),
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                offset: Offset(-4,-4),
                blurRadius: 4,
                spreadRadius: 0
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/$name.png',height: 24,width: 24,),
                const SizedBox(width: 8,),
                Text(name,
                  style: const TextStyle(
                    fontSize: 14
                  ),
                ),
              ],
            ),
            Image.asset('assets/Button.png',height: 40,),
          ],
        ),
      ),
    );
  }
}
