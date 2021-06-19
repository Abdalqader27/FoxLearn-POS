import 'package:flutter/material.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/const/padding.dart';
import 'package:foxlearn_pos/custom_widgets/custom_neumorphic.dart';


class PackageDescription extends StatelessWidget {
  final String? description;

  const PackageDescription({Key? key, this.description}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Text(
        description!,
        style: AppTextStyles.medium(),
      ),
    );
  }
}
