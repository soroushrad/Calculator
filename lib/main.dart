import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_button/flutter_button.dart';
import 'package:mycal/widgets/calculator_button.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.amber[100],
      statusBarColor: Colors.amber[100],
      statusBarIconBrightness: Brightness.dark));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String outPutResult = "0";
  String cashResult = "0";
  double firstNumber = 0.0;
  double secondNumber = 0.0;
  String operation = "";

  @override
  Widget build(BuildContext context) {
    double W = MediaQuery.of(context).size.width;
    double H = MediaQuery.of(context).size.height;

    void btnClicked(String btnValue) {
      print(btnValue);
      print(outPutResult);
      print(cashResult);
      if (btnValue == "Clear") {
        cashResult = "0";
        firstNumber = 0.0;
        secondNumber = 0.0;
        operation = "";
      } else if (btnValue == "+" ||
          btnValue == "-" ||
          btnValue == "X" ||
          btnValue == "/") {
        firstNumber = double.parse(outPutResult);
        operation = btnValue;
        cashResult = "0";
      } else if (btnValue == ".") {
        if (cashResult.contains(".")) {
          print("Already it has a decimal");
          return;
        } else {
          cashResult = cashResult + btnValue;
        }
      } else if (btnValue == "=") {
        secondNumber = double.parse(outPutResult);
        if (operation == "+") {
          cashResult = (firstNumber + secondNumber).toString();
        }
        if (operation == "-") {
          cashResult = (firstNumber - secondNumber).toString();
        }
        if (operation == "X") {
          cashResult = (firstNumber * secondNumber).toString();
        }
        if (operation == "/") {
          cashResult = (firstNumber / secondNumber).toString();
        }
        firstNumber = 0.0;
        secondNumber = 0.0;
        operation = "";
      } else {
        cashResult = cashResult + btnValue;
      }
      setState(() {
        outPutResult = double.parse(cashResult).toString();
      });
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber[100],
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              //Display Result
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.amber[50],
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    alignment: Alignment.center,
                    height: H / 2.2,
                    width: W / 1.15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          outPutResult,
                          style: TextStyle(fontSize: 40),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // 7 | 8 | 9 | /
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(text: '7', callback: btnClicked),
                  CalculatorButton(text: '8', callback: btnClicked),
                  CalculatorButton(text: '9', callback: btnClicked),
                  CalculatorButton(text: '/', callback: btnClicked),
                ],
              ),
              const SizedBox(
                height: 5,
              ),

              // 4 | 5 | 6 | *
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(text: '4', callback: btnClicked),
                  CalculatorButton(text: '5', callback: btnClicked),
                  CalculatorButton(text: '6', callback: btnClicked),
                  CalculatorButton(text: 'X', callback: btnClicked),
                ],
              ),
              const SizedBox(
                height: 5,
              ),

              // 1 | 2 | 3 | -
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(text: '1', callback: btnClicked),
                  CalculatorButton(text: '2', callback: btnClicked),
                  CalculatorButton(text: '3', callback: btnClicked),
                  CalculatorButton(text: '-', callback: btnClicked),
                ],
              ),
              const SizedBox(
                height: 5,
              ),

              // . | 0 | 00 | +
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(text: '0', callback: btnClicked),
                  CalculatorButton(text: '.', callback: btnClicked),
                  CalculatorButton(text: '00', callback: btnClicked),
                  CalculatorButton(text: '+', callback: btnClicked),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              // Clear and =
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button3D(
                    width: W / 3,
                    child: const Text(
                      "Clear",
                      style: TextStyle(fontSize: 20),
                    ),
                    style: StyleOf3dButton(
                      backColor: Colors.red[900],
                      topColor: Colors.redAccent[400],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    onPressed: () => btnClicked("Clear"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Button3D(
                    width: W / 4,
                    child: const Text(
                      "=",
                      style: TextStyle(fontSize: 20),
                    ),
                    style: StyleOf3dButton(
                      backColor: Colors.green[900],
                      topColor: Colors.green[400],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    onPressed: () => btnClicked("="),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
