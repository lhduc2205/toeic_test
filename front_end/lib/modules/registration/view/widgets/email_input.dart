part of registration_view;

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return CustomInputField(
          key: const Key('signUpForm_emailInput_textField'),
          hintText: 'Email',
          errorText: state.email.invalid ? AppErrorString.invalidEmail : null,
          suffixIcon: IconlyLight.message,
          onChanged: (email) {
            context.read<RegistrationCubit>().emailChanged(email);
          },
        );
      },
    );
  }
}
