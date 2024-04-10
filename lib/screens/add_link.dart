import 'package:flutter/material.dart';
import 'package:magicconnect/widgets/social_textfield.dart';
import '../globals/colors.dart';

class AddLink extends StatefulWidget {
  final String name;
  const AddLink({super.key, required this.name});

  @override
  State<AddLink> createState() => _AddLinkState();
}

class _AddLinkState extends State<AddLink> {
  @override
  BoxShadow alpha =
    const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.1),
        offset: Offset(4,4),
        blurRadius: 4,
        spreadRadius: 0
    );
  BoxShadow beta =
  const BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.1),
      offset: Offset(-4,-4),
      blurRadius: 4,
      spreadRadius: 0
  );
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: Navigator.of(context).pop,
          child: const Icon(
            Icons.arrow_back,
            size: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Your Socials',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 24
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        offset: Offset(4,4),
                        blurRadius: 4,
                        spreadRadius: 0
                    ),
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        offset: Offset(-4,-4),
                        blurRadius: 4,
                        spreadRadius: 0
                    )
                  ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/${widget.name}.png',height: 72,width: 72,),
                  Text(widget.name,style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  ),),
                  const SizedBox(height: 10,),
                  SocialTextField(name: widget.name,)
                ],
              ),
            ),
            const Text('Add Others',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 24
              ),
            ),
            const SizedBox(height: 12,),
            // SizedBox(
            //   width: double.infinity,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: [
            //       Container(
            //         height: 121,
            //         width: 155,
            //         margin: const EdgeInsets.symmetric(horizontal: 8),
            //         decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.circular(8),
            //             boxShadow:  [
            //               alpha,
            //               beta,
            //             ]
            //         ),
            //         child: Padding(
            //           padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 22),
            //           child: Column(
            //             children: [
            //               Row(
            //                 children: [
            //                   Image.asset('assets/Behance.png',height: 24,width: 24,),
            //                   const SizedBox(width: 8,),
            //                   const Text('Behnace',style: TextStyle(
            //                       fontSize: 14
            //                   ),)
            //                 ],
            //               ),
            //               const SizedBox(height: 12,),
            //               Image.asset('assets/Button.png',width: 92,height: 40,)
            //             ],
            //           ),
            //         ),
            //       ),
            //       Container(
            //         width: 155,
            //         margin: const EdgeInsets.symmetric(horizontal: 8,),
            //         decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.circular(8),
            //             boxShadow:  [
            //               alpha,
            //               beta,
            //             ]
            //         ),
            //         child: Padding(
            //           padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 22),
            //           child: Column(
            //             children: [
            //               Row(
            //                 children: [
            //                   Image.asset('assets/Whatsapp.png',height: 24,width: 24,),
            //                   const SizedBox(width: 8,),
            //                   const Text('Whatsapp',style: TextStyle(
            //                       fontSize: 14
            //                   ),)
            //                 ],
            //               ),
            //               const SizedBox(height: 12,),
            //               Image.asset('assets/Button.png',width: 92,height: 40,)
            //             ],
            //           ),
            //         ),
            //       ),
            //       Container(
            //         width: 155,
            //         margin: const EdgeInsets.symmetric(horizontal: 8,),
            //         decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.circular(8),
            //             boxShadow:  [
            //               alpha,
            //               beta,
            //             ]
            //         ),
            //         child: Padding(
            //           padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 22),
            //           child: Column(
            //             children: [
            //               Row(
            //                 children: [
            //                   Image.asset('assets/Whatsapp.png',height: 24,width: 24,),
            //                   const SizedBox(width: 8,),
            //                   const Text('Whatsapp',style: TextStyle(
            //                       fontSize: 14
            //                   ),)
            //                 ],
            //               ),
            //               const SizedBox(height: 12,),
            //               Image.asset('assets/Button.png',width: 92,height: 40,)
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            const Center(
              child: Text(
                "BondU",
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 24
                ),
              ),
            ),
            const SizedBox(height: 18,)
          ],
        ),
      ),
    );
  }
}
