library bottom_navbar_cubit;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:front_end/modules/home/view/home_view.dart';

import '../../modules/profile/view/profile_view.dart';

part 'bottom_navbar_state.dart';

class BottomNavbarCubit extends Cubit<BottomNavbarState> {
  BottomNavbarCubit() : super(const BottomNavbarState());

  void changePage(int index) {
    switch (index) {
      case 0:
        emit(state.copyWith(currentPage: CurrentPage.home));
        break;
      case 1:
        emit(state.copyWith(currentPage: CurrentPage.profile));
        break;
    }
  }

  Widget getPage() {
    switch (state.currentPage) {
      case CurrentPage.home: return const HomeView();
      case CurrentPage.profile: return const ProfileView();
    }
  }
}
