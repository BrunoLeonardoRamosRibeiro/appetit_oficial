import 'package:appetit/shared/constants.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  String text;
  double fontSize;

  HeaderWidget({@required this.text, @required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      height: 50,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 24, color: ORANGE_APPETIT),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.70,
            child: Divider(
              color: Colors.lightGreen,
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
