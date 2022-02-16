import 'package:calculator/widgets/calc_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _value = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: const Alignment(0.8, 0.8),
                    child: Text(
                      _value,
                      style: const TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                        ),
                    ),
                  ),
                  //alignment: const Alignment(1.0, 1.0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculationButton(
                  text: 'AC',
                  backgroundColor: Colors.teal,
                  textSize: 20,
                  callback: clearAll,
                ),
                CalculationButton(
                  text: 'C',
                  backgroundColor: Colors.teal,
                  callback: clearLastChar,
                ),
                CalculationButton(
                  text: '%',
                  backgroundColor: Colors.teal,
                  textColor: Colors.white,
                  callback: enteredValues,
                ),
                CalculationButton(
                  text: '/',
                  backgroundColor: Colors.teal,
                  textColor: Colors.white,
                  callback: enteredValues,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculationButton(
                  text: '7',
                  callback: enteredValues,
                ),
                CalculationButton(
                  text: '8',
                  callback: enteredValues,
                ),
                CalculationButton(
                  text: '9',
                  callback: enteredValues,
                ),
                CalculationButton(
                  text: '*',
                  backgroundColor: Colors.teal,
                  textColor: Colors.white,
                  textSize: 24,
                  callback: enteredValues,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculationButton(
                  text: '4',
                  callback: enteredValues,
                ),
                CalculationButton(
                  text: '5',
                  callback: enteredValues,
                ),
                CalculationButton(
                  text: '6',
                  callback: enteredValues,
                ),
                CalculationButton(
                  text: '-',
                  backgroundColor: Colors.teal,
                  textColor: Colors.white,
                  textSize: 38,
                  callback: enteredValues,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculationButton(
                  text: '1',
                  callback: enteredValues,
                ),
                CalculationButton(
                  text: '2',
                  callback: enteredValues,
                ),
                CalculationButton(
                  text: '3',
                  callback: enteredValues,
                ),
                CalculationButton(
                  text: '+',
                  backgroundColor: Colors.teal,
                  textColor: Colors.white,
                  textSize: 30,
                  callback: enteredValues,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculationButton(
                  text: '.',
                  callback: enteredValues,
                ),
                CalculationButton(
                  text: '0',
                  callback: enteredValues,
                ),
                CalculationButton(
                  text: '00',
                  callback: enteredValues,
                  textSize: 26,
                ),
                CalculationButton(
                  text: '=',
                  backgroundColor: Colors.teal,
                  textColor: Colors.white,
                  callback: evaluate,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }



  void enteredValues(String text) {
    setState(() => _value += text);
  }

  // Reset all entered/calculated data
  void clearAll(String text) {
    setState(() {
      _value = '';
    });
  }

  // Clear the last entered char/symbol
  void clearLastChar(String text) {
    String newValue = _value.substring(0, _value.length - 1);
    setState(() {
      _value = newValue;
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_value);
    ContextModel cm = ContextModel();

    setState(() {
      _value = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

}
