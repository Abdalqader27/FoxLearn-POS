import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn_pos/app_theme/app_colors.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/const/padding.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/custom_widgets/custom_neumorphic.dart';
import 'package:foxlearn_pos/custom_widgets/space_box.dart';
import 'package:foxlearn_pos/generated/assets.dart';
import 'package:foxlearn_pos/provider/app_provider.dart';
import 'package:foxlearn_pos/provider/bottom_nav_provider.dart';
import 'package:foxlearn_pos/services/screen.dart';

import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'components/balance_widget.dart';
import 'components/code_history_widget.dart';
import 'components/quick_activation_list.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (_, appProvider, __) => ListView(
        padding: EdgeInsets.symmetric(vertical: 10
        ),
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          // Divider(color: AppColors.purple.withOpacity(.4),),

          // if (appProvider.fastPackages.isNotEmpty)
          //   StickyHeader(
          //     header: Container(
          //       color: Theme.of(context).scaffoldBackgroundColor,
          //       child: Column(
          //         children: [
          //           buildTitle(AppStrings.QUICK_ACTIVATION_TITLE, context, 3),
          //           SpaceBox(
          //             height: 15,
          //           ),
          //         ],
          //       ),
          //     ),
          //     content: SizedBox(
          //       height: Screen.height(150),
          //       width: double.infinity,
          //       child: QuickActivationList(),
          //     ),
          //   ),
          // Divider(color: AppColors.purple.withOpacity(.4),),

          Visibility(
            visible: appProvider.showHello,
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: ListTile(
                  title: Text(
                    "مرحبا بك  ",
                    style: AppTextStyles.medium(),
                  ),
                  subtitle: Text("يرجى تفقد سجل الأكواد و الرصيد المالي "),
                  leading: Container(
                      width: 40,
                      height: 100,
                      child: SvgPicture.asset(Assets.svgFox)),
                  trailing: IconButton(onPressed: (){
                    appProvider.changeShowHello(false);
                  },icon: Icon(Icons.close),),
                )),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: CustomNeumorphic(
              depth: 0.8,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Container(
                child: Column(
                  children: [
                    SpaceBox(
                      height: 15,
                    ),
                    buildTitle(AppStrings.CODES_HISTORY_TITLE, context, 1),
                    SpaceBox(
                      height: 15,
                    ),
                    // Divider(color: AppColors.purple.withOpacity(.4),),

                    CodeHistoryWidget(
                      userInfo: appProvider.user,
                    ),
                    SpaceBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Divider(color: AppColors.purple.withOpacity(.4),),


          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: CustomNeumorphic(
              depth: 0.8,

              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                children: [
                  SpaceBox(
                    height: 15,
                  ),
                  buildTitle(AppStrings.BALANCE_TITLE, context, 2),
                  SpaceBox(
                    height: 15,
                  ),
                  // Divider(color: AppColors.purple.withOpacity(.4),),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p32),
                    child: BalanceWidget(
                      userInfo: appProvider.user,
                    ),
                  ),
                  SpaceBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTitle(String title, BuildContext context, int pageIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: CustomNeumorphic(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
          child: Row(
            children: [
              Text(
                title,
                style: AppTextStyles.listTitle(),
                textAlign: TextAlign.right,
              ),
              Spacer(),
              InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  onTap: () {
                    Provider.of<BottomNavProvider>(context, listen: false)
                        .jumpToPage(pageIndex);
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(AppStrings.MORE,
                            style: AppTextStyles.medium()
                                .copyWith(fontWeight: FontWeight.w600)),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: Screen.width(15),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
