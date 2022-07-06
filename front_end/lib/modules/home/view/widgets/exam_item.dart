part of home_view;

class _ExamItem extends StatelessWidget {
  const _ExamItem({Key? key, required this.exam}) : super(key: key);

  final Exam exam;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppStyle.defaultBorderRadius),
        side: const BorderSide(color: AppColor.grayBorder),
      ),
      color: Colors.white,
      elevation: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppStyle.defaultBorderRadius),
        child: _CardBody(exam: exam),
      ),
    );
  }
}

class _CardBody extends StatelessWidget {
  const _CardBody({Key? key, required this.exam}) : super(key: key);

  final Exam exam;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(exam.title, style: titleCardStyle()),
          const SizedBox(height: 3),
          Text(
            exam.description,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: subTitleCardStyle(),
          ),
          const SizedBox(height: 10),
          _SmallTextWithIcon(
            icon: Icons.question_mark,
            text: '${exam.questionQuantity} questions',
            primaryColor: AppColor.red,
          ),
          const SizedBox(height: 2),
          _SmallTextWithIcon(
            icon: IconlyLight.timeCircle,
            text: '${exam.time} min',
            primaryColor: Colors.green[800],
          ),
          const SizedBox(height: 10),
          Row(children: [DefaultChip(label: '#${exam.tag}', fontSize: 12)]),
          const Spacer(),
          DefaultButton(
            onPressed: () {
              Navigator.pushNamed(context, DetailView.routeName, arguments: exam);
            },
            isOutlinedButton: true,
            primaryColor: AppColor.primary,
            borderRadius: 10,
            child: const Text('Detail', style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
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
          style: normalTextStyle(fontSize: 13.sp),
        )
      ],
    );
  }
}
