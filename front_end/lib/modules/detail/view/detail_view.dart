import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:front_end/core/value/constants/app_constants.dart';
import 'package:front_end/core/value/theme/theme.dart';
import 'package:front_end/data/models/exam_model.dart';
import 'package:front_end/shared_widgets/animation/opacity_animation.dart';
import 'package:front_end/shared_widgets/button/default_button.dart';
import 'package:front_end/shared_widgets/button/heart_icon_button.dart';
import 'package:front_end/shared_widgets/portforlio/portfolio_layout.dart';

class DetailView extends StatelessWidget {
  const DetailView({
    Key? key,
    required this.exam,
  }) : super(key: key);

  static const routeName = '/detail';
  final ExamModel exam;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 50.w,
        leading: CircleAvatar(
          backgroundColor: AppColor.white1.withOpacity(0.4),
          child: IconButton(
            splashRadius: 20,
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              FontAwesomeIcons.arrowLeft,
              color: AppColor.primary,
            ),
          ),
        ),
      ),
      body: Stack(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Hero(
            tag: exam.tag.toString(),
            child: Container(
              height: 150.h,
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
                  image: AssetImage(exam.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          OpacityAnimation(
            child: Container(
              margin: EdgeInsets.only(top: 130.h),
              padding: EdgeInsets.symmetric(
                horizontal: AppStyle.defaultSpacing * 2,
                vertical: AppStyle.defaultSpacing * 1.5,
              ),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                // color: AppColor.white,
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(25),
                  topRight: Radius.circular(
                    AppStyle.defaultBorderRadius,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PortfolioLayout(
                    label: exam.title,
                    action: HeartIconButton(),
                    portfolio: Text(
                      exam.description,
                      style: normalTextStyle(color: AppColor.black1),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: normalTextStyle(color: AppColor.primary, fontWeight: FontWeight.w800),
                          children: [
                            const TextSpan(text: 'Tag: '),
                            TextSpan(text: exam.tag, style: normalTextStyle(color: AppColor.primary)),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: normalTextStyle(color: AppColor.orange, fontWeight: FontWeight.w800),
                          children: [
                            const TextSpan(text: 'Time: '),
                            TextSpan(text: '${exam.time} min', style: normalTextStyle(color: AppColor.orange)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Example: ',
                    style: TextStyle(fontStyle: FontStyle.italic, color: AppColor.black),
                  ),
                  Card(
                    color: AppColor.inputFill,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(AppStyle.defaultSpacing),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: getExampleQuestion().map((Question question) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(question.question, style: const TextStyle(fontWeight: FontWeight.w600)),
                              const SizedBox(height: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: question.answer.map((Answer answer) {
                                  return GestureDetector(
                                    onTap: () {
                                      print(answer.answer);
                                    },
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Row(
                                        children: [
                                          Radio(
                                            value: answer.id,
                                            groupValue: 1,
                                            activeColor: AppColor.primary,
                                            onChanged: (dynamic value) {},
                                          ),
                                          Text(
                                            answer.answer,
                                            style: subTitleCardStyle(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const Spacer(),
                  DefaultButton(onPressed: () {}, child: const Text('Try now')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Question> getExampleQuestion() {
    return [
      Question(
        question: 'Do you like me?',
        rightAnswer: 1,
        answer: [
          Answer(1, answer: 'Yes'),
          Answer(2, answer: 'No, I love you'),
        ],
      )
    ];
  }
}

class Question {
  Question({required this.question, required this.answer, required this.rightAnswer});

  final String question;
  final List<Answer> answer;
  final int rightAnswer;
}

class Answer {
  Answer(this.id, {required this.answer});

  final int? id;
  final String answer;
}
