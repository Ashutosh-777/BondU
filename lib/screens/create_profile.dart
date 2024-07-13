import 'package:flutter/material.dart';
import 'package:magicconnect/screens/create_profile_2.dart';
import 'package:magicconnect/screens/sign_in.dart';
import 'package:magicconnect/widgets/primary_button.dart';
import 'package:magicconnect/widgets/profilepage_textfield.dart';
import '../globals/colors.dart';
import '../services/auth_user_helper.dart';

class CreateProfile1 extends StatefulWidget {
  const CreateProfile1({super.key});
  @override
  State<CreateProfile1> createState() => _CreateProfile1State();
}

class _CreateProfile1State extends State<CreateProfile1> {
  TextEditingController nameController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LinearProgressIndicator(
                    value: 0.5,
                  ),
                  const SizedBox(height: 44,),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: Navigator.of(context).pop,
                        child: const Icon(
                          Icons.arrow_back,
                          size: 24,
                        ),
                      ),
                      const Expanded( child: SizedBox()),
                      const Text(
                        "BondU",
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 24
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 32),
                    child: Center(
                      child: Text('Create New Profile',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  const Text("What's Your name?",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16
                    ),
                  ),
                  const Text(
                    'Say Hi! to Hassle free Networking',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(100, 100, 100, 1)
                    ),
                  ),
                  const SizedBox(height: 16,),
                  FormTextFieldContainer(hintText: 'Name', title: 'Full Name', textEditingController: nameController),
                  const SizedBox(height: 16,),
                  FormTextFieldContainer(hintText: 'Email', title: 'Email', textEditingController: emailController),
                  const SizedBox(height: 24,),
                  GestureDetector(
                    onTap: (){
                      if(formKey.currentState!.validate()){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=> CreateProfile2(name: nameController.text, email: emailController.text,))
                        );
                      }
          
                    },
                    child: PrimaryButton(
                      buttonName: 'Next', width: MediaQuery.of(context).size.width,
                      fontSize: 16.0,
                      bold: true,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

