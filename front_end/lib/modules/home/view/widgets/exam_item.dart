part of home_view;

class _ExamItem extends StatelessWidget {
  const _ExamItem({Key? key, required this.exam}) : super(key: key);

  final Exam exam;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.94,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppStyle.defaultBorderRadius),
        ),
        color: Colors.white,
        elevation: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppStyle.defaultBorderRadius),
          child: InkWell(
            borderRadius: BorderRadius.circular(AppStyle.defaultBorderRadius),
            onTap: () {
              Navigator.pushNamed(
                context,
                DetailView.routeName,
                arguments: exam,
              );
            },
            child: _CardBody(exam: exam),
          ),
        ),
      ),
    );
  }
}

class _CardBody extends StatelessWidget {
  const _CardBody({Key? key, required this.exam}) : super(key: key);

  final Exam exam;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLeadingImage(context),
        _buildContent(context),
      ],
    );
  }

  Widget _buildLeadingImage(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.w),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 100.h,
          maxHeight: 100.h,
        ),
        child: _ImageHero(tag: exam.tag.toString(), image: exam.image),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 10.sp),
        height: 110.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    exam.title,
                    style: titleCardStyle(color: AppColor.black),
                  ),
                  Icon(Icons.favorite_border_outlined, size: 15.sp, color: Colors.grey[400]),
                  // Icon(Icons.favorite, size: 15, color: AppColor.red),
                ],
              ),
            ),
            const SizedBox(height: 3),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                exam.description,
                // softWrap: false,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: subTitleCardStyle(),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _SmallTextWithIcon(
                  icon: FontAwesomeIcons.tag,
                  primaryColor: AppColor.lightBlue,
                  text: exam.tag ?? 'None',
                ),
                _SmallTextWithIcon(
                  icon: Icons.access_time_outlined,
                  text: '${exam.time} min',
                  primaryColor: Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageHero extends StatelessWidget {
  const _ImageHero({
    Key? key,
    required this.tag,
    required this.image,
  }) : super(key: key);

  final String tag;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(AppStyle.defaultBorderRadius),
          border: Border.all(color: Colors.white),
        ),
      ),
    );
  }
}

class _SmallTextWithIcon extends StatelessWidget {
  const _SmallTextWithIcon({
    Key? key,
    required this.icon,
    required this.text,
    this.primaryColor,
    this.iconSize,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final Color? primaryColor;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: iconSize ?? 13.sp,
          color: primaryColor ?? AppColor.normalText,
        ),
        SizedBox(width: 5.w),
        Text(
          text,
          style: normalTextStyle(fontSize: 13.sp, color: primaryColor),
        )
      ],
    );
  }
}
