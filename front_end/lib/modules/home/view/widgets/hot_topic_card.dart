part of home_view;

class _HotTopicCard extends StatelessWidget {
  const _HotTopicCard({
    Key? key,
    required this.exam,
    this.onTap,
    this.gradient,
  }) : super(key: key);

  final Exam exam;
  final Function()? onTap;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      height: 150.h,
      image: exam.image,
      gradient: gradient,
      header: _buildHeader(),
      body: _buildBody(),
      onTap: onTap,
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hot Topic',
                style: normalTextStyle(
                  color: AppColor.white1,
                ),
              ),
              Text(
                exam.title,
                style: titleTextStyle(
                  color: AppColor.white,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(5.w),
                decoration: BoxDecoration(
                  gradient: gradient ?? AppColor.primaryGradientColor,
                  border: Border.all(color: AppColor.white, width: 2.sp),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Try now',
                  style: smallTextStyle(
                    color: AppColor.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FaIcon(
              FontAwesomeIcons.tag,
              color: AppColor.white,
              size: 16.sp,
            ),
            SizedBox(width: 5.w),
            Text(
              exam.tag!,
              style: smallTextStyle(color: AppColor.white),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(
              IconlyLight.timeCircle,
              // color: AppColor.white,
              color: AppColor.white,
              size: 16.sp,
            ),
            SizedBox(width: 5.w),
            Text(
              '${exam.time} min',
              style: smallTextStyle(color: AppColor.white),
            )
          ],
        ),
      ],
    );
  }
}
