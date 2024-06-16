import 'dart:async';

import 'package:flutter/material.dart';
import 'package:magicconnect/modals/user_model.dart';
import 'package:magicconnect/services/api.dart';
import 'package:provider/provider.dart';

import '../stores/auth.dart';

class SocialTextField extends StatefulWidget {
  final String name;
  final String url;
  final StreamController<bool> otherStream;
  const SocialTextField(
      {super.key,
      required this.name,
      this.url = '',
      required this.otherStream});

  @override
  State<SocialTextField> createState() => _SocialTextFieldState();
}

class _SocialTextFieldState extends State<SocialTextField> {
  bool _showSuffixIcon = false;
  bool green = false;
  String socialMediaLink = "";
  bool isLoading = false;
  bool showEditButton = false;
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController(text: widget.url);

    super.initState();
  }

  void _onChanged(String val) {
    socialMediaLink = val;
    if (socialMediaLink.isNotEmpty) {
      _showSuffixIcon = true;
    } else {
      _showSuffixIcon = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var user = context.read<Auth>();
    return Container(
      decoration: BoxDecoration(
        color: green ? Colors.green : const Color.fromRGBO(224, 224, 224, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: isLoading
          ? const SizedBox(
              height: 40,
              child: Center(
                child: SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
              ),
            )
          : showEditButton
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      showEditButton = false;
                      widget.otherStream.add(false);
                    });
                  },
                  child: const SizedBox(
                    height: 40,
                    child: Center(
                        child: Text("Edit",
                            style: TextStyle(color: Colors.black))),
                  ),
                )
              : green
                  ? const SizedBox(
                      height: 40,
                      child: Center(
                        child: SizedBox(
                          width: 25,
                          height: 25,
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        controller: textEditingController,
                        onChanged: _onChanged,
                        decoration: InputDecoration(
                          hintText: 'Paste Your ${widget.name} Profile Here',
                          suffixIcon: _showSuffixIcon
                              ? GestureDetector(
                                  onTap: () async {
                                    UserInfo updateUser = user.userDetails;
                                    if (updateUser.socialMediaHandles == null) {
                                      updateUser.socialMediaHandles = {
                                        widget.name: socialMediaLink
                                      };
                                    } else {
                                      updateUser.socialMediaHandles?[
                                          widget.name] = socialMediaLink;
                                    }
                                    setState(() {
                                      isLoading = true;
                                    });
                                    String result = await ApiService()
                                        .updateSocials(updateUser);
                                    if (result == "Success") {
                                      UserInfo updatedUser =
                                          await ApiService().getUser();
                                      setState(() {
                                        green = true;
                                        isLoading = false;
                                      });

                                      await Future.delayed(
                                          const Duration(seconds: 2));
                                      setState(() {
                                        green = false;
                                        showEditButton = true;
                                        widget.otherStream.add(true);
                                      });
                                      user.addDetails(updatedUser);
                                    }
                                  },
                                  child: const Icon(Icons.check))
                              : null,
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
    );
  }
}
