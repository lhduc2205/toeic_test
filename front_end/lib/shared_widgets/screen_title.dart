import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end/core/value/constants/app_constants.dart';
import 'package:front_end/core/value/theme/theme.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _Animation(
          child: Text('Hi, $title', style: normalTextStyle(fontSize: 20)),
        ),
        _Animation(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage(ImageRasterPath.festival),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Animation extends StatelessWidget {
  const _Animation({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 500),
      builder: (BuildContext context, double val, Widget? child) {
        return Opacity(
          opacity: val,
          child: child,
        );
      },
      tween: Tween<double>(begin: 0, end: 1),
      child: child,
    );
  }
}
