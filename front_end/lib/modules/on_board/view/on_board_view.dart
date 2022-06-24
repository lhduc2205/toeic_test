library on_board_view;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:front_end/core/theme/theme.dart';
import 'package:front_end/shared_widgets/default_gradient_container.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import '../../../core/value/constants/app_constants.dart';

part 'widgets/main_bubble_background.dart';
part 'widgets/introduction.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildMainBubbleBg(),
          _buildConnerBubble(),
          _buildIntroductionBody(),
        ],
      ),
    );
  }

  Widget _buildIntroductionBody() {
    return const SafeArea(
      child: _Introduction(),
    );
  }

  Widget _buildMainBubbleBg() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      child: _MainBubbleBackground(),
    );
  }

  Widget _buildConnerBubble() {
    return Positioned(
      top: 0,
      left: 0,
      child: Image.asset(
        ImageRasterPath.bubble,
        width: 80,
        color: AppColor.inputFill,
      ),
    );
  }

  LinearGradient getGradientColor() {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF8AD4FF),
        AppColor.white,
      ],
    );
  }

}
