import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/const/padding.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/custom_widgets/custom_neumorphic.dart';
import 'package:foxlearn_pos/services/screen.dart';
import 'package:url_launcher/url_launcher.dart' as urLauncher;

class ForgetPasswordDialog extends StatelessWidget {
  final String number;

  const ForgetPasswordDialog({Key? key, this.number = '0933262651'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 32),
        height: Screen.size.height / 4,
        width: Screen.size.width,
        child: CustomNeumorphic(
          child: Column(
            children: [
              Spacer(),
              Text(
                AppStrings.CONTACT_TO_SUPPORT,
                style: AppTextStyles.medium()
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: TextButton.icon(
                  icon: Icon(
                    Icons.phone_in_talk_outlined,
                    color: theme.shadowColor,
                    size: Screen.width(25),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(theme.accentColor),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.all(AppPadding.p16)),
                  ),
                  label: Text(number,
                      style: AppTextStyles.medium().copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.shadowColor)),
                  onPressed: () {
                    urLauncher.launch('tel:<$number>');
                  },
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
