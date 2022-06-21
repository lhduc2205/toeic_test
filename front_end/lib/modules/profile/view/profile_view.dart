import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/blocs/app/app_bloc.dart';
import 'package:front_end/blocs/auth/auth_bloc.dart';
import 'package:front_end/core/value/constants/app_constants.dart';
import 'package:front_end/cubits/login/login_cubit.dart';
import 'package:front_end/shared_widgets/custom_appbar.dart';
import 'package:front_end/shared_widgets/button/default_button.dart';

import '../../../shared_widgets/rounded_avatar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({
    Key? key,
  }) : super(key: key);

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              // child: CircleAvatar(
              //   radius: MediaQuery.of(context).size.width / 4,
              //   backgroundImage: const AssetImage(ImageRasterPath.festival),
              // ),
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width / 4,
                backgroundImage: const AssetImage(ImageRasterPath.festival),
              ),
            ),
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
      ),
    );
  }
}

class ProfileData {
  ProfileData({required this.tag, required this.image});

  final String tag;
  final String image;
}
