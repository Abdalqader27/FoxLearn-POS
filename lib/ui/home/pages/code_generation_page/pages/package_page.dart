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
import 'package:foxlearn_pos/models/package/package_type.dart';
import 'package:foxlearn_pos/provider/app_provider.dart';
import 'package:foxlearn_pos/provider/generate_code_provider.dart';
import 'package:foxlearn_pos/services/navigator.dart';
import 'package:provider/provider.dart';

import '../../../../package_content_screen.dart';
import '../components/package_description.dart';
import '../components/package_drop_down.dart';

class PackagesPage extends StatelessWidget {
  final TextEditingController? controller;
  final int packagesType;

  const PackagesPage(
      {Key? key, this.controller, this.packagesType = PackageType.NORMAL})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<GenerateCodeProvider>(
      builder: (_, generateCodeProvider, __) {
        final description =
            generateCodeProvider.getSelectedPackage(packagesType)!.description;
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
                height: 8,
              ),
              Selector<AppProvider, List<Package>>(
                selector: (_, provider) => packagesType == PackageType.NORMAL
                    ? provider.normalPackages
                    : provider.offersPackages,
                builder: (_, packages, __) {
                  return PackageDropDown(
                    packages: packages,
                    selectedPackage:
                        generateCodeProvider.getSelectedPackage(packagesType),
                    onChange: (package) {
                      generateCodeProvider.selectPackage(packagesType, package);
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
              CustomFlatButton(
                onTap: () => _showPackageContent(
                    context, generateCodeProvider, packagesType),
                color: AppColors.fadedPurple,
                textStyle: AppTextStyles.medium(),
                title: AppStrings.SHOW_PACKAGE_DETAILS,
              ),
              SpaceBox(
                height: 16,
              ),
              Divider(
                height: 2,
              ),
              SpaceBox(
                height: 16,
              ),
              _buildTextFiledWithTitle(AppStrings.DISCOUNT, controller,
                  generateCodeProvider.onChangeCount, packagesType),
              SpaceBox(
                height: 16,
              ),
              _buildTotalCard(
                  AppStrings.PRICE,
                  generateCodeProvider
                      .getSelectedPackage(packagesType)!
                      .price
                      .toString()),
              SpaceBox(
                height: 16,
              ),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: generateCodeProvider.getDiscount(packagesType).isNotEmpty
                    ? Column(
                        children: [
                          _buildTotalCard(
                              AppStrings.TOTAL_PRICE,
                              (generateCodeProvider
                                  .getDiscountedValue(packagesType))),
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
      Function(String, int) onChange, int type) {
    return Row(
      children: [
        Expanded(flex: 1, child: _buildTitle(title)),
        Expanded(
          flex: 3,
          child: NeuTextFormFiled(
            controller: controller,
            maxLength: 2,
            onChange: (value) {
              onChange(value, type);
            },
            inputType: TextInputType.number,
            iconData: null,
            inputFormatter: [FilteringTextInputFormatter.digitsOnly],
            suffixText: '%',
          ),
        ),
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

  _showPackageContent(BuildContext context,
      GenerateCodeProvider generateCodeProvider, int type) {
    final package = generateCodeProvider.getSelectedPackage(type);
    AppNavigator.push(
        context,
        PackageContent(
          package: package,
        ));
  }
}
