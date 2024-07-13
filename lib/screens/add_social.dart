import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:magicconnect/globals/socials.dart';
import 'package:magicconnect/modals/user_model.dart';
import 'package:magicconnect/screens/add_link.dart';
import 'package:magicconnect/stores/auth.dart';
import 'package:provider/provider.dart';

import '../globals/colors.dart';

class AddSocial extends StatefulWidget {
  const AddSocial({super.key});

  @override
  State<AddSocial> createState() => _AddSocialState();
}

class _AddSocialState extends State<AddSocial> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "BondU",
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          elevation: 0,
          leading: GestureDetector(
            onTap: Navigator.of(context).pop,
            child: const Icon(
              Icons.close,
              size: 24,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: GestureDetector(
                onTap: Navigator.of(context).pop,
                child: const Icon(
                  Icons.check,
                  size: 24,
                ),
              ),
            )
          ],
        ),
        body: Consumer<Auth>(
          builder: (context, auth, child) {
            final UserInfo user = auth.userDetails;
            List<String> recommended = List.from(Socials.recommendedSocials);
            List<String> other = List.from(Socials.otherSocials);

            recommended.sort((a, b) {
              if (user.socialMediaHandles == null) {
                return 1;
              }
              if (user.socialMediaHandles!.containsKey(a)) {
                return -1;
              }
              return 1;
            });
            other.sort((a, b) {
              if (user.socialMediaHandles == null) {
                return 1;
              }
              if (user.socialMediaHandles!.containsKey(a)) {
                return -1;
              }
              return 1;
            });

            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Add Link's",
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.normal),
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(19),
                            color: const Color(0xFFD9D9D9)),
                        margin: const EdgeInsets.only(top: 10),
                        height: 38,
                        padding: const EdgeInsets.only(left: 16, top: 16),
                        child: const TextField(
                          maxLines: 1,
                          decoration: InputDecoration(
                              hintText: "Search link's",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 16),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Text(
                      "Recommended",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                    ...List.generate(
                      recommended.length,
                      (index) => CustomSocialTile(
                        name: recommended[index],
                        url: user.socialMediaHandles == null
                            ? ""
                            : user.socialMediaHandles![recommended[index]] ??
                                "",
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      "Other link's",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                    ...List.generate(
                      other.length,
                      (index) => CustomSocialTile(
                        name: other[index],
                        url: user.socialMediaHandles == null
                            ? ""
                            : user.socialMediaHandles![other[index]] ?? "",
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomSocialTile extends StatelessWidget {
  final String name;
  final String url;
  const CustomSocialTile({super.key, required this.name, this.url = ''});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => AddLink(
                    name: name,
                    url: url,
                  )),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        height: 56,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  offset: Offset(4, 4),
                  blurRadius: 4,
                  spreadRadius: 0),
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  offset: Offset(-4, -4),
                  blurRadius: 4,
                  spreadRadius: 0)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/$name.png',
                  height: 24,
                  width: 24,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  name,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFE8DEF8),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                children: [
                  Icon(
                    url.isNotEmpty ? Icons.edit : Icons.add,
                    size: 18,
                  ),
                  const SizedBox(width: 4),
                  Text(url.isNotEmpty ? "EDIT" : "ADD"),
                ],
              ),
            )
            // Image.asset(
            //   'assets/Button.png',
            //   height: 40,
            // ),
          ],
        ),
      ),
    );
  }
}
