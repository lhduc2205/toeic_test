part of registration_view;

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return CustomInputField(
          hintText: 'Password',
          suffixIcon: IconlyLight.lock,
          onChanged: (password) {
            context.read<RegistrationCubit>().passwordChanged(password);
          },
        );
      },
    );
  }
}
