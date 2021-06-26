import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:foxlearn_pos/app_theme/app_colors.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/const/padding.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/custom_widgets/custom_flat_button.dart';
import 'package:foxlearn_pos/custom_widgets/neu_text_filed.dart';
import 'package:foxlearn_pos/custom_widgets/space_box.dart';
import 'package:foxlearn_pos/models/package/package.dart';
import 'package:foxlearn_pos/provider/app_provider.dart';
import 'package:foxlearn_pos/provider/generate_code_provider.dart';
import 'package:foxlearn_pos/services/navigator.dart';
import 'package:provider/provider.dart';

import '../../../../package_content_screen.dart';
import '../components/package_description.dart';
import '../components/package_drop_down.dart';

class PackagesPage extends StatelessWidget {
  final TextEditingController? controller;

  const PackagesPage({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GenerateCodeProvider>(
      builder: (_, generateCodeProvider, __) {
        final description =
            generateCodeProvider.getSelectedPackage()!.description;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SpaceBox(
                height: 16,
              ),
              _buildTitle(AppStrings.PACKAGE_NAME),
              SpaceBox(
                height: 16,
              ),
              Selector<AppProvider, List<Package>>(
                selector: (_, provider) => provider.normalPackages,
                builder: (_, packages, __) {
                  return PackageDropDown(
                    packages: packages,
                    selectedPackage: generateCodeProvider.getSelectedPackage(),
                    onChange: (package) {
                      generateCodeProvider.selectPackage(package);
                    },
                  );
                },
              ),
              SpaceBox(
                height: 16,
              ),
              Visibility(
                visible: description?.isNotEmpty ?? false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildTitle(AppStrings.PACKAGE_DESCRIPTION),
                    SpaceBox(
                      height: 8,
                    ),
                    PackageDescription(
                      description: description,
                    ),
                    SpaceBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              SpaceBox(
                height: 16,
              ),
              // CustomFlatButton(
              //   onTap: () => _showPackageContent(
              //       context, generateCodeProvider),
              //   color: AppColors.fadedPurple,
              //   textStyle: AppTextStyles.medium(),
              //   title: AppStrings.SHOW_PACKAGE_DETAILS,
              // ),
              // SpaceBox(
              //   height: 16,
              // ),
              // Divider(
              //   height: 2,
              // ),
              // SpaceBox(
              //   height: 16,
              // ),
              // _buildTextFiledWithTitle(AppStrings.DISCOUNT, controller,
              //     generateCodeProvider.onChangeCount),
              Divider(),
              SpaceBox(
                height: 16,
              ),
              _buildTotalCard(AppStrings.PRICE,
                  generateCodeProvider.getSelectedPackage()!.price.toString()),
              SpaceBox(
                height: 16,
              ),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: generateCodeProvider.getDiscount().isNotEmpty
                    ? Column(
                        children: [
                          SpaceBox(
                            height: 16,
                          ),
                          _buildTotalCard(AppStrings.TOTAL_PRICE,
                              (generateCodeProvider.getDiscountedValue())),

                          SpaceBox(
                            height: 16,
                          ),
                        ],
                      )
                    : const SizedBox(),
              )
            ],
          ),
        );
      },
    );
  }

  _buildTitle(String title) {
    return Text(title, style: AppTextStyles.listTitle());
  }

  _buildTextFiledWithTitle(String title, TextEditingController? controller,
      Function(String, int) onChange) {
    return Row(
      children: [
        Expanded(flex: 1, child: _buildTitle(title)),
      ],
    );
  }

  _buildTotalCard(String title, String totalText) {
    return Row(
      children: [
        Expanded(flex: 1, child: _buildTitle(title)),
        Expanded(
          flex: 3,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              NeuTextFormFiled(
                initialValue: totalText,
                key: Key(totalText.toString()),
                disable: true,
              ),
              Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: Text(
                    'ل.س',
                    style: AppTextStyles.medium()
                        .copyWith(fontWeight: FontWeight.w600),
                  ))
            ],
          ),
        ),
      ],
    );
  }

  _showPackageContent(
      BuildContext context, GenerateCodeProvider generateCodeProvider) {
    final package = generateCodeProvider.getSelectedPackage();
    AppNavigator.push(
        context,
        PackageContent(
          package: package,
        ));
  }
}
