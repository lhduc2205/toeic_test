import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/app/modules/on_board/view/on_board_view.dart';
import 'package:front_end/app/modules/registration/view/registration_view.dart';
import 'package:front_end/route_generator.dart';

import '../repository/auth_repository.dart';
import '../core/value/theme/theme.dart';
import 'login/view/login_view.dart';

class TOEICTestApp extends StatelessWidget {
  const TOEICTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.basic(context),
      debugShowCheckedModeBanner: false,
      // home: RepositoryProvider(
      //   create: (context) => AuthRepository(),
      //   child: const OnBoardView(),
      // ),

      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
