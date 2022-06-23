import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BasicShimmer extends StatelessWidget {
  const BasicShimmer({Key? key, required this.child, this.baseColor, this.highlightColor}) : super(key: key);

  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey[300]!,
      highlightColor: highlightColor ?? Colors.grey[100]!,
      child: child,
    );
  }
}
