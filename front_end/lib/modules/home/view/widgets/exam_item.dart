part of exam_list;

class _ExamItem extends StatelessWidget {
  const _ExamItem({Key? key, required this.exam}) : super(key: key);

  final ExamModel exam;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.94,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: Colors.white,
        elevation: 2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(5.0),
            onTap: () {
              Navigator.pushNamed(
                context,
                DetailView.routeName,
                arguments: DetailViewData(
                  tag: exam.tag.toString(),
                  image: exam.image,
                ),
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

  final ExamModel exam;

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
      padding: const EdgeInsets.all(5),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.22,
          maxHeight: MediaQuery.of(context).size.width * 0.22,
        ),
        child: _ImageHero(tag: exam.tag.toString(), image: exam.image),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    exam.title,
                    style: titleCardStyle(color: AppColor.black),
                  ),
                  Icon(Icons.favorite_border_outlined, size: 15, color: Colors.grey[400]),
                  // Icon(Icons.favorite, size: 15, color: AppColor.red),
                ],
              ),
            ),
            const SizedBox(height: 3),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                exam.description,
                // softWrap: false,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: subTitleCardStyle(),
              ),
            ),
            const SizedBox(height: 7),
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
          borderRadius: BorderRadius.circular(5),
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
          size: iconSize ?? 13,
          color: primaryColor ?? AppColor.normalText,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: normalTextStyle(fontSize: 13, color: primaryColor),
        )
      ],
    );
  }
}
