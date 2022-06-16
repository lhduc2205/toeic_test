library home_view;

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:front_end/core/value/constants/app_constants.dart';
import 'package:front_end/core/value/theme/theme.dart';
import 'package:front_end/modules/detail/view/detail_view.dart';
import 'package:front_end/shared_widgets/default_card.dart';
import 'package:front_end/shared_widgets/default_gradient_container.dart';
import 'package:front_end/shared_widgets/screen_title.dart';

import '../../../shared_widgets/default_button.dart';
import '../../../shared_widgets/rounded_container.dart';

part 'widgets/hot_topic_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultGradientContainer(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Expanded(
              child: RoundedContainer(
                radius: AppStyle.defaultBorderRadius,
                child: Container(
                  color: AppColor.white,
                  child: SingleChildScrollView(
                    child: Material(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const ScreenTitle(title: 'Quiz'),
                          const _HotTopicCard(),
                          const SizedBox(height: 10),
                          ListTile(
                            title: Text('Daily activity'),
                            leading: Hero(
                              tag: 'test-image',
                              child: CircleAvatar(
                                backgroundColor: AppColor.primary,
                                backgroundImage: AssetImage(
                                  ImageRasterPath.festival,
                                ),
                              ),
                            ),
                            subtitle: Text('asd asdafv asdda ....'),
                            trailing: Text('Test'),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                DetailView.routeName,
                                arguments: DetailViewData(
                                  tag: 'test-image',
                                  image: ImageRasterPath.festival,
                                ),
                              );
                            },
                          ),
                          ListTile(
                            title: Text('Daily activity'),
                            leading: CircleAvatar(
                              backgroundColor: AppColor.primary,
                            ),
                            subtitle: Text('asd asdafv asdda ....'),
                          ),
                          ListTile(
                            title: Text('Daily activity'),
                            leading: CircleAvatar(
                              backgroundColor: AppColor.primary,
                            ),
                            subtitle: Text('asd asdafv asdda ....'),
                          ),
                          ListTile(
                            title: Text('Daily activity'),
                            leading: CircleAvatar(
                              backgroundColor: AppColor.primary,
                            ),
                            subtitle: Text('asd asdafv asdda ....'),
                          ),
                          ListTile(
                            title: Text('Daily activity'),
                            leading: CircleAvatar(
                              backgroundColor: AppColor.primary,
                            ),
                            subtitle: Text('asd asdafv asdda ....'),
                          ),
                          ListTile(
                            title: Text('Daily activity'),
                            leading: CircleAvatar(
                              backgroundColor: AppColor.primary,
                            ),
                            subtitle: Text('asd asdafv asdda ....'),
                          ),
                          ListTile(
                            title: Text('Daily activity'),
                            leading: CircleAvatar(
                              backgroundColor: AppColor.primary,
                            ),
                            subtitle: Text('asd asdafv asdda ....'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
