library home_view;

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:front_end/core/value/constants/app_constants.dart';
import 'package:front_end/core/value/theme/theme.dart';
import 'package:front_end/modules/detail/view/detail_view.dart';
import 'package:front_end/modules/home/view/widgets/exam_list.dart';
import 'package:front_end/shared_widgets/default_card.dart';
import 'package:front_end/shared_widgets/default_gradient_container.dart';
import 'package:front_end/shared_widgets/screen_title.dart';

import '../../../data/models/exam_model.dart';
import '../../../shared_widgets/default_button.dart';
import '../../../shared_widgets/rounded_container.dart';

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
                child: Material(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const ScreenTitle(title: 'Le Huynh Duc'),
                      const SizedBox(
                        height: 20,
                      ),
                      _HotTopicCard(
                        exam: ExamModel(
                          image: ImageRasterPath.animals,
                          tag: 'animal',
                          description: 'asdasd',
                          title: 'Animal world',
                          time: 45,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ExamList(exams: getExamList()),
                    ],
                  ),
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
