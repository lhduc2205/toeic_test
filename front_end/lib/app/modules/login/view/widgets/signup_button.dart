part of login_view;

class _SignupButton extends StatelessWidget {
  const _SignupButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: const Key('loginForm_createAccount_textButton'),
      onPressed: () => Navigator.of(context).pushNamed('/registration'),
      child: const Text(
        AppString.signUp,
        style: TextStyle(color: AppColor.primary, fontWeight: FontWeight.bold),
      ),
    );
  }
}
