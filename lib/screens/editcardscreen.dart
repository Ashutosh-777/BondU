import 'package:flutter/material.dart';
import 'package:magicconnect/globals/colors.dart';
import 'package:magicconnect/modals/user_model.dart';
import 'package:magicconnect/widgets/business_card.dart';

class EditCardScreen extends StatelessWidget {
  final UserInfo user;
  const EditCardScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 8),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  size: 30,
                )),
          ),
          Container(
            height: 4,
            color: Colors.purple.withAlpha(75),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            width: MediaQuery.of(context).size.width,
            child: const Text(
              "Edit your Card",
              style: TextStyle(fontSize: 24),
            ),
          ),
          BusinessCard(user: user),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/pp.png',
                      scale: 7,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: const Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: "First Name",
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(hintText: "Last Name"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: "Designation",
                          ),
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: const TextField(
                          decoration: InputDecoration(hintText: "Company"),
                        ))
                  ],
                ),
                const TextField(
                  decoration: InputDecoration(hintText: "Email"),
                ),
                const TextField(
                  decoration: InputDecoration(hintText: "Phone no."),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              "BondU \n",
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 20),
            ),
          ),
        ]),
      ),
    );
  }
}
