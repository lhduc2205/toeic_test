import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/blocs/app/app_bloc.dart';
import 'package:front_end/config/route_generator.dart';
import 'package:front_end/core/theme/theme.dart';
import 'package:front_end/data/repository/auth_repository.dart';
import 'package:front_end/data/services/exam_service.dart';

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

    // RepositoryProvider.value(
    //   value: _authRepository,
    //   child: BlocProvider(
    //     create: (_) => AppBloc(authRepository: _authRepository),
    //     child: const AppView(),
    //   ),
    // ),

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => ExamService()),
      ],
      child: const AppView(),
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
