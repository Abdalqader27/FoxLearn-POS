import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:foxlearn_pos/app_theme/app_colors.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/const/padding.dart';
import 'package:foxlearn_pos/custom_widgets/custom_neumorphic.dart';
import 'package:foxlearn_pos/custom_widgets/space_box.dart';
import 'package:foxlearn_pos/models/notification/notification.dart';
import 'package:foxlearn_pos/services/screen.dart';
import 'package:intl/intl.dart' as intl;


class NotificationCard extends StatelessWidget {
  final NotificationModel? notification;
  final VoidCallback? onTap;
  final bool? old;

  const NotificationCard({Key? key, this.notification, this.old = false, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context);
    return CustomNeumorphic(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Container(
                width: Screen.width(95),
                color: AppColors.cardYellow,
                padding: EdgeInsets.symmetric(vertical: AppPadding.p16, horizontal: AppPadding.p8),
                child: Padding(
                  padding: Device.get().isTablet
                      ? const EdgeInsets.all(AppPadding.p8)
                      : const EdgeInsets.all(0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
                    child: Center(
                      child: Text(
                        !old! ? _formatDate(notification!.date!) : _formatLongDate(notification!.date!),
                        style: AppTextStyles.small().copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      notification!.title!,
                      textAlign: TextAlign.right,
                      style: AppTextStyles.medium().copyWith(fontWeight: FontWeight.bold),
                    ),
                    SpaceBox(
                      height: 8,
                    ),
                    Text(
                      notification!.body!,
                      textAlign: TextAlign.right,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.small().copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  _formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);

    return intl.DateFormat.Hm().format(dateTime);
  }

  _formatLongDate(String date) {
    DateTime dateTime = DateTime.parse(date);

    return intl.DateFormat.yMMMd().format(dateTime);
  }
}
