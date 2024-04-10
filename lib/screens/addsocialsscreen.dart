import 'package:flutter/material.dart';
import 'package:magicconnect/globals/colors.dart';
import 'package:magicconnect/widgets/sociallinktile.dart';

class AddSocialsScreen extends StatefulWidget {
  const AddSocialsScreen({super.key});

  @override
  State<AddSocialsScreen> createState() => _AddSocialsScreenState();
}

class _AddSocialsScreenState extends State<AddSocialsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.check,
                color: Colors.black,
              )),
        ],
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
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.all(24.0),
            width: MediaQuery.of(context).size.width,
            child: const Text(
              "Add Links",
              style: TextStyle(fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
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
                          const BorderSide(color: Colors.black12, width: 1.0),
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              "Recommended",
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Column(
            children: [
              SocialLinkTile(
                  text: "LinkedIn",
                  url:
                      "https://cdn-icons-png.flaticon.com/512/4494/4494497.png"),
              SocialLinkTile(
                  text: "LinkedIn",
                  url:
                      "https://cdn-icons-png.flaticon.com/512/4494/4494497.png"),
              SocialLinkTile(
                  text: "LinkedIn",
                  url:
                      "https://cdn-icons-png.flaticon.com/512/4494/4494497.png"),
              SocialLinkTile(
                  text: "LinkedIn",
                  url:
                      "https://cdn-icons-png.flaticon.com/512/4494/4494497.png"),
              SocialLinkTile(
                  text: "LinkedIn",
                  url:
                      "https://cdn-icons-png.flaticon.com/512/4494/4494497.png"),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              "Other Links",
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Column(
            children: [
              SocialLinkTile(
                  text: "LinkedIn",
                  url:
                      "https://cdn-icons-png.flaticon.com/512/4494/4494497.png"),
              SocialLinkTile(
                  text: "LinkedIn",
                  url:
                      "https://cdn-icons-png.flaticon.com/512/4494/4494497.png"),
              SocialLinkTile(
                  text: "LinkedIn",
                  url:
                      "https://cdn-icons-png.flaticon.com/512/4494/4494497.png"),
              SocialLinkTile(
                  text: "LinkedIn",
                  url:
                      "https://cdn-icons-png.flaticon.com/512/4494/4494497.png"),
              SocialLinkTile(
                  text: "LinkedIn",
                  url:
                      "https://cdn-icons-png.flaticon.com/512/4494/4494497.png"),
            ],
          ),
        ]),
      ),
    );
  }
}
