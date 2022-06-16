import 'package:flutter/material.dart';
import 'package:front_end/core/value/constants/app_constants.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                child: Hero(
                  tag: 'test-image',
                  child: Image.asset(
                    ImageRasterPath.festival,
                    height: 360,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                height: 300,
                color: AppColor.primary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
