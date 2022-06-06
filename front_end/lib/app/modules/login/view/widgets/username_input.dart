part of login_view;

class _UsernameInput extends StatelessWidget {
  const _UsernameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return CustomInputField(
          suffixIcon: IconlyLight.profile,
          hintText: 'Username',
          validator: (value) {
            if (state.isNullableEmail) {
              return AppErrorString.USERNAME_REQUIRED;
            } else {
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
}
