import 'package:appetit/shared/constants.dart';
import 'package:flutter/material.dart';

class ButtonLoginWidget extends StatelessWidget {
  String text;
  int border;
  bool enabled;
  Function onPressed;

  ButtonLoginWidget(
      {this.text, this.border = 0, this.onPressed = null, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: enabled ? onPressed : null,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          height: 60,
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: enabled ? ORANGE_APPETIT : ORANGE_APPETIT.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
