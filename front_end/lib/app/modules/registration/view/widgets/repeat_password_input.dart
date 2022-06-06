part of registration_view;

class _RepeatPasswordInput extends StatelessWidget {
  const _RepeatPasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomInputField(
      hintText: 'Repeat password',
      suffixIcon: IconlyLight.lock,
    );
  }
}
