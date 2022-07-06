library home_view;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:front_end/blocs/home/home_bloc.dart';
import 'package:front_end/core/value/constants/app_constants.dart';
import 'package:front_end/core/theme/theme.dart';
import 'package:front_end/cubits/bottom_navbar/bottom_navbar_cubit.dart';
import 'package:front_end/data/models/exam/exam.dart';
import 'package:front_end/data/services/exam_service.dart';
import 'package:front_end/modules/detail/view/detail_view.dart';
import 'package:front_end/shared_widgets/animation/opacity_animation.dart';
import 'package:front_end/shared_widgets/button/custom_icon_button.dart';
import 'package:front_end/shared_widgets/button/custom_text_button.dart';
import 'package:front_end/shared_widgets/button/default_button.dart';
import 'package:front_end/shared_widgets/chip/default_chip.dart';
import 'package:front_end/shared_widgets/default_card.dart';
import 'package:front_end/shared_widgets/chip/colored_choice_chip.dart';
import 'package:front_end/shared_widgets/portfolio/portfolio_layout.dart';
import 'package:front_end/shared_widgets/rounded_avatar.dart';
import 'package:front_end/shared_widgets/shimmer/basic_shimmer.dart';
import 'package:front_end/shared_widgets/text/gradient_text.dart';

part 'widgets/hot_topic_card.dart';

part 'widgets/app_bar.dart';

part 'widgets/hot_topic_list.dart';

part 'widgets/exam_list.dart';

part 'widgets/exam_item.dart';

part 'widgets/tag_list.dart';

part 'widgets/home_shimmer.dart';

part 'body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        RepositoryProvider.of<ExamService>(context),
      )..add(LoadApiEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if(state is HomeLoadingState) {
              return const _HomeShimmer();
              // return CustomScrollView(
              //   physics: const BouncingScrollPhysics(),
              //   slivers: [
              //     const _SliverAppBar(),
              //     _Body(exams: state.exams, hotExams: state.hotExams ?? []),
              //   ],
              // );
            }
            if(state is HomeLoadedState) {
              // return const _HomeShimmer();
              return CustomScrollView(
                // physics: const BouncingScrollPhysics(),
                slivers: [
                  const _SliverAppBar(),
                  _Body(exams: state.exams, hotExams: state.hotExams ?? []),
                ],
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}

class _SliverAppBar extends StatelessWidget {
  const _SliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      // centerTitle: true,
      floating: true,
      toolbarHeight: 60.h,
      title: const _AppBar(),
    );
  }
}
