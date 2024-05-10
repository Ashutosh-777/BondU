import 'package:flutter/material.dart';
import 'package:magicconnect/globals/colors.dart';
import 'package:magicconnect/modals/user_model.dart';
import 'package:magicconnect/screens/add_social.dart';
import 'package:magicconnect/screens/addsocialsscreen.dart';
import 'package:magicconnect/screens/preview.dart';
import 'package:magicconnect/services/api.dart';
import 'package:magicconnect/services/auth_user_helper.dart';
import 'package:magicconnect/widgets/business_card.dart';

import '../widgets/primary_button.dart';

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
    widget.user.name = "${fName.trim()} ${lName.trim()}";
    await ApiService().updateUser(widget.user);
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
          color: Colors.white,
        ),
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: const Icon(
                    Icons.close,
                    size: 24,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Icon(
                  Icons.check,
                  size: 24,
                )
              ],
            ),
            BusinessCard(
              user: widget.user,
              deviceWidth: width,
              deviceHeight: height,
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Color.fromRGBO(187, 187, 187, 1),
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            CommonTextField(
                initialVal: widget.user.name,
                hintText: 'Name',
                textEditingController: nameController),
            const SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: width * .35,
                    child: CommonTextField(
                        initialVal: widget.user.designation,
                        hintText: 'Designation',
                        textEditingController: designationController)),
                SizedBox(
                    width: width * .35,
                    child: CommonTextField(
                        initialVal: widget.user.companyName,
                        hintText: 'Company',
                        textEditingController: companyController))
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            CommonTextField(
                initialVal: widget.user.email,
                hintText: 'Email',
                textEditingController: emailController),
            const SizedBox(
              height: 18,
            ),
            CommonTextField(
                initialVal: widget.user.phone.toString(),
                hintText: 'Phone',
                textEditingController: phoneController),
            SizedBox(
              height: height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder:(context)=>AddSocial())
                    );
                  },
                  child: PrimaryButton(
                    width: width,
                    buttonName: 'Add Social', bold: false,
                  ),
                ),
                GestureDetector(
                  onTap: ()async{
                    String? temp = await AuthUserHelper.getUserID();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>Preview(userid: temp ))
                    );
                  },
                  child: PrimaryButton(
                      width: width,
                      buttonName: 'Preview', bold: false
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CommonTextField extends StatefulWidget {
  final initialVal;
  final String hintText;
  final TextEditingController textEditingController;
  const CommonTextField(
      {super.key,
        this.initialVal,
        required this.hintText,
        required this.textEditingController});

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialVal,
      decoration: InputDecoration(
          filled: true,
          fillColor:
          const Color.fromRGBO(0, 0, 0, 0.12), // Grey background color
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.6),
            fontSize: 16,
            fontFamily: 'Gilroy-Medium',
          )),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'This field cannot remain empty';
        }
        return null;
      },
    );
  }
}


