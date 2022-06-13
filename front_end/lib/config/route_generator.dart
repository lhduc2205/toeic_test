import 'package:flutter/material.dart';
import 'package:front_end/modules/login/view/login_view.dart';
import 'package:front_end/modules/on_board/view/on_board_view.dart';

import '../modules/404/error_view.dart';
import '../modules/home/view/home_view.dart';
import '../modules/registration/view/registration_view.dart';
import '../shared_widgets/custom_page_route.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const OnBoardView());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeView());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginView());
      case '/registration':
        return CustomPageRoute(
          child: const RegistrationView(),
          direction: AxisDirection.up,
        );
      default:
        return MaterialPageRoute(builder: (_) => const ErrorView());
    }
  }
}
