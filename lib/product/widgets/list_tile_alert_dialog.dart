import 'package:basic_wallet_sample/product/constants/project_constants.dart';
import 'package:basic_wallet_sample/product/widgets/cache_save_button.dart';
import 'package:flutter/material.dart';

class ListTileAlertDialog extends StatelessWidget with ProjectConstants {
  ListTileAlertDialog({Key? key, required this.onPressed}) : super(key: key);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(alertContent),
      actions: [
        CacheSaveButton(
          buttonTitle: yesButtonText,
          onPressed: onPressed,
        ),
        CacheSaveButton(
          buttonTitle: noButtonText,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
