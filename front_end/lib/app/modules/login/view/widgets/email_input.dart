part of login_view;

class _EmailInput extends StatelessWidget {
  _EmailInput({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return CustomInputField(
          controller: controller,
          suffixIcon: IconlyLight.profile,
          hintText: 'Email',
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
