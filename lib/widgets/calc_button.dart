import 'package:flutter/material.dart';

class CalculationButton extends StatelessWidget {
  final String? text;
  final Color? backgroundColor;
  final Color? textColor;
  final double textSize;
  final Function? callback;

  CalculationButton({
    this.text,
    this.backgroundColor,
    this.textColor = Colors.white,
    this.textSize = 28,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: SizedBox(
        width: 70,
        height: 70,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60.0),
          ),
          child: Text(
            text!,
            style: TextStyle(
              fontSize: textSize
            ),
          ),
          color: backgroundColor,
          textColor: textColor,
          onPressed: () {
            callback!(text);
          },
        ),
      ),
    );
  }
}