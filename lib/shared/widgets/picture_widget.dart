import 'package:appetit/shared/constants.dart';
import 'package:flutter/material.dart';

class PictureWidget extends StatelessWidget {
  double size;
  String imagePath;

  PictureWidget({this.imagePath, this.size = 32});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: ORANGE_APPETIT,
          borderRadius: BorderRadius.circular(size),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(size),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: 130,
            height: 130,
          ),
        ),
      ),
    );
  }
}
