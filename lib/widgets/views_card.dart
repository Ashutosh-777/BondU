import 'package:flutter/material.dart';

import '../globals/styles.dart';

class ViewsCard extends StatefulWidget {
  final int views;
  const ViewsCard({Key? key, required this.views}) : super(key: key);

  @override
  State<ViewsCard> createState() => _ViewsCardState();
}

class _ViewsCardState extends State<ViewsCard> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final height = deviceHeight / 3.336;
    return Container(
      margin: const EdgeInsets.only(top: 28, left: 32, right: 32),
      height: height,
      width: deviceWidth * .72,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.circle,
                  size: 8,
                  color: Colors.black,
                ),
                Icon(
                  Icons.more_horiz,
                  size: 38,
                  color: Colors.black,
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(
                children: [
                  Text(
                    '${widget.views}',
                    style: Styles.designation.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Views',
                    style: Styles.designation,
                  ),
                ],
              ),
              Image.asset('assets/Edit.png', color: Colors.white, width: 32)
            ]),
          ],
        ),
      ),
    );
  }
}
