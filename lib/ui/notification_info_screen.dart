import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/const/padding.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/custom_widgets/back_button.dart';
import 'package:foxlearn_pos/custom_widgets/custom_neumorphic.dart';
import 'package:foxlearn_pos/custom_widgets/space_box.dart';
import 'package:foxlearn_pos/models/notification/notification_model.dart';
import 'package:foxlearn_pos/services/screen.dart';
import 'package:intl/intl.dart';


class NotificationInfoScreen extends StatelessWidget {
  final Item1? notificationModel;

  const NotificationInfoScreen({Key? key, this.notificationModel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomBackButton(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p32),
              child: CustomNeumorphic(
                color: theme.accentColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Spacer(),
                      Text(
                        AppStrings.NOTIFICATIONS,
                        style: AppTextStyles.title(),
                      ),
                      Spacer(),
                      SvgPicture.asset(
                          'assets/svg/notification_info_header.svg'),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p32),
              child: Column(
                children: [
                  SpaceBox(
                    height: 16,
                  ),
                  Text(
                    notificationModel!.title!,
                    style: AppTextStyles.title(),
                  ),
                  SpaceBox(
                    height: 8,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Icon(
                          FontAwesomeIcons.calendar,
                          size: Screen.width(15),
                        ),
                        SpaceBox(
                          width: 4,
                        ),
                        Text(
                          _formatDate(notificationModel!.date!),
                          style: AppTextStyles.small()
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SpaceBox(
                    height: 32,
                  ),
                  Text(
                    notificationModel!.body!,
                    style: AppTextStyles.medium(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);

    return DateFormat.yMMMd().add_Hm().format(dateTime);
  }
}
