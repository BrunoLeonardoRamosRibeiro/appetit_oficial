import 'package:appetit/shared/constants.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.LOGO,
      fit: BoxFit.contain,
      width: 130,
      height: 130,
    );
  }
}
