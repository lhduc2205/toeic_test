library registration_view;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:front_end/app/core/value/constants/app_constants.dart';
import 'package:front_end/app/core/value/theme/theme.dart';
import 'package:front_end/app/cubits/registration/registration_cubit.dart';
import 'package:front_end/app/data/repository/auth_repository.dart';
import 'package:front_end/app/shared_widgets/custom_input_field.dart';
import 'package:front_end/app/shared_widgets/default_button.dart';
import 'package:front_end/app/shared_widgets/rounded_container.dart';
import 'package:lottie/lottie.dart';

import '../../../shared_widgets/custom_text_button.dart';
import '../../../shared_widgets/default_gradient_container.dart';

part 'widgets/email_input.dart';

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
              _buildSignUpForm(context),
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

  Widget _buildSignUpForm(BuildContext context) {
    return Expanded(
      child: RoundedContainer(
        child: SingleChildScrollView(
          child: BlocProvider<RegistrationCubit>(
            create: (_) => RegistrationCubit(
              context.read<AuthRepository>(),
            ),
            child: const _SignUpForm(),
          ),
        ),
      ),
    );
  }
}

class _SignUpForm extends StatelessWidget {
  const _SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationCubit, RegistrationState>(
      listener: (context, state) {
        if (state.status == RegistrationStatus.error) {}
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppStyle.defaultSpacing),
          const _EmailInput(),
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
      children: [
        Text(
          'Join us before?',
          style: subTextStyle(
            color: AppColor.black,
          ),
        ),
        const _LoginButton(),
      ],
    );
  }
}
