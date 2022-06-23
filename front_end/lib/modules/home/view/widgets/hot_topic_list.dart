part of home_view;

class _HotTopicList extends StatelessWidget {
  const _HotTopicList({Key? key, required this.hotExams}) : super(key: key);

  final List<ExamModel> hotExams;

  @override
  Widget build(BuildContext context) {
    return PortfolioLayout(
      label: 'Popular',
      icon: FontAwesomeIcons.fire,
      color: AppColor.orange,
      // portfolio: SingleChildScrollView(
      //   scrollDirection: Axis.horizontal,
      //   child: Row(
      //     children: hotExams
      //         .map(
      //           (exam) => _HotTopicCard(
      //             gradient: exam.id == 2 ? AppColor.blackGradientColor : null,
      //             exam: exam,
      //             onTap: () {
      //               Navigator.pushNamed(
      //                 context,
      //                 DetailView.routeName,
      //                 arguments: exam,
      //               );
      //             },
      //           ),
      //         )
      //         .toList(),
      //   ),
      // ),
      portfolio: BasicShimmer(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: Row(
            children: hotExams
                .map(
                  (exam) => _HotTopicCard(exam: exam, onTap: () {}),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
