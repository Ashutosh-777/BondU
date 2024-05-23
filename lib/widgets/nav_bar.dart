import 'package:flutter/material.dart';
import '../globals/colors.dart';
class NavBarItem extends StatelessWidget {
  final String assetImage;
  final String title;
  final int index;
  final Function onTap;
  final bool isSelected;
  const NavBarItem(
      {super.key,
        required this.assetImage,
        required this.title,
        required this.index,
        required this.onTap,
        required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ImageIcon(
          AssetImage(assetImage),
          color: isSelected ? primaryColor : Colors.black,
        ),
        Text(
          title,
          style: TextStyle(
              color: isSelected ? primaryColor : Colors.black, fontSize: 11.5),
        )
      ]),
    );
  }
}
