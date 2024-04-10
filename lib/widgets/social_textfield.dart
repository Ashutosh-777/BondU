import 'package:flutter/material.dart';
class SocialTextField extends StatefulWidget {
  final String name;
  const SocialTextField({super.key, required this.name});

  @override
  State<SocialTextField> createState() => _SocialTextFieldState();
}

class _SocialTextFieldState extends State<SocialTextField> with SingleTickerProviderStateMixin {
  late FocusNode _focusNode;
  bool _showSuffixIcon = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      setState(() {
        _showSuffixIcon = _focusNode.hasFocus;
      });
    });

  }


  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(224, 224, 224, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: TextField(
        focusNode: _focusNode,
        maxLines: null,
        style: TextStyle(
          fontSize: 12
        ),
        decoration: InputDecoration(
            hintText: 'Paste Your ${widget.name} Profile Here',
            suffixIcon: _showSuffixIcon ?
            GestureDetector(
                child: const Icon(Icons.check)) : null,
            hintStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
        ),
      ),
    );
  }
}
