part of login_view;

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return CustomInputField(
          suffixIcon: IconlyLight.profile,
          hintText: 'Username',
          onChanged: (email) {
            context.read<LoginCubit>().emailChanged(
                  email,
                );
          },
        );
      },
    );
  }
}
