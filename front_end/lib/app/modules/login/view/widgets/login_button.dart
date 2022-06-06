part of login_view;

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is FormSubmitting) {
          return const CircularProgressIndicator();
        } else {
          return DefaultButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                // context.read<LoginBloc>().add(
                //       LoginSubmitted(
                //         state.email,
                //         state.password,
                //       ),
                //     );
                print('asdasd');
              }
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
