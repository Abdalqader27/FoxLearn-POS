import 'package:flutter/material.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/custom_widgets/back_button.dart';
import 'package:foxlearn_pos/custom_widgets/space_box.dart';
import 'package:foxlearn_pos/models/notification/notification_model.dart';

import 'notification_circle.dart';
import 'notifications_list.dart';

class MoreNotificationsScreen extends StatelessWidget {
  final String? title;
  final List<Item1>? notifications;
  final bool? old;

  const MoreNotificationsScreen(
      {Key? key, this.title, this.notifications, this.old})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SpaceBox(
                  height: 16,
                ),
                NotificationCircleImage(),
                SpaceBox(
                  height: 16,
                ),
                Text(title!, style: AppTextStyles.title()),
                SpaceBox(
                  height: 8,
                ),
                Expanded(
                    child: NotificationsList(
                  all: true,
                  old: old,
                  notifications: notifications,
                )),
              ],
            ),
            CustomBackButton(),
          ],
        ),
      ),
    );
  }
}
