import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foxlearn_pos/bloc/auth/auth_bloc.dart';
import 'package:foxlearn_pos/const/padding.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/custom_widgets/custom_alert_dialog.dart';
import 'package:foxlearn_pos/custom_widgets/setting_tile.dart';
import 'package:foxlearn_pos/services/navigator.dart';
import 'package:foxlearn_pos/ui/home/pages/settings_page/user_info_screen.dart';
import 'package:provider/provider.dart';

import 'about_screen.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p32),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SettingTile(
              iconData: FontAwesomeIcons.user,
              onTap: () => _openScreen(context, UserInfoScreen()),
              title: AppStrings.ACCOUNT_INFO,
            ),
            SettingTile(
              iconData: FontAwesomeIcons.comment,
              onTap: () => _openScreen(context, AboutScreen()),
              title: AppStrings.ABOUT_APP,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: const Divider(
                height: 64,
              ),
            ),
            SettingTile(
              iconData: FontAwesomeIcons.signOutAlt,
              onTap: () => _signOut(context),
              disableArrow: true,
              title: AppStrings.LOGOUT,
            ),
          ],
        ),
      ),
    );
  }

  _openScreen(context, screen) {
    AppNavigator.push(context, screen);
  }

  _signOut(BuildContext context) {
    showDialog(
        context: context,
        barrierColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6),
        builder: (_) {
          return NeuAlertDialog(
            alertText: AppStrings.ARE_YOU_SURE,
            onTapAccept: () {
              context.read<AuthBloc>().add(LogoutEvent());
            },
          );
        });
  }
}
