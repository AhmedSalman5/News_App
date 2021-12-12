import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
   const WebViewScreen({Key? key, required this.url}) : super(key: key);

  // هفتحه لم هدوس علي ال item الي احنا عاملينه من خلال انو اعمل ال item ادوس عليه
  final  String? url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  WebView(
      initialUrl: url,
      ),
    );
  }
}
