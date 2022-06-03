import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/auth_repository.dart';
import '../core/value/theme/theme.dart';
import 'login/view/login_view.dart';

class TOEICTestApp extends StatelessWidget {
  const TOEICTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.basic(context),
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: LoginView(),
      ),
    );
  }
}