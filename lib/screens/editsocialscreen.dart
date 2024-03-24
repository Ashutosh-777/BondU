import 'package:flutter/material.dart';
import 'package:magicconnect/globals/colors.dart';

class EditSocialScreen extends StatelessWidget {
  final String socialName;
  const EditSocialScreen({super.key, required this.socialName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(28.0),
                child: Text(
                  "Your Socials",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.network(
                          "https://cdn-icons-png.flaticon.com/512/4494/4494497.png",
                          height: 100,
                          width: 100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Text(
                          socialName,
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                print("Checking");
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: const Color.fromARGB(255, 224, 224, 224),
                            labelText: " Paste your $socialName profile here",
                            filled: true,
                            labelStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              const Padding(
                padding: EdgeInsets.all(28.0),
                child: Text(
                  "Add others",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(24.0),
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      color: Colors.white,
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(
                              "https://cdn-icons-png.flaticon.com/512/4494/4494497.png",
                              height: 25,
                              width: 25,
                            ),
                            const Text("Whatsapp"),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(primaryColor),
                          ),
                          child: const Text(
                            "ADD",
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
