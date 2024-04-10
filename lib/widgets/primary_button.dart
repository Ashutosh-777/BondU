import 'package:flutter/material.dart';

import '../globals/colors.dart';
class PrimaryButton extends StatelessWidget {
  final String buttonName;
  final double width;
  final double? fontSize;
  final bool bold;
  const PrimaryButton({super.key, required this.buttonName, required this.width, this.fontSize, required this.bold});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 39,
      width: width,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(4),

      ),
      child: Center(
        child: Text(buttonName,
          style:  TextStyle(
              fontFamily: 'Gilory-Regular',
              fontSize: fontSize??12,
              fontWeight: bold? FontWeight.bold:FontWeight.normal,
              color: Colors.white
          ),
        ),
      ),
    );
  }
}