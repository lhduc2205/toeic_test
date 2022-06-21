import 'package:flutter/material.dart';
import 'package:front_end/core/value/constants/app_constants.dart';
import 'package:front_end/core/value/theme/theme.dart';
import 'package:front_end/data/models/exam_model.dart';
import 'package:front_end/shared_widgets/button/heart_icon_button.dart';

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
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.1),
            child: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            ),
          ),
          splashRadius: 20,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              child: Hero(
                tag: exam.tag.toString(),
                child: Image.asset(
                  // ImageRasterPath.festival,
                  exam.image,
                  height: 300,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            Text(exam.title, style: titleTextStyle(),),
            SizedBox(
              height: 300,
              child: HeartIconButton(),
            ),
            Container(
              height: 300,
              color: AppColor.white,
            ),
            Container(
              height: 300,
              color: AppColor.white,
            ),
          ],
        ),
      ),
    );
  }
}