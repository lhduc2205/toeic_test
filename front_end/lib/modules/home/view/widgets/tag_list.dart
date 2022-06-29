part of home_view;

class _TagList extends StatelessWidget {
  const _TagList({Key? key, required this.exams}) : super(key: key);

  final List<Exam> exams;

  @override
  Widget build(BuildContext context) {
    return PortfolioLayout(
      label: 'Tags',
      icon: FontAwesomeIcons.tags,
      spacingUnderLabel: 10,
      portfolio: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: exams
              .map(
                (exam) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                  child: ColoredChoiceChip(
                    label: '#${exam.tag}',
                    primaryColor: exam.color ?? AppColor.primary,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
