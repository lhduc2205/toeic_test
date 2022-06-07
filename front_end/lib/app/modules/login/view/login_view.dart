library login_view;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:front_end/app/core/value/constants/app_constants.dart';
import 'package:front_end/app/core/value/theme/theme.dart';
import 'package:front_end/app/repository/auth_repository.dart';
import 'package:front_end/app/shared_widgets/horizon_divider.dart';
import 'package:lottie/lottie.dart';

import '../../../shared_widgets/custom_input_field.dart';
import '../../../shared_widgets/default_button.dart';
import '../../../shared_widgets/default_gradient_container.dart';
import '../../../shared_widgets/rounded_container.dart';
import '../bloc/auth/form_submission_status.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

part 'widgets/username_input.dart';

part 'widgets/password_input.dart';

part 'widgets/signup_button.dart';

part 'widgets/login_button.dart';

part 'widgets/google_login_button.dart';

part 'widgets/forgot_password.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultGradientContainer(
        child: SafeArea(
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
      width: double.infinity,
      child: Center(
        child: Text(
          AppString.LOGIN,
          style: titleTextStyle(
            color: AppColor.white,
          ),
        ),
      ),
    );
  }

  Container _buildSecurityLottie() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppStyle.defaultSpacing,
      ),
      width: double.infinity,
      child: Lottie.asset(
        LottiePath.SECURITY,
        repeat: false,
        height: 150,
      ),
    );
  }

  Widget _buildLoginForm() {
    return Expanded(
      child: RoundedContainer(
        child: SingleChildScrollView(
          child: _LoginForm(),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  _LoginForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocProvider(
        create: (context) => LoginBloc(
          authRepo: context.read<AuthRepository>(),
        ),
        child: Column(
          children: [
            const SizedBox(height: AppStyle.defaultSpacing),
            const _UsernameInput(),
            const SizedBox(height: 10),
            const _PasswordInput(),
            const SizedBox(height: AppStyle.defaultSpacing),
            const _ForgotPassword(),
            const SizedBox(height: 40),
            _LoginButton(formKey: _formKey),
            const SizedBox(height: 50),
            const HorizonDivider(text: AppString.LOGIN_WITH_GOOGLE),
            const SizedBox(height: AppStyle.defaultSpacing),
            const _GoogleLoginButton(),
            const SizedBox(height: AppStyle.defaultSpacing),
            _signUpRow(),
          ],
        ),
      ),
    );
  }

  Widget _signUpRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(AppString.DONT_HAVE_ACCOUNT),
        _SignupButton(),
      ],
    );
  }
}
