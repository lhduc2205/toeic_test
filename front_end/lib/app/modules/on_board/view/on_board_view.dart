library on_board_view;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:front_end/app/core/value/theme/theme.dart';
import 'package:front_end/app/shared_widgets/default_gradient_container.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import '../../../core/value/constants/app_constants.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          showSkipButton: true,
          dotsDecorator: DotsDecorator(
              activeColor: kPrimary,
              color: kPrimary.withOpacity(0.15),
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              //
          ),
          pages: [
            PageViewModel(
              title: 'AAAAAAAAAA',
              body: 'asdasdasdasd',
              image: _buildLottie(LottiePath.BOOK_LOADING),
            ),
            PageViewModel(
              title: 'CCCCCCCC',
              body: 'asdasddfsfsdasdasd',
              image: _buildLottie(LottiePath.QUIZ_MODE),
            ),
            PageViewModel(
              title: 'BBBBBBBBB',
              body: 'dfsdfsdfsd',
              image: _buildLottie(LottiePath.CHECK_MARK, repeat: false),
            ),
          ],
          done: Text('Get start', style: buttonTextStyle()),
          next: Text('Next', style: subTextStyle(color: kPrimary)),
          skip: Text('Skip', style: subTextStyle()),
          doneStyle: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(kPrimary),
          ),
          onDone: () {},
        ),
      ),
    );
  }

  Widget _buildLottie(String path, {bool repeat = true}) {
    return Center(
      child: Lottie.asset(path, width: 350, repeat: repeat),
    );
  }
}
