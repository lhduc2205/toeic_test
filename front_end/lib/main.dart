import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/app/modules/app.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const TOEICTestApp()),
  );
}
