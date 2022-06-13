part of registration_view;

class _ConfirmedPasswordInput extends StatelessWidget {
  const _ConfirmedPasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      buildWhen: (previous, current) =>
          previous.confirmedPassword != current.confirmedPassword,
      builder: (context, state) {
        return CustomInputField(
          key: const Key('signUpForm_confirmedPasswordInput_textField'),
          obscureText: true,
          hintText: 'Repeat password',
          errorText: state.confirmedPassword.invalid
              ? AppErrorString.dontMatchPassword
              : null,
          suffixIcon: IconlyLight.lock,
          onChanged: (password) {
            context.read<RegistrationCubit>().confirmedPasswordChanged(password);
          },
        );
      },
    );
  }
}
