import 'package:basic_wallet_sample/product/constants/project_constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieHolder extends StatelessWidget with ProjectConstants {
  LottieHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(lottiePath, animate: true),
    );
  }
}
