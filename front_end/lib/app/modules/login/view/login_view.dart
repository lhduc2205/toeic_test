library login_view;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:front_end/app/core/value/constants/app_constants.dart';
import 'package:front_end/app/core/value/theme/theme.dart';
import 'package:front_end/app/data/repository/auth_repository.dart';
import 'package:front_end/app/shared_widgets/horizon_divider.dart';
import 'package:lottie/lottie.dart';

import '../../../shared_widgets/custom_input_field.dart';
import '../../../shared_widgets/default_button.dart';
import '../../../shared_widgets/default_gradient_container.dart';
import '../../../shared_widgets/rounded_container.dart';
import '../../../cubits/login/login_cubit.dart';

part 'widgets/email_input.dart';

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
          AppString.login,
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
        LottiePath.security,
        height: 150,
      ),
    );
  }

  Widget _buildLoginForm() {
    return Expanded(
      child: RoundedContainer(
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => LoginCubit(context.read<AuthRepository>()),
            child: _LoginForm(),
          ),
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
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state.status == LoginStatus.error) {

        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: AppStyle.defaultSpacing),
            _EmailInput(),
            const SizedBox(height: 10),
            const _PasswordInput(),
            const SizedBox(height: AppStyle.defaultSpacing),
            const _ForgotPassword(),
            const SizedBox(height: 40),
            _LoginButton(formKey: _formKey),
            const SizedBox(height: 50),
            const HorizonDivider(text: AppString.loginWithGoogle),
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
        Text(AppString.dontHaveAccount),
        _SignupButton(),
      ],
    );
  }
}
