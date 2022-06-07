part of login_view;

class _GoogleLoginButton extends StatelessWidget {
  const _GoogleLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      onPressed: () {},
      primaryColor: AppColor.normalText,
      borderColor: AppColor.normalText,
      isOutlinedButton: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageRasterPath.GOOGLE_LOGO, width: 20),
          const SizedBox(width: 10),
          Text(
            'Continue with Google',
            style: buttonTextStyle(
              color: AppColor.black,
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
