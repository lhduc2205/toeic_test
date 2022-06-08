import 'package:flutter/material.dart';
import 'package:front_end/app/core/value/constants/app_constants.dart';
import 'package:lottie/lottie.dart';

import '../../shared_widgets/custom_appbar.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: const Text(
          AppString.PAGE_NOT_FOUND,
          style: TextStyle(
            color: AppColor.primary
          ),
        ),
      ),
      body: Center(
        child: Lottie.asset(LottiePath.error404),
      ),
    );
  }
}
