part of login_view;

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
