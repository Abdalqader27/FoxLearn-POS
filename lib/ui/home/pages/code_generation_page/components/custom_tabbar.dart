import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/custom_widgets/custom_neumorphic.dart';
import 'package:foxlearn_pos/services/screen.dart';
import 'package:foxlearn_pos/ui/home/pages/code_generation_page/providers/TabBarProvider.dart';
import 'package:provider/provider.dart';

class CustomTabBar extends StatelessWidget {
  final TabController? tabController;

  const CustomTabBar({Key? key, this.tabController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<TabBarProvider>(
      builder: (_, data, __) => Stack(
        fit: StackFit.expand,
        children: [
          CustomNeumorphic(),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: AnimatedAlign(
              curve: Curves.easeInCirc,
              duration: Duration(milliseconds: 300),
              alignment: data.pageIndex == 0
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                color: theme.primaryColor,
                width: Screen.size.width / 3,
              ),
            ),
          ),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 400),
            child: TabBar(
                controller: tabController,
                key: Key(data.pageIndex.toString()),
                onTap: (index) {
                  data.pageIndex = index;
                },
                labelPadding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero,
                indicatorColor: Colors.transparent,
                labelColor: Colors.white,
                unselectedLabelColor: theme.textTheme.bodyText2!.color,
                labelStyle: AppTextStyles.medium(),
                tabs: [
                  buildTabItem(
                    theme,
                    AppStrings.MAIN_PACKAGE,
                    0,
                    data.pageIndex,
                  ),
                  buildTabItem(
                    theme,
                    AppStrings.OFFER_PACKAGES,
                    1,
                    data.pageIndex,
                  )
                ]),
          ),
        ],
      ),
    );
  }

  buildTabItem(ThemeData theme, String title, int index, int pageIndex) {
    return SizedBox.expand(
        child: Center(
            child: Text(
      title,
      key: Key(title + index.toString()),
      style: AppTextStyles.medium().copyWith(
        fontWeight: FontWeight.w600,
      ),
    )));
  }
}
