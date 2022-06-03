import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/auth/auth_repository.dart';

import 'auth/login/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: LoginView(),
      ),
    );
  }
}
