import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Preview extends StatefulWidget {
  final userid;
  const Preview({super.key, required this.userid});

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://www.app.bondu.in/user/${widget.userid}'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BondU your Digital Saathi'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
