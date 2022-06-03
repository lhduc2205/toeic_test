part of login;

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
            const SizedBox(height: kSpacing * 2),
            _usernameField(),
            const SizedBox(height: 10),
            _passwordField(),
            const SizedBox(height: 40),
            _loginButton(),
            const SizedBox(height: 50),
            _loginWithGoogleDivider(),
            const SizedBox(height: kSpacing),
            _loginWithGoogleButton(),
            const SizedBox(height: kSpacing),
            _forgotPasswordText(),
            const SizedBox(height: kSpacing),
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return CustomInputField(
          suffixIcon: IconlyLight.message,
          hintText: 'Email',
          validator: (value) {
            if (state.isNullableEmail) {
              return AppErrorString.EMAIL_REQUIRED;
            }
            if (state.isInvalidEmail) {
              return AppErrorString.INVALID_EMAIL;
            }else {
              return null;
            }
          },
          onChanged: (value) => context.read<LoginBloc>().add(
                LoginUsernameChanged(email: value),
              ),
        );
      },
    );
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return CustomInputField(
          obscureText: true,
          suffixIcon: IconlyLight.hide,
          hintText: 'Password',
          fillColor: kInputFill,
          validator: (value) {
            if (state.isValidPassword) {
              return AppErrorString.SHORT_PASSWORD;
            }
            if (state.isNullablePassword) {
              return AppErrorString.PASSWORD_REQUIRED;
            } else {
              return null;
            }
          },
          onChanged: (value) => context.read<LoginBloc>().add(
                LoginPasswordChanged(password: value),
              ),
        );
      },
    );
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is FormSubmitting) {
          return const CircularProgressIndicator();
        } else {
          return DefaultButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // context.read<LoginBloc>().add(
                //       LoginSubmitted(
                //         state.email,
                //         state.password,
                //       ),
                //     );
                print('asdasd');
              }
            },
            child: const Text(
              'Login',
              style: TextStyle(color: kWhite),
            ),
          );
        }
      },
    );
  }

  Widget _loginWithGoogleDivider() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: kNormalText,
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'Login with Google',
          style: TextStyle(color: kNormalText),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 1,
            color: kNormalText,
          ),
        ),
      ],
    );
  }

  Widget _loginWithGoogleButton() {
    return DefaultButton(
      onPressed: () {},
      primaryColor: kNormalText,
      borderColor: kNormalText,
      isOutlinedButton: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageRasterPath.googleLogo, width: 20),
          const SizedBox(width: 10),
          const Text(
            'Continue with Google',
            style: TextStyle(color: kBlack),
          ),
        ],
      ),
    );
  }

  Widget _forgotPasswordText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\'t have an account?'),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Sign up',
            style: TextStyle(color: kPrimary, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
