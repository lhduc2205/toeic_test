part of login_view;

class _GoogleLoginButton extends StatelessWidget {
  const _GoogleLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      onPressed: () {},
      primaryColor: kNormalText,
      borderColor: kNormalText,
      isOutlinedButton: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageRasterPath.googleLogo, width: 20),
          const SizedBox(width: 10),
          Text(
            'Continue with Google',
            style: buttonTextStyle(
              color: kBlack,
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}