import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../core/value/constants/app_constants.dart';
import '../../../../data/models/exam_model.dart';
import '../../../../shared_widgets/custom_card_outlined.dart';
import '../../../detail/view/detail_view.dart';

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
          print('LENTH ${_examTiles.length}');
          _listKey.currentState?.insertItem(_examTiles.length - 1);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      initialItemCount: widget.exams.length - 2,
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

class _ExamItem extends StatelessWidget {
  const _ExamItem({Key? key, required this.exam}) : super(key: key);

  final ExamModel exam;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: CustomCardOutlined(
        child: ListTile(
          title: Text(exam.title),
          leading: Hero(
            tag: exam.tag.toString(),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    exam.image,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.white)
              ),
            ),
          ),
          subtitle: Text(
            exam.description,
            softWrap: false,
            overflow: TextOverflow.fade,
            maxLines: 1,
          ),
          // trailing: Row(
          //   children: [
          //     const Icon(Icons.access_time_outlined),
          //     const SizedBox(width: 5),
          //     Text(exam.time.toString())
          //   ],
          // ),
          onTap: () {
            Navigator.pushNamed(
              context,
              DetailView.routeName,
              arguments: DetailViewData(
                tag: exam.tag.toString(),
                image: exam.image,
              ),
            );
          },
        ),
      ),
    );
  }
}
