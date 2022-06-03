library login;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:front_end/app/core/value/constants/app_constants.dart';
import 'package:front_end/app/core/value/theme/theme.dart';
import 'package:front_end/app/repository/auth_repository.dart';
import 'package:lottie/lottie.dart';

import '../../../shared_widgets/custom_input_field.dart';
import '../../../shared_widgets/default_button.dart';
import '../bloc/auth/form_submission_status.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

part 'widgets/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: kPrimary,
            gradient: kPrimaryGradientColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSecurityLottie(),
              _buildLoginText(),
              const SizedBox(height: 10),
              _buildLoginForm(),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildLoginText() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      width: double.infinity,
      child: Center(
        child: Text(
          AppString.LOGIN,
          style: titleTextStyle(
            color: kWhite,
          ),
        ),
      ),
    );
  }

  Container _buildSecurityLottie() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      width: double.infinity,
      child: Lottie.asset(LottiePath.SECURITY, height: 150),
    );
  }

  Widget _buildLoginForm() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(kSpacing),
        decoration: const BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(
              40,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: _LoginForm(),
        ),
      ),
    );
  }
}
