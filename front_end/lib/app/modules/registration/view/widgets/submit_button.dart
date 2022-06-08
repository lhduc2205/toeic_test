part of registration_view;

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if(state.status == RegistrationStatus.submitting) {
          return DefaultButton(
            buttonState: ButtonState.loading,
            onPressed: () { },
            child: Text(
              'Submitting...',
              style: buttonTextStyle(),
            ),
          );
        }
        return DefaultButton(
          key: const Key('signUpForm_continue_defaultButton'),
          onPressed: state.status.isValidated ? () {
            context.read<RegistrationCubit>().registerFormSubmitted();
          } : null,
          child: Text(
            AppString.submit,
            style: buttonTextStyle(),
          ),
        );
      },
    );
  }
}
