part of home_view;

class _HotTopicCard extends StatelessWidget {
  const _HotTopicCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      height: 150,
      image: ImageRasterPath.animals,
      onTap: () {},
      header: _buildHeader(),
      body: _buildBody(),
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
          'Animal world',
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
            const Icon(
              IconlyLight.star,
              color: AppColor.white,
              size: 20,
            ),
            const SizedBox(width: 5),
            Text(
              'Animal',
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
              '45 min',
              style: subTextStyle(color: AppColor.white),
            )
          ],
        ),
      ],
    );
  }
}


