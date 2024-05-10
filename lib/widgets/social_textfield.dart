import 'package:flutter/material.dart';
import 'package:magicconnect/modals/user_model.dart';
import 'package:magicconnect/services/api.dart';
import 'package:provider/provider.dart';

import '../stores/auth.dart';
class SocialTextField extends StatefulWidget {
  final String name;
  const SocialTextField({super.key, required this.name});

  @override
  State<SocialTextField> createState() => _SocialTextFieldState();
}

class _SocialTextFieldState extends State<SocialTextField> with SingleTickerProviderStateMixin {
  late FocusNode _focusNode;
  bool _showSuffixIcon = false;
  bool green=false;
  String socialMediaLink = "";
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _showSuffixIcon = _focusNode.hasFocus;
      });
    });
  }
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var user = context.read<Auth>();
    return  Container(
      decoration: BoxDecoration(
        color: green ? Colors.green :const Color.fromRGBO(224, 224, 224, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: green ? const SizedBox(
        height: 40,
          child: Center(child: Text('Socials updated Successfully'))) :TextField(
        onChanged: (val){
          socialMediaLink =val;
        },
        focusNode: _focusNode,
        maxLines: null,
        style: const TextStyle(
          fontSize: 12
        ),
        decoration: InputDecoration(
            hintText: 'Paste Your ${widget.name} Profile Here',
            suffixIcon: _showSuffixIcon ?
            GestureDetector(
              onTap: () async{
                print("Updating Details......");
                UserInfo updateUser = user.userDetails;
                updateUser.socialMediaHandles?[widget.name] = socialMediaLink;
                String result = await ApiService().updateSocials(updateUser);
                if(result=="Success"){
                  setState(() {
                    green = true;
                  });
                }
                UserInfo updatedUser = await ApiService().getUser();
                user.addDetails(updatedUser);
                print("Details Updated");
              },
                child: const Icon(Icons.check)
            ) : null,
            hintStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
        ),
      ),
    );
  }
}
