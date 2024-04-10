import 'package:flutter/material.dart';
import 'package:magicconnect/widgets/profilepage_textfield.dart';

import '../globals/colors.dart';
import '../widgets/primary_button.dart';
import 'home.dart';
class CreateProfile2 extends StatefulWidget {
  const CreateProfile2({super.key});

  @override
  State<CreateProfile2> createState() => _CreateProfile2State();
}

class _CreateProfile2State extends State<CreateProfile2> {
  TextEditingController companyController= TextEditingController();
  TextEditingController designationController= TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LinearProgressIndicator(
                    value: 1,
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
                  FormTextFieldContainer(hintText: 'Company Name', title: 'Company Name', textEditingController: companyController),
                  const SizedBox(height: 16,),
                  FormTextFieldContainer(hintText: 'Designation', title: 'Designation', textEditingController: designationController),
                  const SizedBox(height: 24,),
                  GestureDetector(
                    onTap: (){
                      if(formKey.currentState!.validate()){
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context)=>const Home())
                        );                      
                      }
            
                    },
                    child: PrimaryButton(
                      buttonName: 'Create Profile', width: MediaQuery.of(context).size.width,
                      fontSize: 16.0,
                      bold: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

