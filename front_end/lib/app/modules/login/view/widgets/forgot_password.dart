part of login_view;

class _ForgotPassword extends StatelessWidget {
  const _ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {

        },
        child: Text(
          AppString.FORGOT_PASSWORD,
          style: normalTextStyle(color: AppColor.primary),
        ),
      ),
    );
  }
}
