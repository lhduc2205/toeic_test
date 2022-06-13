part of registration_view;

class _LicenseText extends StatelessWidget {
  const _LicenseText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: subTextStyle(),
        children: [
          const TextSpan(
              text: 'By signing up, you\'re agree to our '),
          TextSpan(
            text: 'Term & Conditions ',
            style: subTextStyle(color: AppColor.primary),
          ),
          const TextSpan(text: 'and '),
          TextSpan(
            text: 'Privacy Policy',
            style: subTextStyle(color: AppColor.primary),
          ),
        ],
      ),
    );
  }
}
