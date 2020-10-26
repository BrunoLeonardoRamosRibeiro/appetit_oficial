import 'package:appetit/shared/constants.dart';
import 'package:flutter/material.dart';

class ButtonBorderWidget extends StatelessWidget {
  String text;
  int border;
  Color borderColor;
  Color colorButton;
  Function onPressed;

  ButtonBorderWidget(
      {this.text, this.border = 0, this.onPressed = null, this.colorButton, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 0),
          height: 60,
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                text,
                style: TextStyle(color: borderColor),
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: Colors.white,
            border: Border.all(
              width: 3,
              color: borderColor,
            ),
          ),
        ),
      ),
    );
  }
}
