part of home_view;

class _ExamList extends StatefulWidget {
  _ExamList({
    Key? key,
    required this.exams,
  }) : super(key: key);

  final List<Exam> exams;

  @override
  State<_ExamList> createState() => _ExamListState();
}

class _ExamListState extends State<_ExamList> {
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
    return PortfolioLayout(label: 'Exams',
      icon: FontAwesomeIcons.bookBookmark,
      action: CustomTextButton(
        child: const Text('View all'),
        onPressed: () {},
      ),
      portfolio: AnimatedList(
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
      ),
    );
  }
}
