library home_view;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:front_end/core/value/constants/app_constants.dart';
import 'package:front_end/core/theme/theme.dart';
import 'package:front_end/modules/home/view/widgets/exam_list.dart';
import 'package:front_end/shared_widgets/button/custom_icon_button.dart';
import 'package:front_end/shared_widgets/button/custom_text_button.dart';
import 'package:front_end/shared_widgets/default_card.dart';
import 'package:front_end/shared_widgets/portfolio/portfolio_layout.dart';
import 'package:front_end/shared_widgets/shimmer/basic_shimmer.dart';

import '../../../data/models/exam/exam.dart';
import '../../../shared_widgets/animation/opacity_animation.dart';
import '../../../shared_widgets/text/gradient_text.dart';
import '../../detail/view/detail_view.dart';

part 'widgets/hot_topic_card.dart';

part 'widgets/app_bar.dart';

part 'widgets/hot_topic_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        // physics: const NeverScrollableScrollPhysics(),
        slivers: [
          _buildSliverAppBar(),
          _buildBody(context),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      // centerTitle: true,
      floating: true,
      toolbarHeight: 60.h,
      title: const _AppBar(),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppStyle.defaultSpacing,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top),
                _HotTopicList(hotExams: hotExamList),
                SizedBox(height: 10.h),
                PortfolioLayout(
                  label: 'Exam list',
                  icon: FontAwesomeIcons.bookBookmark,
                  action: CustomTextButton(
                    child: const Text('View all'),
                    onPressed: () {},
                  ),
                  portfolio: ExamList(exams: examList),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Exam> get examList => [
        Exam(
          title: 'Daily Activity',
          tag: 'daily-activity',
          description: 'What are some of the daily activities that you do at home?',
          image: ImageRasterPath.festival,
          time: 45,
        ),
        Exam(
          title: 'Job',
          tag: 'job-1',
          description:
              'Your work or your study": Are you a student or a worker?asdasdasdasdasdasdasddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd',
          image: ImageRasterPath.animals,
          time: 25,
        ),
        Exam(
          title: 'Job',
          tag: 'job-2',
          description: 'Your work or your study": Are you a student or a worker?',
          image: ImageRasterPath.animals,
          time: 25,
        ),
      ];

  List<Exam> get hotExamList => [
        Exam(
          id: 1,
          image: ImageRasterPath.animals,
          tag: 'animal',
          description: 'asdasd',
          title: 'Animal world',
          time: 45,
        ),
        Exam(
          id: 2,
          image: ImageRasterPath.festival,
          tag: 'festival',
          description: 'adasdasd',
          title: 'World festival',
          time: 120,
        ),
      ];
}
