part of login_view;

class _EmailInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return CustomInputField(
          key: const Key('loginForm_emailInput_textField'),
          keyboardType: TextInputType.emailAddress,
          suffixIcon: IconlyLight.profile,
          hintText: 'Email',
          errorText: state.email.invalid ? 'invalid email' : null,
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
