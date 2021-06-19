import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:foxlearn_pos/app_theme/app_colors.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/const/padding.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/custom_widgets/custom_flat_button.dart';
import 'package:foxlearn_pos/custom_widgets/empty.dart';
import 'package:foxlearn_pos/custom_widgets/space_box.dart';
import 'package:foxlearn_pos/provider/app_provider.dart';
import 'package:foxlearn_pos/provider/generate_code_provider.dart';
import 'package:foxlearn_pos/services/screen.dart';
import 'package:foxlearn_pos/ui/home/pages/code_generation_page/providers/TabBarProvider.dart';
import 'package:provider/provider.dart';

import '../../../../custom_widgets/custom_alert_dialog.dart';
import 'components/custom_tabbar.dart';
import 'pages/package_page.dart';

class CodeGenerationPage extends StatefulWidget {
  @override
  _CodeGenerationPageState createState() => _CodeGenerationPageState();
}

class _CodeGenerationPageState extends State<CodeGenerationPage>
    with SingleTickerProviderStateMixin {
  late final TextEditingController _discountNormalController;
  late final TextEditingController _discountOffersController;
  late final TabController _tabController;
  late List<Widget> _pages;

  @override
  void initState() {
    _discountNormalController = TextEditingController();
    final int initIndex =
        Provider.of<TabBarProvider>(context, listen: false).pageIndex;
    _tabController =
        TabController(length: 2, vsync: this, initialIndex: initIndex);
    _pages = [
      PackagesPage(
          controller: _discountNormalController),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    return Selector<TabBarProvider, bool>(
      selector: (_, provider) => provider.disable,
      builder: (_, disable, __) => IgnorePointer(
        ignoring: disable,
        child: LayoutBuilder(builder: (context, constrains) {
          return Column(
            children: [
              // Center(
              //   child: Container(
              //     margin: EdgeInsets.only(
              //         bottom: AppPadding.p16, top: AppPadding.p8),
              //     width: Screen.size.width / 1.5,
              //     height: Screen.height(45),
              //     child: CustomTabBar(
              //       tabController: _tabController,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: constrains.maxHeight - Screen.height(50) - 24,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Selector<TabBarProvider, int>(
                          selector: (_, provider) => provider.pageIndex,
                          builder: (_, index, __) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                AnimatedSwitcher(
                                    duration: Duration(milliseconds: 500),
                                    child: Container(
                                        key: Key(index.toString()),
                                        child: _pages[index])),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppPadding.p32),
                                  child: CustomFlatButton(
                                    onTap: () => _onClickOk(context),
                                    color: AppColors.fadedPurple,
                                    textStyle: AppTextStyles.medium(),
                                    title: AppStrings.GENERATE,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        SpaceBox(
                          height: 16,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    _discountNormalController.dispose();
    // _discountOffersController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _onClickOk(BuildContext context) async {
    int packageType = _tabController.index + 1;
    showDialog(
        context: context,
        builder: (_) => ChangeNotifierProvider.value(
              value: Provider.of<AppProvider>(context, listen: false),
              child: NeuAlertDialog(
                alertText: AppStrings.ARE_YOU_SURE,
                onTapAccept: () => _onTapAccept(context, packageType),
              ),
            ),
        barrierColor:
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6));
  }

  _onTapAccept(BuildContext context, int packageType) async {
    final code = await Provider.of<GenerateCodeProvider>(context, listen: false)
        .generateCode(packageType);
    if (code != null)
      Provider.of<AppProvider>(context, listen: false).insertCode(code);
  }
}
