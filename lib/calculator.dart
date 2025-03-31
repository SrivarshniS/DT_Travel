import 'package:flutter/material.dart';
//import 'dart:math' as math;

// Calculator Page
class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _output = "0";
  String _input = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operator = "";

  void _onPressed(String value) {
    setState(() {
      if (value == "C") {
        _output = "0";
        _input = "";
        _num1 = 0;
        _num2 = 0;
        _operator = "";
      } else if (value == "=") {
        _num2 = double.parse(_input);
        switch (_operator) {
          case "+":
            _output = (_num1 + _num2).toString();
            break;
          case "-":
            _output = (_num1 - _num2).toString();
            break;
          case "x":
            _output = (_num1 * _num2).toString();
            break;
          case "/":
            _output = (_num1 / _num2).toString();
            break;
        }
        _input = _output;
      } else if (value == "+" || value == "-" || value == "x" || value == "/") {
        _num1 = double.parse(_input);
        _operator = value;
        _input = "";
      } else {
        _input += value;
        _output = _input;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_output, style: TextStyle(fontSize: 40)),
          Wrap(
            children: ["7", "8", "9", "/", "4", "5", "6", "x", "1", "2", "3", "-", "C", "0", "=", "+"]
                .map((value) => ElevatedButton(
                      onPressed: () => _onPressed(value),
                      child: Text(value, style: TextStyle(fontSize: 20)),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}