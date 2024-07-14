import 'package:flutter/material.dart';
import 'package:bondu/globals/colors.dart';

class FormTextFieldContainer extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController textEditingController;
  final int? maxLines;
  final String?Function(String?)? validator;
  const FormTextFieldContainer(
      {super.key,
        required this.hintText,
        required this.title,
        required this.textEditingController,
        this.maxLines,
        this.validator
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16,color: Color.fromRGBO(0, 0, 0, 0.87) ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          child: TextFormField(
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                border: OutlineInputBorder(

                ),
                hintText: hintText,
                hintStyle: TextStyle(
                    fontSize: 16,
                    ),
            ),
            controller: textEditingController,
            cursorColor: primaryColor,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            maxLines: maxLines ?? 1,

            validator: validator ?? (val){
              if(val==null||val.isEmpty){
                return 'This field cannot remain empty';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
