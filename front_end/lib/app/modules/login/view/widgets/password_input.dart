part of login_view;

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return CustomInputField(
          key: const Key('loginForm_passwordInput_textField'),
          obscureText: true,
          suffixIcon: IconlyLight.hide,
          hintText: 'Password',
          errorText: state.password.invalid ? 'invalid password' : null,
          fillColor: AppColor.inputFill,
          onChanged: (password) {
            context.read<LoginCubit>().passwordChanged(
                  password,
                );
          },
        );
      },
    );
  }
}
