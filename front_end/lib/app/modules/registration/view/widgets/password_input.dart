part of registration_view;

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomInputField(
      hintText: 'Password',
      suffixIcon: IconlyLight.lock,
    );
  }
}
