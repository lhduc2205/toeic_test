library exam_list;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:front_end/core/theme/theme.dart';
import 'package:front_end/shared_widgets/shimmer/basic_shimmer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/value/constants/app_constants.dart';
import '../../../../data/models/exam/exam.dart';
import '../../../detail/view/detail_view.dart';

part 'exam_item.dart';

class ExamList extends StatefulWidget {
  ExamList({
    Key? key,
    required this.exams,
  }) : super(key: key);

  final List<Exam> exams;

  @override
  State<ExamList> createState() => _ExamListState();
}

class _ExamListState extends State<ExamList> {
  final List<Widget> _examTiles = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final Tween<Offset> _offset = Tween(begin: const Offset(1, 0), end: const Offset(0, 0));

  @override
  void initState() {
    super.initState();
    _addExams();
  }

  void _addExams() {
    Future ft = Future(() {});

    for (Exam exam in widget.exams) {
      ft = ft.then((_) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          _examTiles.add(_ExamItem(exam: exam));
          _listKey.currentState?.insertItem(_examTiles.length - 1);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      initialItemCount: _examTiles.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      // primary: false,
      itemBuilder: (context, index, animation) {
        print('INDEX: $index');
        return SlideTransition(
          position: animation.drive(_offset),
          child: _examTiles[index],
        );
      },
    );
    // return BasicShimmer(
    //   child: Column(
    //     children: widget.exams.map((exam) => _ExamItem(exam: exam)).toList(),
    //   ),
    // );
  }
}
