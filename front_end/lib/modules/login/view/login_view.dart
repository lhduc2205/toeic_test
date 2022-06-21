library login_view;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:formz/formz.dart';
import 'package:front_end/core/value/constants/app_constants.dart';
import 'package:front_end/core/value/theme/theme.dart';
import 'package:front_end/data/repository/auth_repository.dart';
import 'package:front_end/shared_widgets/horizon_divider.dart';
import 'package:lottie/lottie.dart';

import '../../../shared_widgets/custom_input_field.dart';
import '../../../shared_widgets/button/custom_text_button.dart';
import '../../../shared_widgets/button/default_button.dart';
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
  _LoginForm({
    Key? key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          _showMyDialog(context);
        } else if (state.status.isSubmissionSuccess) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/root', (route) => false);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          _EmailInput(),
          const SizedBox(height: 10),
          const _PasswordInput(),
          const SizedBox(height: AppStyle.defaultSpacing),
          const _ForgotPassword(),
          const SizedBox(height: 30),
          _LoginButton(formKey: _formKey),
          const SizedBox(height: 20),
          const HorizonDivider(text: AppString.loginWithGoogle),
          const SizedBox(height: AppStyle.defaultSpacing),
          const _GoogleLoginButton(),
          const SizedBox(height: AppStyle.defaultSpacing),
          _signUpRow(),
        ],
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


  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Login Failed',
            style: titleTextStyle(color: AppColor.red),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                  'Your email or password is incorrect.\nPlease check and try again! ',
                ),
              ],
            ),
          ),
          actions: <Widget>[
            CustomTextButton(
              child: const Text('Try again'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
