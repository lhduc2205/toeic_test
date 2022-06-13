part of login_view;

class _PasswordInput extends StatefulWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  State<_PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<_PasswordInput> {
  bool isHidePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return CustomInputField(
          key: const Key('loginForm_passwordInput_textField'),
          obscureText: isHidePassword,
          suffixIcon: !isHidePassword ? IconlyLight.show : IconlyLight.hide,
          hintText: 'Password',
          errorText:
              state.password.invalid ? AppErrorString.shortPassword : null,
          fillColor: AppColor.inputFill,
          onChanged: (password) {
            context.read<LoginCubit>().passwordChanged(
                  password,
                );
          },
          onTapSuffixIcon: () => setState(
            () => isHidePassword = !isHidePassword,
          ),
        );
      },
    );
  }
}
