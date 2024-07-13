import 'package:flutter/material.dart';
import 'package:magicconnect/modals/user_model.dart';
import 'package:magicconnect/screens/add_social.dart';
import 'package:magicconnect/screens/preview.dart';
import 'package:magicconnect/services/api.dart';
import 'package:magicconnect/services/auth_user_helper.dart';
import 'package:magicconnect/widgets/business_card.dart';
import 'package:magicconnect/widgets/edit_business_card.dart';
import 'package:provider/provider.dart';
import 'package:magicconnect/extentions/debounce_extention.dart';
import '../stores/auth.dart';
import '../widgets/primary_button.dart';

class EditCardScreen extends StatefulWidget {
  final UserInfo user;
  const EditCardScreen({
    super.key,
    required this.user,
  });

  @override
  State<EditCardScreen> createState() => _EditCardScreenState();
}

class _EditCardScreenState extends State<EditCardScreen> {
  final formKey = GlobalKey<FormState>();
  late final UserInfo _tempUser;
  late TextEditingController nameController;
  late TextEditingController designationController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController companyController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _tempUser = UserInfo.fromJson(widget.user.toJson());
    nameController = TextEditingController(text: widget.user.name);
    designationController =
        TextEditingController(text: widget.user.designation);
    emailController = TextEditingController(text: widget.user.email);
    phoneController = TextEditingController(text: widget.user.phone.toString());
    companyController = TextEditingController(text: widget.user.companyName);
    super.initState();
  }

  Future<void> _saveDetails() async {
    if (_formKey.currentState!.validate()) {
      UserInfo user = UserInfo(
        name: nameController.text,
        designation: designationController.text,
        companyName: companyController.text,
        email: emailController.text,
        phone: int.parse(phoneController.text),
        socialMediaHandles: widget.user.socialMediaHandles,
        id: widget.user.id,
        bio: widget.user.bio,
      );

      await ApiService().updateUser(user);
      user = await ApiService().getUser();
      context.read<Auth>().addDetails(user);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: const Text(
            'Edit Card',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          actions: [
            // Placeholder()
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: GestureDetector(
                onTap: () {
                  _saveDetails();
                },
                child: const Text("Save",
                    style: TextStyle(
                        color: Color(0xFF6C24C8),
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  BusinessCard(
                    user: _tempUser,
                    isEdit: true,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  _CommonTextField(
                    labelText: 'Name',
                    textEditingController: nameController,
                    onChanged: (val) {
                      setState(() {
                        _tempUser.name = val;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _CommonTextField(
                          labelText: 'Designation',
                          textEditingController: designationController,
                          onChanged: (val) {
                            setState(() {
                              _tempUser.designation = val;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _CommonTextField(
                          labelText: 'Company',
                          textEditingController: companyController,
                          onChanged: (val) {
                            setState(() {
                              _tempUser.companyName = val;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  _CommonTextField(
                    labelText: 'Email',
                    textEditingController: emailController,
                    onChanged: (val) {
                      setState(() {
                        _tempUser.email = val;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  _CommonTextField(
                    labelText: 'Phone',
                    textEditingController: phoneController,
                    onChanged: (val) {
                      final temp = int.tryParse(val);
                      if (temp != null) {
                        setState(() {
                          _tempUser.phone = temp;
                        });
                      } else {
                        _tempUser.phone = null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 41,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const AddSocial()));
                          },
                          child: PrimaryButton(
                            width: width,
                            buttonName: 'Add Social',
                            bold: false,
                          ),
                        ),
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              String? temp = await AuthUserHelper.getUserID();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Preview(userid: temp)));
                            }
                          },
                          child: PrimaryButton(
                              width: width, buttonName: 'Preview', bold: false),
                        ),
                      ),
                    ],
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

class _CommonTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController textEditingController;
  final void Function(String)? onChanged;

  const _CommonTextField(
      {required this.labelText,
      required this.textEditingController,
      this.onChanged});

  @override
  State<_CommonTextField> createState() => __CommonTextFieldState();
}

class __CommonTextFieldState extends State<_CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF79747E)),
              borderRadius: BorderRadius.all(Radius.circular(4))),
          labelText: widget.labelText,
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
