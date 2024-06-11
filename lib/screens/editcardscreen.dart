import 'package:flutter/material.dart';
import 'package:magicconnect/globals/colors.dart';
import 'package:magicconnect/modals/user_model.dart';
import 'package:magicconnect/screens/add_social.dart';
import 'package:magicconnect/screens/addsocialsscreen.dart';
import 'package:magicconnect/screens/preview.dart';
import 'package:magicconnect/services/api.dart';
import 'package:magicconnect/services/auth_user_helper.dart';
import 'package:magicconnect/widgets/business_card.dart';
import 'package:provider/provider.dart';

import '../stores/auth.dart';
import '../widgets/primary_button.dart';

class EditCardScreen extends StatefulWidget {
  final UserInfo user;
  const EditCardScreen({super.key, required this.user, });

  @override
  State<EditCardScreen> createState() => _EditCardScreenState();
}

class _EditCardScreenState extends State<EditCardScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextEditingController nameController = TextEditingController(text: widget.user.name);
    TextEditingController designationController = TextEditingController(text: widget.user.designation);
    TextEditingController emailController = TextEditingController(text: widget.user.email);
    TextEditingController phoneController = TextEditingController(text: widget.user.phone.toString());
    TextEditingController companyController = TextEditingController(text: widget.user.companyName);
    return SingleChildScrollView(
      child: Padding(
        padding:  MediaQuery.of(context).viewInsets,
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
                  GestureDetector(
                    onTap: () async{
                      //if(formKey.currentState!.validate()){
                      print(nameController.text);
                      print(nameController.text.toString());
                        UserInfo user = UserInfo(
                          name: nameController.text,
                          email: emailController.text,
                          phone: int.parse(phoneController.text),
                          designation: designationController.text,
                          companyName: companyController.text
                        );
                        await ApiService().updateUser(user);
                        user = await ApiService().getUser();
                        context.read<Auth>().addDetails(user);
                        Navigator.pop(context);
                      //}
                    },
                    child: const Icon(
                      Icons.check,
                      size: 24,
                    ),
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
                  hintText: 'Name',
                  textEditingController: nameController),
              const SizedBox(
                height: 17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: width * .35,
                      child: CommonTextField(
                          hintText: 'Designation',
                          textEditingController: designationController)),
                  SizedBox(
                      width: width * .35,
                      child: CommonTextField(
                          hintText: 'Company',
                          textEditingController: companyController))
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              CommonTextField(
                  hintText: 'Email',
                  textEditingController: emailController),
              const SizedBox(
                height: 17,
              ),
              CommonTextField(
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
      ),
    );
  }
}

class CommonTextField extends StatefulWidget {
  final String hintText;
  bool intKeyboard = false;
  final TextEditingController textEditingController;
  CommonTextField(
      {super.key,
        required this.hintText,
        required this.textEditingController});

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      controller: widget.textEditingController,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'This field cannot remain empty';
        }
        return null;
      },
    );
  }
}


