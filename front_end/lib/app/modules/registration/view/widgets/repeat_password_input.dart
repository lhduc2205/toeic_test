part of registration_view;

class _RepeatPasswordInput extends StatelessWidget {
  const _RepeatPasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      buildWhen: (previous, current) =>
          previous.passwordCheck != current.passwordCheck,
      builder: (context, state) {
        return CustomInputField(
          hintText: 'Repeat password',
          suffixIcon: IconlyLight.lock,
          onChanged: (password) {
            context.read<RegistrationCubit>().passwordCheckChanged(password);
          },
        );
      },
    );
  }
}
