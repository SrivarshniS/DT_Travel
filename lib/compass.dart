import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math' as math;

// Compass Page
class CompassPage extends StatefulWidget {
  @override
  _CompassPageState createState() => _CompassPageState();
}

class _CompassPageState extends State<CompassPage> {
  double? _direction;

  @override
  void initState() {
    super.initState();
    FlutterCompass.events!.listen((event) {
      setState(() {
        _direction = event.heading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Compass")),
      body: Center(
        child: _direction == null
            ? Text("Loading compass...")
            : Transform.rotate(
                angle: ((_direction ?? 0) * (math.pi / 180) * -1),
                child: Icon(Icons.navigation, size: 100, color: Colors.blue),
              ),
      ),
    );
  }
}