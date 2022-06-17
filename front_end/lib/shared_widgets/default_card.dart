import 'package:flutter/material.dart';

import '../core/value/constants/app_constants.dart';

class DefaultCard extends StatelessWidget {
  const DefaultCard(
      {Key? key,
      required this.header,
      required this.body,
      this.radius,
      this.padding,
      this.gradient,
      this.height,
      this.onTap,
      this.image})
      : super(key: key);

  final Widget header;
  final Widget body;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final Gradient? gradient;
  final double? height;
  final String? image;
  final Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 500),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (BuildContext context, double value, Widget? child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: Stack(
        children: [
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(
                radius ?? AppStyle.defaultBorderRadius,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                radius ?? AppStyle.defaultBorderRadius,
              ),
              child: Stack(
                children: [
                  Container(
                    height: height ?? 160,
                    decoration: BoxDecoration(
                      gradient: gradient ?? AppColor.primaryGradientColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeader(),
                        _buildDivider(),
                        _buildBody(),
                      ],
                    ),
                  ),
                  const Positioned(
                    top: 10,
                    right: 10,
                    child: CircleAvatar(
                      radius: 3,
                      backgroundColor: AppColor.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(
                  radius ?? AppStyle.defaultBorderRadius,
                ),
                onTap: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppStyle.defaultSpacing,
        ),
        decoration: image != null
            ? const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageRasterPath.animals),
                  fit: BoxFit.cover,
                  opacity: 0.15,
                ),
              )
            : null,
        child: header,
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppStyle.defaultSpacing,
        vertical: 10,
      ),
      child: body,
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: AppColor.white,
      height: 2,
      thickness: 0.2,
    );
  }
}
