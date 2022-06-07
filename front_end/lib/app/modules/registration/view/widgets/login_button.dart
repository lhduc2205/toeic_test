part of registration_view;

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text(
        'Login',
        style: buttonTextStyle(
          color: AppColor.primary,
          fontSize: 14,
        ),
      ),
    );
  }
}
