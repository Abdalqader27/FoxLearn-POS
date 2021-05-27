import 'package:flutter/material.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/custom_widgets/custom_neumorphic.dart';


class NeumorphicTextCard extends StatelessWidget {
  final String? text;

  const NeumorphicTextCard({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) => CustomNeumorphic(
        child: Center(child: Text(text!, style: AppTextStyles.medium())),
      );
}
