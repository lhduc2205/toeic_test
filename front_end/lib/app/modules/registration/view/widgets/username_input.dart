part of registration_view;

class _UsernameInput extends StatelessWidget {
  const _UsernameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomInputField(
      hintText: 'Username',
      suffixIcon: IconlyLight.profile,
    );
  }
}
