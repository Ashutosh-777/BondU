import 'package:flutter/material.dart';
import 'package:magicconnect/globals/colors.dart';
import 'package:magicconnect/screens/editsocialscreen.dart';

class SocialLinkTile extends StatelessWidget {
  final String text;
  final String imageUrl;
  final bool linkExists;

  const SocialLinkTile(
      {super.key,
      required this.text,
      required this.imageUrl,
      this.linkExists = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 217, 217, 217),
          borderRadius: BorderRadius.circular(8.0)),
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipOval(
                child: Image.network(
                  imageUrl,
                  height: 35,
                  width: 35,
                ),
              ),
              const SizedBox(
                width: 20,
                height: 10,
              ),
              Text(
                text,
                style: const TextStyle(fontSize: 18.0),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EditSocialScreen(socialName: text)));
            },
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(primaryColor),
            ),
            child: Text(
              linkExists ? "ADD" : "EDIT",
              style: const TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}



// NetworkImage(
//                   "https://cdn-icons-png.flaticon.com/512/174/174857.png",
//                 ),