import 'package:flutter/material.dart';
import 'package:front_end/app/core/value/constants/app_constants.dart';

AppBar customAppBar(BuildContext context,
    {Widget? title, IconData? backIcon, Function()? onTap}) {
  return AppBar(
    title: title,
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: GestureDetector(
      onTap: onTap ?? () => Navigator.of(context).pop(),
      child: CircleAvatar(
        backgroundColor: kInputFill,
        radius: 10,
        child: Icon(
          backIcon ?? Icons.arrow_back_ios_new,
          color: kPrimary,
        ),
      ),
    ),
  );
}
