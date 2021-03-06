library registration_view;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:formz/formz.dart';
import 'package:front_end/core/value/constants/app_constants.dart';
import 'package:front_end/core/theme/theme.dart';
import 'package:front_end/cubits/registration/registration_cubit.dart';
import 'package:front_end/data/repository/auth_repository.dart';
import 'package:front_end/shared_widgets/custom_input_field.dart';
import 'package:front_end/shared_widgets/button/default_button.dart';
import 'package:front_end/shared_widgets/rounded_container.dart';
import 'package:lottie/lottie.dart';

import '../../../shared_widgets/button/custom_text_button.dart';
import '../../../shared_widgets/default_gradient_container.dart';

part 'widgets/email_input.dart';

part 'widgets/password_input.dart';

part 'widgets/confirmed_password_input.dart';

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
        Lottie.asset(LottiePath.registration, repeat: false, height: 150),
        Center(
          child: Text(
            AppString.signUp.toUpperCase(),
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
        if (state.status.isSubmissionSuccess) {
          Navigator.of(context).pop();
        } else if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Sign Up Failure')),
            );
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const _EmailInput(),
          const SizedBox(height: 10),
          const _PasswordInput(),
          const SizedBox(height: 10),
          const _ConfirmedPasswordInput(),
          const SizedBox(height: 30),
          const _LicenseText(),
          const SizedBox(height: 40),
          const _SubmitButton(),
          SizedBox(height: AppStyle.defaultSpacing),
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
          style: smallTextStyle(
            color: AppColor.black,
          ),
        ),
        const _LoginButton(),
      ],
    );
  }
}
