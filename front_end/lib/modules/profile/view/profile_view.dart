import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/blocs/app/app_bloc.dart';
import 'package:front_end/blocs/auth/auth_bloc.dart';
import 'package:front_end/core/value/constants/app_constants.dart';
import 'package:front_end/cubits/login/login_cubit.dart';
import 'package:front_end/shared_widgets/custom_appbar.dart';
import 'package:front_end/shared_widgets/default_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: const Text('Log out'),
            onPressed: () {
              BlocProvider.of<AppBloc>(context).add(
                AppLogoutRequested(),
              );
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
          )
        ],
      ),
    );
  }
}
