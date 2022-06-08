part of login_view;

class _GoogleLoginButton extends StatelessWidget {
  const _GoogleLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      key: const Key('loginForm_googleLogin_defaultButton'),
      onPressed: () => context.read<LoginCubit>().logInWithGoogle(),
      primaryColor: AppColor.normalText,
      borderColor: AppColor.normalText,
      isOutlinedButton: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageRasterPath.googleLogo, width: 20),
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
