part of on_board_view;

class _MainBubbleBackground extends StatelessWidget {
  const _MainBubbleBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageRasterPath.introductionBg,
      fit: BoxFit.cover,
      color: AppColor.inputFill,
    );
  }
}
