import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:front_end/data/repository/auth_repository.dart';
import 'package:front_end/modules/app.dart';
import 'package:front_end/firebase_options.dart';

import 'blocs/bloc_observer.dart';

Future<void> main() {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await ScreenUtil.ensureScreenSize();

      final authRepository = AuthRepository();
      await authRepository.user.first;

      runApp(App(authRepository: authRepository));
    },
    blocObserver: AppBlocObserver(),
  );
}
