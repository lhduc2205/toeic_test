import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/app/blocs/app/app_bloc.dart';
import 'package:front_end/app/modules/on_board/view/on_board_view.dart';
import 'package:front_end/app/modules/registration/view/registration_view.dart';
import 'package:front_end/app/config/route_generator.dart';

import '../core/value/theme/theme.dart';
import '../data/repository/auth_repository.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(key: key);

  final AuthRepository _authRepository;

  @override
  Widget build(BuildContext context) {
    _setTransparentStatusBar();

    return RepositoryProvider.value(
      value: _authRepository,
      child: BlocProvider(
        create: (_) => AppBloc(authRepository: _authRepository),
        child: const AppView(),
      ),
    );
  }

  _setTransparentStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.basic(context),
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

