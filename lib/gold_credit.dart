import 'package:flutter/material.dart';
import 'main.dart';  // Make sure to import your main page

class GoldCreditPage extends StatelessWidget {
  final int counter;

  const GoldCreditPage({Key? key, required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Automatically navigate back after 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Gold Credit"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text(
          "Your current counter value: $counter / 28",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
