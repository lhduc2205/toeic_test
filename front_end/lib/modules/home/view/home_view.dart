library home_view;

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:front_end/core/value/constants/app_constants.dart';
import 'package:front_end/core/value/theme/theme.dart';
import 'package:front_end/modules/home/view/widgets/exam_list.dart';
import 'package:front_end/shared_widgets/default_card.dart';
import 'package:front_end/shared_widgets/screen_title.dart';

import '../../../data/models/exam_model.dart';
import '../../../shared_widgets/text/app_title.dart';

part 'widgets/hot_topic_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 30),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: AppStyle.defaultSpacing,
                ),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ScreenTitle(title: 'Duc'),
                    const SizedBox(height: 20),
                    const _Label(text: 'Trending', icon: FontAwesomeIcons.fire, color: AppColor.orange),
                    const SizedBox(height: 10),
                    _HotTopicCard(
                      exam: ExamModel(
                        image: ImageRasterPath.animals,
                        tag: 'animal',
                        description: 'asdasd',
                        title: 'Animal world',
                        time: 45,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const _Label(text: 'Exam list', icon: FontAwesomeIcons.bookBookmark),
                    const SizedBox(height: 10),
                    ExamList(exams: getExamList()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<ExamModel> getExamList() {
    return [
      ExamModel(
        title: 'Daily Activity',
        tag: 'daily-activity',
        description: 'What are some of the daily activities that you do at home?',
        image: ImageRasterPath.festival,
        time: 45,
      ),
      ExamModel(
        title: 'Job',
        description: 'Your work or your study": Are you a student or a worker?',
        image: ImageRasterPath.animals,
        time: 25,
      ),
    ];
  }
}

class _Label extends StatelessWidget {
  const _Label({
    Key? key,
    required this.text,
    required this.icon,
    this.color,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(icon, color: color ?? AppColor.black1, size: 20),
        const SizedBox(width: 10),
        AppTitle(text: text, color: color ?? AppColor.black1),
      ],
    );
  }
}
