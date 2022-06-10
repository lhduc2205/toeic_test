import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:front_end/app/core/value/constants/app_constants.dart';
import 'package:front_end/app/core/value/theme/theme.dart';
import 'package:front_end/app/shared_widgets/default_card.dart';
import 'package:front_end/app/shared_widgets/default_gradient_container.dart';

import '../../../shared_widgets/default_button.dart';
import '../../../shared_widgets/rounded_container.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultGradientContainer(
        child: Column(
          children: [
            Container(
              height: 30,
              child: const Center(
                child: Text('Home'),
              ),
            ),
            Expanded(
              child: RoundedContainer(
                radius: AppStyle.defaultBorderRadius,
                child: Container(
                  color: AppColor.white,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DefaultCard(
                          onTap: (){},
                          header: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Hot Topic',
                                style: titleTextStyle(
                                  color: AppColor.white,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'Animal world',
                                style: titleTextStyle(
                                  color: AppColor.white,
                                  fontSize: 35,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Try now',
                                    style: subTextStyle(
                                      color: AppColor.white,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          body: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Icon(
                                    IconlyLight.star,
                                    color: AppColor.white,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Animals',
                                    style: subTextStyle(color: AppColor.white),
                                  )
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Icon(
                                    IconlyLight.timeCircle,
                                    color: AppColor.white,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '45 min',
                                    style: subTextStyle(color: AppColor.white),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primary,
        elevation: 5,
        onPressed: () {},
        child: const Icon(IconlyBold.wallet),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // Widget get _bottomNavigationBar {
  Widget get _bottomNavigationBar {
    return AnimatedBottomNavigationBar(
      icons: const [
        IconlyBold.home,
        IconlyBold.profile,
      ],
      activeColor: AppColor.primary,
      elevation: 15,
      activeIndex: currentIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      onTap: (index) => setState(() => currentIndex = index),
      //other params
    );
  }
}
