import 'package:flutter/material.dart';

import '../globals/styles.dart';
class CustomButton extends StatefulWidget {
  final bool selected;
  final String buttonName;
  const CustomButton({Key? key, required this.selected, required this.buttonName}) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 35.7,
      width: deviceWidth/2.5,
      decoration:  BoxDecoration(
        color: widget.selected? Colors.white:Colors.transparent,
        borderRadius: BorderRadius.circular(32),
        boxShadow:widget.selected? [BoxShadow(
            color:
            Color.fromARGB(130, 255, 255, 255),
            blurRadius: 4,
            offset: Offset(0, 2))]:[],
      ),
      child: Center(child: Text(widget.buttonName,
        style: widget.selected? Styles.swapButtonText2:Styles.swapButtonText1,
      )),
    );
  }
}
