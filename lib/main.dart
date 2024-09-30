//VELANKANI JOISE DIVYA GORLA CHRISTURAJ | 002837972 | CALCULATORAPP

import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '0'; // Current output to be displayed
  String _result = '0'; // Final result after calculation
  String _operator = ''; // Stores operator
  String _operand = ''; // Stores first operand
  bool _decimalUsed = false; // Track decimal usage

  // Function to handle button press
  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = '0';
        _result = '0';
        _operator = '';
        _operand = '';
        _decimalUsed = false;
      } else if (buttonText == "." && !_decimalUsed) {
        _output += buttonText;
        _decimalUsed = true;
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/") {
        _operand = _output;
        _operator = buttonText;
        _output = '';
        _decimalUsed = false;
      } else if (buttonText == "=") {
        double num1 = double.parse(_operand);
        double num2 = double.parse(_output);

        switch (_operator) {
          case "+":
            _result = (num1 + num2).toString();
            break;
          case "-":
            _result = (num1 - num2).toString();
            break;
          case "*":
            _result = (num1 * num2).toString();
            break;
          case "/":
            if (num2 == 0) {
              _result = "Error";
            } else {
              _result = (num1 / num2).toString();
            }
            break;
        }

        _output = _result;
        _operator = '';
        _operand = '';
      } else {
        if (_output == '0') {
          _output = buttonText;
        } else {
          _output += buttonText;
        }
      }
    });
  }

  // Function to build individual buttons
  Widget _buildButton(String buttonText, Color color) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(6), // Add margin for a better visual layout
        child: ElevatedButton(
          onPressed: () => _buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(22), // Adjust padding for button size
            backgroundColor: color,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 28, color: Colors.white), // Text styling for the button
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Column(
        children: [
          // Display area for output
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Calculator buttons in a grid layout
          Column(
            children: [
              Row(
                children: [
                  _buildButton("7", Colors.grey),
                  _buildButton("8", Colors.grey),
                  _buildButton("9", Colors.grey),
                  _buildButton("/", Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton("4", Colors.grey),
                  _buildButton("5", Colors.grey),
                  _buildButton("6", Colors.grey),
                  _buildButton("*", Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton("1", Colors.grey),
                  _buildButton("2", Colors.grey),
                  _buildButton("3", Colors.grey),
                  _buildButton("-", Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton("C", Colors.red),
                  _buildButton("0", Colors.grey),
                  _buildButton(".", Colors.grey),
                  _buildButton("+", Colors.orange),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(6),
                      child: ElevatedButton(
                        onPressed: () => _buttonPressed("="),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(20),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: Text(
                          "=",
                          style: TextStyle(fontSize: 28, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
