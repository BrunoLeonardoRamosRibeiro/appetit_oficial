import 'package:flutter/material.dart';

class DecorationShadowWidget extends StatelessWidget {
  double height;
  double width;
  Widget child;

  DecorationShadowWidget({this.height, this.width, this.child = null});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 4,
            color: Colors.blueGrey.withOpacity(0.1),
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: child,

    );
  }
}
