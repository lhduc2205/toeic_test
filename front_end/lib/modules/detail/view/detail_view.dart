import 'package:flutter/material.dart';
import 'package:front_end/core/value/constants/app_constants.dart';
import 'package:front_end/shared_widgets/heart_icon_button.dart';

class DetailView extends StatelessWidget {
  const DetailView({
    Key? key,
    required this.tag,
    required this.imagePath,
  }) : super(key: key);

  static const routeName = '/detail';
  final String tag;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.1),
            child: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            ),
          ),
          splashRadius: 20,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              child: Hero(
                // tag: 'test-image',
                tag: tag,
                child: Image.asset(
                  // ImageRasterPath.festival,
                  imagePath,
                  height: 300,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            SizedBox(
              height: 300,
              child: HeartIconButton(),
            ),
            Container(
              height: 300,
              color: AppColor.white,
            ),
            Container(
              height: 300,
              color: AppColor.white,
            ),
          ],
        ),
      ),
    );
  }
}

class DetailViewData {
  DetailViewData({required this.tag, required this.image});

  final String tag;
  final String image;
}