import 'package:flutter/material.dart';
import 'package:magicconnect/widgets/custom_button.dart';
class SwapCard extends StatefulWidget {
  const SwapCard({Key? key}) : super(key: key);
  @override
  State<SwapCard> createState() => _SwapCardState();
}

class _SwapCardState extends State<SwapCard> {
  bool personal =true;
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(left: 28,right:28,top: 24),
      height: 42.5,
      width: deviceWidth,
      decoration: BoxDecoration(
        color: const Color(0xff1b1b1b),
        borderRadius: BorderRadius.circular(32),
      ),
      child:  Padding(
        padding: const EdgeInsets.only(left: 12,right: 12,top: 3,bottom: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                child: CustomButton(selected: personal, buttonName: 'Personal',),
              onTap: (){
                  setState(() {
                    personal = !personal;
                  });
              },
            ),
            GestureDetector(
              child: CustomButton(selected: !personal, buttonName: 'Buisness',),
              onTap: (){
                setState(() {
                  personal = !personal;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
