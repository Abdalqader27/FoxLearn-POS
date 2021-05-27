import 'package:flutter/material.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/custom_widgets/custom_neumorphic.dart';
import 'package:foxlearn_pos/models/package/package.dart';
import 'package:foxlearn_pos/services/screen.dart';

class PackageDropDown extends StatelessWidget {
  final List<Package>? packages;
  final Function? onChange;
  final Package? selectedPackage;
  const PackageDropDown({
    Key? key,
    this.packages,
    this.onChange,
    this.selectedPackage,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      child: CustomNeumorphic(
        color: theme.scaffoldBackgroundColor,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButton<Package>(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  size: Screen.width(25),
                ),
                isExpanded: true,
                underline: SizedBox(),
                value: selectedPackage,
                items: List.generate(
                    packages!.length,
                    (index) => DropdownMenuItem(
                        value: packages![index],
                        child: Text(
                          packages![index].name!,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.medium(),
                        ))),
                onChanged: onChange as void Function(Package?)?),
          ),
        ),
      ),
    );
  }
}
