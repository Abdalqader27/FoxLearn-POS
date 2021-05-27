import 'package:flutter/material.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/custom_widgets/custom_flat_button.dart';
import 'package:foxlearn_pos/custom_widgets/custom_neumorphic.dart';
import 'package:foxlearn_pos/custom_widgets/space_box.dart';
import 'package:foxlearn_pos/services/screen.dart';

class NeuAlertDialog extends StatelessWidget {
  final VoidCallback? onTapAccept;
  final String? alertText;
  const NeuAlertDialog({Key? key, this.onTapAccept, this.alertText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          width: Screen.size.width / 1.5,
          height: Screen.size.height / 5,
          child: CustomNeumorphic(
            color: theme.scaffoldBackgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  alertText!,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.medium()
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                SpaceBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomFlatButton(
                      color: theme.accentColor,
                      onTap: () {
                        Navigator.pop(context);
                        onTapAccept!();
                      },
                      title: AppStrings.ACCEPT,
                    ),
                    SpaceBox(
                      width: 16,
                    ),
                    CustomFlatButton(
                      color: theme.cardColor,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      title: AppStrings.CANCEL,
                      borderColor: theme.accentColor,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
