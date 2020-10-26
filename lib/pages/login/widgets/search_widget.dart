import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  String label;
  Function onChanged;
  Widget prefixIcon;
  Widget sufixIcon;

  SearchWidget({this.label, this.onChanged, this.prefixIcon = null, this.sufixIcon = null});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: label,
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: prefixIcon,
          suffixIcon: sufixIcon,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
