import 'package:flutter/material.dart';
import 'package:magicconnect/globals/colors.dart';
import 'package:magicconnect/modals/user_model.dart';
import 'package:magicconnect/screens/addsocialsscreen.dart';
import 'package:magicconnect/services/api.dart';
import 'package:magicconnect/widgets/business_card.dart';

class EditCardScreen extends StatefulWidget {
  final UserInfo user;

  const EditCardScreen({super.key, required this.user});

  @override
  State<EditCardScreen> createState() => _EditCardScreenState();
}

class _EditCardScreenState extends State<EditCardScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String fName = '', lName = '', designation = '', company = '', email = '';
  int phone = 0;

  void _submitForm() async {
    _formKey.currentState!.save();
    widget.user.name = fName.trim() + " " + lName.trim();

    await ApiService().updateUser(widget.user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
            BusinessCard(user: widget.user),
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
                        child: Column(
                          children: [
                            TextFormField(
                              initialValue: widget.user.name?.split(' ')[0],
                              decoration: const InputDecoration(
                                hintText: "First Name",
                              ),
                              onSaved: (value) {
                                print(value);
                                fName = value ??
                                    widget.user.name?.split(' ')[0] ??
                                    " ";
                              },
                            ),
                            TextFormField(
                              initialValue: widget.user.name?.split(' ')[1],
                              decoration:
                                  const InputDecoration(hintText: "Last Name"),
                              onSaved: (newValue) {
                                print(newValue);
                                lName = newValue ??
                                    widget.user.name?.split(' ')[1] ??
                                    " ";
                              },
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
                          child: TextFormField(
                            onSaved: (newValue) {
                              widget.user.designation =
                                  newValue ?? widget.user.designation ?? " ";
                            },
                            initialValue: widget.user.designation,
                            decoration: const InputDecoration(
                              hintText: "Designation",
                            ),
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextFormField(
                            initialValue: widget.user.companyName,
                            onSaved: (newValue) {
                              widget.user.companyName =
                                  newValue ?? widget.user.companyName ?? " ";
                            },
                            decoration:
                                const InputDecoration(hintText: "Company"),
                          ))
                    ],
                  ),
                  TextFormField(
                    initialValue: widget.user.email,
                    onSaved: (newValue) {
                      widget.user.email = newValue ?? widget.user.email ?? " ";
                    },
                    decoration: const InputDecoration(hintText: "Email"),
                  ),
                  TextFormField(
                    initialValue: widget.user.phone.toString(),
                    onSaved: (newValue) {
                      widget.user.phone =
                          int.parse(newValue ?? widget.user.phone.toString());
                    },
                    decoration: const InputDecoration(hintText: "Phone no."),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(
                            Size(MediaQuery.of(context).size.width * 0.4, 48)),
                        backgroundColor:
                            const MaterialStatePropertyAll(primaryColor)),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const AddSocialsScreen();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      "Add Socials",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(
                            Size(MediaQuery.of(context).size.width * 0.4, 48)),
                        backgroundColor:
                            const MaterialStatePropertyAll(primaryColor)),
                    onPressed: _submitForm,
                    child: const Text(
                      "Submit",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
