part of home_view;

class _HotTopicCard extends StatelessWidget {
  const _HotTopicCard({Key? key, required this.exam}) : super(key: key);

  final ExamModel exam;

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      height: 150,
      image: exam.image,
      header: _buildHeader(),
      body: _buildBody(),
      onTap: () {},
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Hot Topic',
          style: titleTextStyle(
            color: AppColor.white,
            fontSize: 16,
          ),
        ),
        Text(
          exam.title,
          style: titleTextStyle(
            color: AppColor.white,
            fontSize: 30,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Try now',
              style: subTextStyle(
                color: AppColor.white,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const FaIcon(
              FontAwesomeIcons.tag,
              color: AppColor.white,
              size: 18,
            ),
            const SizedBox(width: 5),
            Text(
              exam.tag!,
              style: subTextStyle(color: AppColor.white),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Icon(
              IconlyLight.timeCircle,
              // color: AppColor.white,
              color: AppColor.white,
              size: 20,
            ),
            const SizedBox(width: 5),
            Text(
              '${exam.time} min',
              style: subTextStyle(color: AppColor.white),
            )
          ],
        ),
      ],
    );
  }
}


