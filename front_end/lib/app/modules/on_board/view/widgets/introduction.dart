part of on_board_view;

class _Introduction extends StatelessWidget {
  const _Introduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
        globalBackgroundColor: Colors.transparent,
        showSkipButton: true,
        dotsDecorator: _getDotDecorator(),
        pages: _getPages(),
        done: Text('Get start', style: buttonTextStyle()),
        next: Text(
          'Next',
          style: normalTextStyle(
            color: kPrimary,
            fontWeight: FontWeight.bold,
          )
        ),
        skip: Text('Skip', style: normalTextStyle()),
        doneStyle: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(kPrimary),
        ),
        onDone: _onDone(context));
  }

  List<PageViewModel> _getPages() {
    return [
      PageViewModel(
        title: 'Widen knowledge',
        body:
            'Now you can improve your English skill\n any time right from mobile.',
        image: _buildLottie(LottiePath.BOOK_LOADING),
        decoration: _getPageDecoration(),
      ),
      PageViewModel(
        title: 'Test your skills',
        body: 'Check your Listening and Reading skills\n whenever you want.',
        image: _buildLottie(LottiePath.QUIZ_MODE),
        decoration: _getPageDecoration(),
      ),
      PageViewModel(
        title: 'Achieve Certificate',
        body: 'Increase your ability to achieve\n your expected goals.',
        image: _buildLottie(LottiePath.CHECK_MARK, repeat: false),
        decoration: _getPageDecoration(),
      ),
    ];
  }

  Widget _buildLottie(String path, {bool repeat = true}) {
    return Center(
      child: Lottie.asset(path, width: 350, repeat: repeat),
    );
  }

  DotsDecorator _getDotDecorator() {
    return DotsDecorator(
      activeColor: kPrimary,
      color: kPrimary.withOpacity(0.15),
      spacing: const EdgeInsets.symmetric(horizontal: 3.0),
      size: const Size.square(12),
      activeSize: const Size.square(12),
    );
  }

  PageDecoration _getPageDecoration() {
    return PageDecoration(
        titleTextStyle: titleTextStyle(fontSize: 30, color: kBlack),
        bodyTextStyle: normalTextStyle());
  }

  Function()? _onDone(BuildContext context) {
    return () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/login',
        (route) => false,
      );
    };
  }
}
