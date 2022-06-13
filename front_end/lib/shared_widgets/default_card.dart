import 'package:flutter/material.dart';

import '../core/value/constants/app_constants.dart';

class DefaultCard extends StatelessWidget {
  const DefaultCard({
    Key? key,
    required this.header,
    required this.body,
    this.radius,
    this.padding,
    this.gradient,
    this.height,
    this.onTap,
  }) : super(key: key);

  final Widget header;
  final Widget body;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final Gradient? gradient;
  final double? height;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  // padding: EdgeInsets.symmetric(padding ?? AppStyle.defaultSpacing),
                  padding: padding ??
                      const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                  decoration: BoxDecoration(
                    gradient: gradient ?? AppColor.primaryGradientColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      header,
                      Column(
                        children: [
                          const Divider(
                            color: AppColor.white,
                          ),
                          const SizedBox(height: 5),
                          body,
                        ],
                      )
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
    );
  }
}
