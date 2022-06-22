library exam_list;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:front_end/core/value/theme/theme.dart';

import '../../../../core/value/constants/app_constants.dart';
import '../../../../data/models/exam_model.dart';
import '../../../detail/view/detail_view.dart';

part 'exam_item.dart';

class ExamList extends StatefulWidget {
  ExamList({
    Key? key,
    required this.exams,
  }) : super(key: key);

  final List<ExamModel> exams;

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

    for (ExamModel exam in widget.exams) {
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
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index, animation) {
        print('INDEX: $index');
        return SlideTransition(
          position: animation.drive(_offset),
          child: _examTiles[index],
        );
      },
    );
  }
}


