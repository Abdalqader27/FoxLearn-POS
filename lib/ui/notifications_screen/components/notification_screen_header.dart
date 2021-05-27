import 'package:flutter/material.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/const/padding.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/custom_widgets/back_button.dart';
import 'package:foxlearn_pos/custom_widgets/space_box.dart';

import 'notification_circle.dart';

class NotificationScreenHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: AppPadding.p32),
          child: Column(
            children: [
              SpaceBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    AppStrings.NOTIFICATIONS,
                    style: AppTextStyles.title(),
                  ),
                  NotificationCircleImage(),
                ],
              ),
              SpaceBox(
                height: 16,
              ),
            ],
          ),
        ),
        CustomBackButton(),
      ],
    );
  }
}
