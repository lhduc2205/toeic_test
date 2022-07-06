part of home_view;

class _ExamList extends StatelessWidget {
  const _ExamList({
    Key? key,
    required this.exams,
  }) : super(key: key);
  final List<Exam> exams;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight) / 2.4;
    final double itemWidth = size.width / 2;

    return PortfolioLayout(
      label: 'Exams',
      icon: FontAwesomeIcons.bookBookmark,
      spacingUnderLabel: 0,
      action: CustomTextButton(
        child: const Text('View all'),
        onPressed: () {},
      ),
      portfolio: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        padding: EdgeInsets.zero,
        childAspectRatio: (itemWidth / itemHeight),
        children: exams.map((exam) => _ExamItem(exam: exam)).toList(),
      ),
    );
  }
}
