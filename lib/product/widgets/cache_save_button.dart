import 'package:basic_wallet_sample/product/constants/project_constants.dart';
import 'package:flutter/material.dart';

class CacheSaveButton extends StatelessWidget with ProjectConstants {
  CacheSaveButton({Key? key, required this.onPressed, required this.buttonTitle}) : super(key: key);
  final void Function() onPressed;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: cacheSaveButtonPadding,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: const StadiumBorder(),
        ),
        child: Padding(
          padding: cacheSaveButtonTextPadding,
          child: Text(buttonTitle),
        ),
      ),
    );
  }
}
