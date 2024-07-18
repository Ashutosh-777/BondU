import 'dart:async';

import 'package:bondu/globals/socials.dart';
import 'package:bondu/modals/user_model.dart';
import 'package:bondu/stores/auth.dart';
import 'package:bondu/widgets/social_textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../globals/colors.dart';

class AddLink extends StatefulWidget {
  final String name;
  final String url;
  const AddLink({super.key, required this.name, this.url = ""});

  @override
  State<AddLink> createState() => _AddLinkState();
}

class _AddLinkState extends State<AddLink> {
  bool linkExists = false;
  late StreamController<bool> showOthers;
  @override
  void initState() {
    showOthers = StreamController();
    linkExists = widget.url.isNotEmpty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xfff3f3f3),
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: (){
              GoRouter.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
              size: 24,
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                kToolbarHeight -
                MediaQuery.of(context).padding.top,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  color: Colors.white,
                  child: const Text(
                    'Your Socials',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 28),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 24),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.05),
                              offset: Offset(-3, 4),
                              blurRadius: 12,
                              spreadRadius: 0),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/${widget.name}.png',
                          height: 72,
                          width: 72,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          widget.name,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SocialTextField(
                          name: widget.name,
                          url: widget.url,
                          otherStream: showOthers,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: StreamBuilder(
                      stream: showOthers.stream,
                      builder: (context, snapshot) {
                        if (snapshot.data ?? false) {
                          return Consumer<Auth>(
                            builder: (context, auth, child) {
                              final UserInfo user = auth.userDetails;
                              List<String> socials = List.from(
                                  Socials.recommendedSocials +
                                      Socials.otherSocials);
                              socials.remove(widget.name);
                              socials.removeWhere((element) =>
                                  user.socialMediaHandles
                                      ?.containsKey(element) ??
                                  false);
                              if (socials.isEmpty) {
                                return const SizedBox.shrink();
                              }
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Add Others",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(height: 12),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        for (String social in socials)
                                          _CustomSocialTile(
                                              name: social,
                                              url: user.socialMediaHandles ==
                                                      null
                                                  ? ""
                                                  : user.socialMediaHandles![
                                                          social] ??
                                                      ""),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            },
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      }),
                ),
                const Spacer(),
                Container(
                  color: Colors.white,
                  height: 100,
                  child: const Center(
                    child: Text(
                      "BondU",
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomSocialTile extends StatefulWidget {
  final String name;
  final String url;
  const _CustomSocialTile({required this.name, this.url = ''});

  @override
  State<_CustomSocialTile> createState() => __CustomSocialTileState();
}

class __CustomSocialTileState extends State<_CustomSocialTile> {
  bool linkExists = false;

  @override
  void initState() {
    linkExists = widget.url.isNotEmpty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (linkExists) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          print("not yet here");
          context.pushReplacement('/addLink',
            extra: {
            "name":widget.name,
              "url":widget.url,
            }
          );
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => AddLink(
          //       name: ,
          //       url: ,
          //     ),
          //   ),
          // );
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          padding: const EdgeInsets.symmetric(vertical: 18),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/${widget.name}.png',
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    widget.name,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8DEF8),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          linkExists ? Icons.edit : Icons.add,
                          size: 16,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          "Add",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
