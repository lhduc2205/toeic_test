part of login_view;

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status == FormzStatus.submissionInProgress) {
          return DefaultButton(
            buttonState: ButtonState.loading,
            onPressed: () {
            },
            child: Text(
              'Authenticating...',
              style: buttonTextStyle(),
            ),
          );
        } else {
          return DefaultButton(
            onPressed: () {
              context.read<LoginCubit>().logInWithCredentials();
            },
            child: Text(
              'Login',
              style: buttonTextStyle(),
            ),
          );
        }
      },
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Failed authentication'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Your email or password is incorrect. Please check again!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
