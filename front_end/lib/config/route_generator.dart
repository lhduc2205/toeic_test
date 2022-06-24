import 'package:flutter/material.dart';
import 'package:front_end/data/models/exam/exam.dart';
import 'package:front_end/modules/detail/view/detail_view.dart';
import 'package:front_end/modules/login/view/login_view.dart';
import 'package:front_end/modules/on_board/view/on_board_view.dart';
import 'package:front_end/modules/root/view/root_view.dart';

import '../modules/404/error_view.dart';
import '../modules/home/view/home_view.dart';
import '../modules/profile/view/profile_view.dart';
import '../modules/registration/view/registration_view.dart';
import '../shared_widgets/custom_page_route.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const RootView());
      case '/root':
        return MaterialPageRoute(builder: (_) => const RootView());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginView());
      case '/registration':
        return CustomPageRoute(
          child: const RegistrationView(),
          direction: AxisDirection.up,
        );
      case '/detail':
        args as Exam;
        return MaterialPageRoute(
          builder: (_) => DetailView(exam: args),
        );
      case '/profile':
        args as ProfileData;
        return MaterialPageRoute(
          builder: (_) => const ProfileView(),
        );
      default:
        return MaterialPageRoute(builder: (_) => const ErrorView());
    }
  }
}
