part of registration_view;

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      onPressed: () {},
      child: Text(
        AppString.SUBMIT,
        style: buttonTextStyle(),
      ),
    );
  }
}
