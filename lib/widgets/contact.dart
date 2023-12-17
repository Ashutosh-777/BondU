import 'package:flutter/material.dart';

import '../globals/colors.dart';
import '../globals/styles.dart';
class Contact extends StatelessWidget {
  final String contactName;
  final String designation;
  final String imagePath;
  const Contact({Key? key, required this.contactName, required this.designation, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 23,vertical: 8),
      height: 67,
      width: MediaQuery.of(context).size.width-46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipOval(
                child: Image.asset(imagePath,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )
            ),
            Padding(
              padding: EdgeInsets.only(left: 12,top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(contactName,style: Styles.contactName,),
                  Text(designation,style: Styles.designation,),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Image.asset('assets/SendDiagonal.png',width: 30,height: 300,color: Colors.white,),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Image.asset('assets/adduser.png',width: 30,height: 30,color: Colors.white,),
                ),
                const Icon(Icons.more_vert,color: Colors.white,size: 35,),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
