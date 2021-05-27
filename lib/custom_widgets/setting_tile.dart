import 'package:flutter/material.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/const/padding.dart';
import 'package:foxlearn_pos/custom_widgets/custom_neumorphic.dart';
import 'package:foxlearn_pos/custom_widgets/space_box.dart';
import 'package:foxlearn_pos/services/screen.dart';

class SettingTile extends StatelessWidget {
  final IconData? iconData;
  final VoidCallback? onTap;
  final String? title;
  final bool disableArrow;
  const SettingTile({Key? key, this.iconData, this.onTap, this.title, this.disableArrow = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: AppPadding.p8),
        child: CustomNeumorphic(
          depth: 4,
          color: Theme.of(context).scaffoldBackgroundColor,
          intensity: 0.9,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: Row(
                  children: [
                    Icon(
                      iconData,
                      size: Screen.width(20),
                    ),
                    SpaceBox(
                      width: 16,
                    ),
                    if (disableArrow) Spacer(),
                    Text(
                      title!,
                      style: AppTextStyles.medium(),
                    ),
                    Spacer(),
                    if (!disableArrow)
                      Icon(
                        Icons.chevron_right,
                        size: Screen.width(20),
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
}
