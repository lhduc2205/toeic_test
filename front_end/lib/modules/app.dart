import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/blocs/app/app_bloc.dart';
import 'package:front_end/config/route_generator.dart';

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
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // designSize: const Size(720, 1280),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (ctx, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.basic(context),
        debugShowCheckedModeBanner: false,
        // home: FlowBuilder<AppStatus>(
        //   state: context.select((AppBloc bloc) => bloc.state.status),
        //   onGeneratePages: onGenerateAppViewPages,
        // ),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
