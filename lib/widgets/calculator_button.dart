import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_button/flutter_button.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Function callback;


  const CalculatorButton({
    required this.text,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    double W = MediaQuery.of(context).size.width;
    double H = MediaQuery.of(context).size.height;
    return Button3D(
      width: W / 5,
      child: Text(
        text,
        style: const TextStyle(fontSize: 30),
      ),
      style: StyleOf3dButton(
        backColor: Colors.grey[900],
        topColor: Colors.grey[400],
        borderRadius: BorderRadius.circular(30),
      ),
      onPressed: () => callback(text),
    );
  }
}
