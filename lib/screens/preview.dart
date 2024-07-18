import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Preview extends StatefulWidget {
  final String userid;
  const Preview({super.key, required this.userid});
  @override
  State<Preview> createState() => _PreviewState();
}
class _PreviewState extends State<Preview> {
  late WebViewController controller;
  bool isLoading = true;
  String id = "";

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://www.app.bondu.in/user/${widget.userid}'))
          .whenComplete(() {
        setState(() {
          isLoading = false;
        });
      });
  }
  @override
  @protected
  @mustCallSuper
  void didUpdateWidget(covariant  oldWidget){
    super.didUpdateWidget(oldWidget);
    setState(() {
      isLoading=true;
    });
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://www.app.bondu.in/user/${widget.userid}'))
          .whenComplete(() {
        setState(() {
          isLoading = false;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: GestureDetector(
              onTap: (){
                context.push("/user/ehvuC4hUs5XYdNa7B6DPwJ");
              },
              child: const Text('BondU your Digital Saathi')),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : WebViewWidget(
                controller: controller,
              ),
      ),
    );
  }
}
