import 'package:basic_wallet_sample/product/constants/project_constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget with ProjectConstants {
  CustomTextField({Key? key, required this.controller, required this.labelText})
      : super(key: key);

  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: textFieldPadding,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(textFieldRadius),
            ),
          ),
          labelText: labelText,
        ),
      ),
    );
  }
}
