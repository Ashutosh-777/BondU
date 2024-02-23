import 'package:flutter/material.dart';
import 'package:magicconnect/modals/user_model.dart';
import 'package:magicconnect/services/api.dart';
import 'package:magicconnect/services/database_strings.dart';
import 'package:magicconnect/widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../globals/colors.dart';
import '../stores/auth.dart';
import 'home.dart';
class UserInput extends StatefulWidget {
  final UserInfo user;
  const UserInput({super.key, required this.user});

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var currentUser = context.read<Auth>();
    final TextEditingController _name = TextEditingController();
    final TextEditingController _designation = TextEditingController();
    final TextEditingController _bio = TextEditingController();
    final TextEditingController _phone = TextEditingController();
    final TextEditingController _email = TextEditingController();
    final TextEditingController _companyName = TextEditingController();
    return  Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Center(child: Text('BondU',style: TextStyle(fontSize: 24,color: Colors.white),)),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Center(child: Text("Enter Details",style: TextStyle(fontSize: 24,color: Colors.white),)),
              ),
              SizedBox(height: 48,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "Enter Your Name: ",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
                width: deviceWidth,
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(
                      color: Colors.white
                    ),
                    controller: _name,
                    decoration:  const InputDecoration(
                      fillColor: Colors.red,
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "Enter Your Phone: ",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
                width: deviceWidth,
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(
                        color: Colors.white
                    ),
                    controller: _phone,
                    decoration:  const InputDecoration(
                        fillColor: Colors.red,
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "Enter Your Email: ",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
                width: deviceWidth,
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(
                        color: Colors.white
                    ),
                    controller: _email,
                    decoration:  const InputDecoration(
                        fillColor: Colors.red,
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "Enter Your Company Name: ",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
                width: deviceWidth,
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(
                        color: Colors.white
                    ),
                    controller: _companyName,
                    decoration:  const InputDecoration(
                        fillColor: Colors.red,
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "Enter Your Designation: ",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
                width: deviceWidth,
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(
                        color: Colors.white
                    ),
                    controller: _designation,
                    decoration:  const InputDecoration(
                        fillColor: Colors.red,
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "Your Bio: ",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
                width: deviceWidth,
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(
                        color: Colors.white
                    ),
                    controller: _bio,
                    decoration:  const InputDecoration(
                        fillColor: Colors.red,
                        border: InputBorder.none
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: deviceWidth*0.6,
                    child: const Center(child: Text('Upload Data',style: TextStyle(fontSize: 24,color: Colors.black),)),
                  ),
                ),
                onTap: () async{
                    String temp =  await ApiService().postUser(UserInfo(
                      name: _name.text,
                      phone:620280029,
                      email: _email.text,
                      companyName: _companyName.text,
                      designation: _designation.text,
                      bio: _bio.text,
                    ));
                    if(temp=="success"){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=> const Home())
                      );
                    }

                },
              ),
            ],
          ),
        ),
      );
  }
}
