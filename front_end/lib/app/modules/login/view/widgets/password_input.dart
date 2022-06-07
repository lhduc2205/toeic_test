part of login_view;

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return CustomInputField(
          obscureText: true,
          suffixIcon: IconlyLight.hide,
          hintText: 'Password',
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
