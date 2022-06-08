part of registration_view;

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return CustomInputField(
          hintText: 'Username',
          suffixIcon: IconlyLight.message,
          onChanged: (email) {
            context.read<RegistrationCubit>().emailChanged(email);
          },
        );
      },
    );
  }
}
