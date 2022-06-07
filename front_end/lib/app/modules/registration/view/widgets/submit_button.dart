part of registration_view;

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if(state.status == RegistrationStatus.submitting) {
          return const CircularProgressIndicator();
        }
        return DefaultButton(
          onPressed: () {
            context.read<RegistrationCubit>().registerFormSubmitted();
          },
          child: Text(
            AppString.SUBMIT,
            style: buttonTextStyle(),
          ),
        );
      },
    );
  }
}
