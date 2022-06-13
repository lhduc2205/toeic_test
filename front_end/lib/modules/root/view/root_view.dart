import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:front_end/cubits/bottom_navbar/bottom_navbar_cubit.dart';
import 'package:front_end/modules/home/view/home_view.dart';
import 'package:front_end/modules/profile/view/profile_view.dart';

import '../../../core/value/constants/app_constants.dart';
import 'package:front_end/cubits/bottom_navbar/index.dart';

class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BottomNavbarCubit(),
      child: Scaffold(
        // body: getPage(),
        body: _getPage(),
        bottomNavigationBar: _bottomNavigationBar,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primary,
          elevation: 5,
          onPressed: () {},
          child: const Icon(IconlyBold.wallet),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget get _bottomNavigationBar {
    return BlocBuilder<BottomNavbarCubit, BottomNavbarState>(
      builder: (context, state) =>
          AnimatedBottomNavigationBar(
            icons: const [
              IconlyBold.home,
              IconlyBold.profile,
            ],
            activeColor: AppColor.primary,
            elevation: 15,
            activeIndex: state.currentPageToInt(),
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.softEdge,
            onTap: (index) =>
                context.read<BottomNavbarCubit>().changePage(index),
            //other params
          ),
    );
  }

  Widget _getPage() {
    return BlocBuilder<BottomNavbarCubit, BottomNavbarState>(
      builder: (context, state) {
        return context.read<BottomNavbarCubit>().getPage();
      },
    );
  }

}
