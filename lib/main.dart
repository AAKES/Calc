import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'color.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CalculatorApp(),
  ));
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  double firstNum = 0.0;
  double secondNum = 0.0;
  var input = '';
  var output = '';
  // var operation = '';
  onButtonClick(value) {
    if (value == 'AC') {
      input = '';
      output = '';
    } else if (value == '←') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == '=') {
      if (input.isNotEmpty) {
        var userinput = input;
        userinput = input.replaceAll('x', '*');
        userinput = input.replaceAll('÷', '/');
        Parser p = Parser();
        Expression expression = p.parse(userinput);
        ContextModel cm = ContextModel();
        var finalvalue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalvalue.toString();
        if (output.endsWith('.0')) {
          output = output.substring(0, output.length - 2);
        }
      }
      // output = output.toString();
    } else {
      input = input + value;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
              child: Container(
            width: double.infinity,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  input,
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 00,
                ),
                Text(
                  output,
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          )),
          Row(
            children: [
              button(
                  text: 'mc',
                  tColor: Colors.black,
                  buttonBgColor: Colors.blueGrey),
              button(
                  text: 'm+',
                  tColor: Colors.black,
                  buttonBgColor: Colors.blueGrey),
              button(
                  text: 'm-',
                  tColor: Colors.black,
                  buttonBgColor: Colors.blueGrey),
              button(
                  text: 'mr',
                  tColor: Colors.black,
                  buttonBgColor: Colors.blueGrey),
            ],
          ),
          Row(
            children: [
              button(
                  text: 'AC', tColor: orangeColor, buttonBgColor: buttonColor),
              button(text: '←'),
              button(text: '+/- '),
              button(text: '÷'),
            ],
          ),
          Row(
            children: [
              button(text: '7'),
              button(text: '8'),
              button(text: '9'),
              button(text: 'x'),
            ],
          ),
          Row(
            children: [
              button(text: '4'),
              button(text: '5'),
              button(text: '6'),
              button(text: '-'),
            ],
          ),
          Row(
            children: [
              button(text: '1'),
              button(text: '2'),
              button(text: '3'),
              button(text: '+'),
            ],
          ),
          Row(
            children: [
              button(text: '0'),
              button(text: '.'),
              button(text: '%'),
              button(
                  text: '=', tColor: orangeColor, buttonBgColor: buttonColor),
            ],
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      
      backgroundColor: Colors.blueGrey,
      title: Row(
        
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            size: 30,
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              child: Image.asset('assets/images/pas075bct003.jpg'),
            ),
          )
        ],
      ),
      
    );
  }

  Widget button({text, tColor = Colors.white, buttonBgColor = buttonColor}) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.all(15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // backgroundColor: Colors.amber,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
          padding: EdgeInsets.all(15),
          primary: buttonBgColor,
        ),
        onPressed: () => onButtonClick(text),
        child: Text(
          text,
          style: TextStyle(
              color: tColor, fontStyle: FontStyle.normal, fontSize: 20),
        ),
      ),
    ));
  }
}
