import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'ReusableButton.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String equation;
  String result = '0';
  String expression;
  void calculate(String label){
    setState(() {
      if(label == 'C'){
        equation = null;
        result = '0';
      }
      else if(label == '⌫'){
        equation = equation.substring(0,equation.length-1);
        if(equation == ''){
          equation = '0';
        }
      }
      else if(equation == null){
        equation = '';
        equation = equation+label;
        if(label == '0'){
          equation = '0';
        }
      }
      else if(label == '='){
        equation = equation.replaceAll('x', '*');
        equation = equation.replaceAll('÷', '/');
        equation = equation.replaceAll('-', '-');
        equation = equation.replaceAll('+', '+');

        expression = equation;
        Parser p = Parser();
        Expression exp = p.parse(expression);
        ContextModel cm = ContextModel();
        result = '${exp.evaluate(EvaluationType.REAL, cm)}';

      }
      else{
        equation = equation+label;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(15),
            alignment: Alignment.topRight,
            child: Text(equation??'0', style: TextStyle(fontSize: 50),),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(15),
            alignment: Alignment.topRight,
            child: Text(result, style: TextStyle(fontSize: 50),),
          ),
          Expanded(child: SizedBox()),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        ReusableButton(color: Colors.red, label: 'C', onPressed: (){calculate('C');},),
                        ReusableButton(color: Colors.lightBlue, label: '⌫', onPressed: (){calculate('⌫');},),
                        ReusableButton(color: Colors.lightBlue, label: '÷', onPressed: (){calculate('÷');},),
                      ]
                    ),
                    TableRow(
                        children: [
                          ReusableButton(color: Colors.black45, label: '7', onPressed: (){calculate('7');},),
                          ReusableButton(color: Colors.black45, label: '8', onPressed: (){calculate('8');},),
                          ReusableButton(color: Colors.black45, label: '9', onPressed: (){calculate('9');},),
                        ]
                    ),
                    TableRow(
                        children: [
                          ReusableButton(color: Colors.black45, label: '4', onPressed: (){calculate('4');},),
                          ReusableButton(color: Colors.black45, label: '5', onPressed: (){calculate('5');},),
                          ReusableButton(color: Colors.black45, label: '6', onPressed: (){calculate('6');},),
                        ]
                    ),
                    TableRow(
                        children: [
                          ReusableButton(color: Colors.black45, label: '1', onPressed: (){calculate('1');},),
                          ReusableButton(color: Colors.black45, label: '2', onPressed: (){calculate('2');},),
                          ReusableButton(color: Colors.black45, label: '3', onPressed: (){calculate('3');},),
                        ]
                    ),
                    TableRow(
                        children: [
                          ReusableButton(color: Colors.black45, label: '.', onPressed: (){calculate('.');},),
                          ReusableButton(color: Colors.black45, label: '0', onPressed: (){calculate('0');},),
                          ReusableButton(color: Colors.black45, label: '00', onPressed: (){calculate('00');},),
                        ]
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        ReusableButton(color: Colors.lightBlue, label: 'x', onPressed: (){calculate('x');},),
                      ],
                    ),
                    TableRow(
                      children: [
                        ReusableButton(color: Colors.lightBlue, label: '-', onPressed: (){calculate('-');},),
                      ],
                    ),
                    TableRow(
                      children: [
                        ReusableButton(color: Colors.lightBlue, label: '+', onPressed: (){calculate('+');},),
                      ],
                    ),
                    TableRow(
                      children: [
                        ReusableButton(color: Colors.red, label: '=', onPressed: (){calculate('=');}, heightRatio: 0.24,),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
