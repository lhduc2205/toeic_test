library registration_view;

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:front_end/app/core/value/constants/app_constants.dart';
import 'package:front_end/app/core/value/theme/theme.dart';
import 'package:front_end/app/shared_widgets/custom_input_field.dart';
import 'package:front_end/app/shared_widgets/default_button.dart';
import 'package:front_end/app/shared_widgets/rounded_container.dart';
import 'package:lottie/lottie.dart';

import '../../../shared_widgets/custom_text_button.dart';
import '../../../shared_widgets/default_gradient_container.dart';

part 'widgets/username_input.dart';
part 'widgets/password_input.dart';
part 'widgets/repeat_password_input.dart';
part 'widgets/license_text.dart';
part 'widgets/submit_button.dart';
part 'widgets/login_button.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultGradientContainer(
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 10),
              _buildSignUpForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Lottie.asset(LottiePath.REGISTRATION, repeat: false, height: 150),
        Center(
          child: Text(
            AppString.SIGN_UP.toUpperCase(),
            style: titleTextStyle(color: AppColor.white),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpForm() {
    return const Expanded(
      child: RoundedContainer(
        child: _SignUpForm(),
      ),
    );
  }
}

class _SignUpForm extends StatelessWidget {
  const _SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppStyle.defaultSpacing),
          const _UsernameInput(),
          const SizedBox(height: 10),
          const _PasswordInput(),
          const SizedBox(height: 10),
          const _RepeatPasswordInput(),
          const SizedBox(height: 30),
          const _LicenseText(),
          const SizedBox(height: 40),
          const _SubmitButton(),
          const SizedBox(height: AppStyle.defaultSpacing),
          _buildLoginRow(),
        ],
      ),
    );
  }

  Widget _buildLoginRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text('Join us before?'),
        _LoginButton(),
      ],
    );
  }
}

