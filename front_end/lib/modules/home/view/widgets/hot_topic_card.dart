part of home_view;

class _HotTopicCard extends StatelessWidget {
  const _HotTopicCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      onTap: () {},
      header: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hot Topic',
            style: titleTextStyle(
              color: AppColor.white,
              fontSize: 18,
            ),
          ),
          Text(
            'Animal world',
            style: titleTextStyle(
              color: AppColor.white,
              fontSize: 35,
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
      ),
      body: Row(
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
                'Animals',
                style: subTextStyle(color: AppColor.white),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(
                IconlyLight.timeCircle,
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
      ),
    );
  }
}
