import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/const/padding.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/custom_widgets/custom_neumorphic.dart';
import 'package:foxlearn_pos/provider/app_provider.dart';
import 'package:foxlearn_pos/provider/bottom_nav_provider.dart';
import 'package:foxlearn_pos/services/navigator.dart';
import 'package:foxlearn_pos/services/screen.dart';
import 'package:foxlearn_pos/ui/notifications_screen/notifications_screen.dart';

import 'package:provider/provider.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({
    Key? key,
  }) : super(key: key);

  final List<String> imagesPaths = const [
    'assets/svg/home_screen_header.svg',
    'assets/svg/codes_history_screen_header.svg',
    'assets/svg/balance_screen_header.svg',
    'assets/svg/codes_generation_screen_header.svg',
    'assets/svg/notification_screen_header.svg',
  ];
  final List<String> titles = const [
    AppStrings.HOME,
    AppStrings.CODE_HISTORY,
    AppStrings.BALANCE,
    AppStrings.CODES_GENERATION,
    AppStrings.SITTING,
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<BottomNavProvider>(
      builder: (_, bottomNavProvider, __) {
        final pageIndex = bottomNavProvider.pageIndex;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: CustomNeumorphic(
            color: theme.scaffoldBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 200),
                        transitionBuilder: (child, animation) {
                          return ScaleTransition(scale: animation, child: child);
                        },
                        child: pageIndex == 0
                            ? RawMaterialButton(
                                onPressed: () => _openNotificationsScreen(context),
                                shape: CircleBorder(),
                                child: Icon(
                                  Icons.notifications_none_rounded,
                                  size: Screen.width(30),
                                ),
                              )
                            : SizedBox(),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 400),
                      child: Text(
                        titles[pageIndex],
                        key: Key(titles[pageIndex]),
                        style: AppTextStyles.title(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                        child: RawMaterialButton(
                      onPressed: () => _refreshData(context),
                      shape: CircleBorder(),
                      child: Icon(
                        Icons.refresh_rounded,
                        size: Screen.width(30),
                      ),
                    )),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _openNotificationsScreen(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    AppNavigator.push(
        context, ChangeNotifierProvider.value(value: appProvider, child: NotificationsScreen()));
  }

  _refreshData(BuildContext context) {
    Provider.of<AppProvider>(context, listen: false).getAppData();
  }

  // IconButton(
  // icon: Icon(
  // Icons.notifications_none_rounded,
  // size: Screen.width(25),
  // ),
  // padding: EdgeInsets.zero,
  // visualDensity: VisualDensity.standard,
  // onPressed: () => _openNotificationsScreen(context),
  // )
  //
  // IconButton(
  // icon: Icon(
  // Icons.refresh_rounded,
  // size: Screen.width(25),
  // ),
  // padding: EdgeInsets.zero,
  // onPressed: () => _refreshData(context),
  // ),
}
