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
        if (state.status == LoginStatus.submitting) {
          return const CircularProgressIndicator();
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
}
