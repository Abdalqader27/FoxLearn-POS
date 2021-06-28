import 'package:flutter/material.dart';
import 'package:foxlearn_pos/app_theme/app_colors.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/const/padding.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/custom_widgets/custom_flat_button.dart';
import 'package:foxlearn_pos/custom_widgets/notification_card.dart';
import 'package:foxlearn_pos/models/notification/notification_model.dart';
import 'package:foxlearn_pos/services/navigator.dart';


import '../../notification_info_screen.dart';

class NotificationsList extends StatelessWidget {
  final bool scrollable;
  final VoidCallback? onTapMore;
  final List<Item1>? notifications;
  final bool all;
  final bool? old;

  const NotificationsList(
      {Key? key,
      this.scrollable = true,
      this.onTapMore,
      this.notifications,
      this.all = false,
      this.old})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: all ? 1 : 0,
          child: ListView.separated(
              physics: scrollable
                  ? AlwaysScrollableScrollPhysics()
                  : NeverScrollableScrollPhysics(),
              separatorBuilder: (_, __) => SizedBox(
                    height: 16,
                  ),
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p32, vertical: AppPadding.p16),
              itemCount: all
                  ? notifications!.length
                  : (notifications!.length > 2 ? 2 : notifications!.length),
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return NotificationCard(
                  notification: notifications![index],
                  old: old,
                  onTap: () {
                    AppNavigator.push(
                        context,
                        NotificationInfoScreen(
                          notificationModel: notifications![index],
                        ));
                  },
                );
              }),
        ),
        Visibility(
          visible: (!all && notifications!.length > 2),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p32),
            child: CustomFlatButton(
              color: AppColors.fadedPurple,
              onTap: onTapMore,
              title: AppStrings.SEE_MORE,
              textStyle: AppTextStyles.small(),
            ),
          ),
        )
      ],
    );
  }
}
