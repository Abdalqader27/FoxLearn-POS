import 'package:flutter/material.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/const/padding.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/custom_widgets/empty.dart';
import 'package:foxlearn_pos/custom_widgets/space_box.dart';
import 'package:foxlearn_pos/models/notification/notification_model.dart';
import 'package:foxlearn_pos/provider/app_provider.dart';
import 'package:foxlearn_pos/services/navigator.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import 'components/more_notifications_screen.dart';
import 'components/notification_screen_header.dart';
import 'components/notifications_list.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Selector<AppProvider, List<Item1>>(
          selector: (_, provider) => provider.todayNotifications,
          builder: (_, data, __) => Padding(
            padding: const EdgeInsets.symmetric(),
            child: Visibility(
              visible: data.isNotEmpty,
              replacement: Center(
                child: EmptyWidget(
                  type2: true,
                  text: AppStrings.EMPTY_NOTIFICATIONS_LIST,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    NotificationScreenHeader(),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                      child: Visibility(
                        visible: data.isNotEmpty,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppPadding.p32),
                              child: _buildTitleWithCount(
                                  AppStrings.TODAY_NOTIFICATIONS,
                                  data.length.toString()),
                            ),
                            NotificationsList(
                              scrollable: false,
                              old: false,
                              notifications: data,
                              onTapMore: () =>
                                  _seeMoreToday(context, data, false),
                            ),
                            SpaceBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildTitleWithCount(String title, String count) {
    return Row(
      children: [
        Text(title, style: AppTextStyles.listTitle()),
        SpaceBox(
          width: 4,
        ),
        Text('($count)', style: AppTextStyles.medium()),
      ],
    );
  }

  _seeMoreToday(
      BuildContext context, List<Item1> notifications, bool old) {
    AppNavigator.push(
        context,
        MoreNotificationsScreen(
          title: AppStrings.TODAY_NOTIFICATIONS,
          notifications: notifications,
          old: old,
        ));
  }

  _seeMoreOld(
      BuildContext context, List<Item1> notifications, bool old) {
    AppNavigator.push(
        context,
        MoreNotificationsScreen(
          old: old,
          title: AppStrings.OLD_NOTIFICATIONS,
          notifications: notifications,
        ));
  }
}
