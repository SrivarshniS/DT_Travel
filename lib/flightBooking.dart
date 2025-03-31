import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FlightPage extends StatefulWidget {
  @override
  _FlightPageState createState() => _FlightPageState();
}

class _FlightPageState extends State<FlightPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://www.cleartrip.com/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flight Booking")),
      body: WebViewWidget(controller: _controller),
    );
  }
}
