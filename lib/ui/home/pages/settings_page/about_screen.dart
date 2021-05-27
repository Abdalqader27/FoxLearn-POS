import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foxlearn_pos/app_theme/app_colors.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/custom_widgets/back_button.dart';
import 'package:foxlearn_pos/services/screen.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncer;

import 'components/elkood_card.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                CustomBackButton(),
                Text(
                  'حول التطبيق',
                  style: AppTextStyles.appBarTitle(),
                ),
                Spacer(),
              ],
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Screen.width(16)),
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(Screen.width(16)),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.2),
                              borderRadius:
                                  BorderRadius.circular(Screen.width(15))),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Padding(
                              padding: EdgeInsets.all(Screen.width(16)),
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    title: Text(' الإصدار 1.0  ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: Screen.width(17))),
                                    subtitle: null,
                                    trailing: SvgPicture.asset(
                                        "assets/icons/Iconly-Bulk-Info Circle.svg",
                                        width: Screen.width(28),
                                        color: AppColors.purple),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(Screen.width(8)),
                                    child: Divider(
                                        color: Colors.grey, height: 0.1),
                                  ),
                                  ListTile(
                                    title: Text(
                                      "التغييرات ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: Screen.width(17)),
                                    ),
                                    subtitle: null,
                                    trailing: SvgPicture.asset(
                                      "assets/icons/Iconly-Bulk-Shield-Done.svg",
                                      width: Screen.width(28),
                                      color: AppColors.purple,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(Screen.width(8)),
                                    child: Divider(
                                      color: Colors.grey,
                                      height: 0.1,
                                    ),
                                  ),
                                  ListTile(
                                    onTap: () {
                                      UrlLauncer.launch(
                                          'https://sites.google.com/view/getupprivacypolicy/home');
                                    },
                                    title: Text(
                                      "سياسة الخصوصية",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: Screen.width(17)),
                                    ),
                                    subtitle: null,
                                    trailing: SvgPicture.asset(
                                      "assets/icons/Iconly-Bulk-Unlock.svg",
                                      color: AppColors.purple,
                                      width: Screen.width(28),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Screen.height(8),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 18.0, left: 18.0, top: 18),
                                    child: Text(
                                      "© 2021 Get-Up Point of sale  Co. All rights reserved",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: Screen.width(12)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Screen.height(8),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                      child: Text(
                    "صمم وطوّر من قبل",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: Screen.width(18)),
                  )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Screen.height(16),
                        horizontal: Screen.width(32)),
                    child: ElkoodCard(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget coloredInfoCard(color, text, maxLines) => Container(
        margin: EdgeInsets.only(top: 6, left: 11, right: 5),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.all((13)),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    ' الإصدار 1.0 ',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                  subtitle: null,
                  trailing: SvgPicture.asset(
                    "assets/icons/Iconly-Bulk-Info Circle.svg",
                    color: AppColors.purple,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0, left: 18.0),
                  child: Divider(
                    color: Colors.grey,
                    height: 0.1,
                  ),
                ),
                ListTile(
                  title: Text(
                    "التغييرات ",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                  subtitle: null,
                  trailing: SvgPicture.asset(
                    "assets/icons/Iconly-Bulk-Shield-Done.svg",
                    color: AppColors.purple,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0, left: 18.0),
                  child: Divider(
                    color: Colors.grey,
                    height: 0.1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0, left: 18.0),
                  child: Divider(
                    color: Colors.grey,
                    height: 0.1,
                  ),
                ),
                ListTile(
                  onTap: () {
                    UrlLauncer.launch(
                        'https://sites.google.com/view/im-here-privacy-policy/home');
                  },
                  title: Text(
                    "سياسة الخصوصية",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                  subtitle: null,
                  trailing: SvgPicture.asset(
                    "assets/icons/Iconly-Bulk-Unlock.svg",
                    color: AppColors.purple,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 18.0, left: 18.0, top: 18),
                  child: Text(
                    "© 2021 Point Of Sales Co. All rights reserved",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
