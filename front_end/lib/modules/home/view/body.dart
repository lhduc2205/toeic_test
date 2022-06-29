part of home_view;

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
    required this.exams,
    required this.hotExams,
  }) : super(key: key);

  final List<Exam> exams;
  final List<Exam> hotExams;

  @override
  Widget build(BuildContext context) {
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
                _HotTopicList(hotExams: hotExams),
                SizedBox(height: 15.h),
                _TagList(exams: exams),
                SizedBox(height: 10.h),
                _ExamList(exams: exams),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
