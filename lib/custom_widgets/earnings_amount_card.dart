import 'package:flutter/material.dart';
import 'package:foxlearn_pos/app_theme/app_colors.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/custom_widgets/custom_neumorphic.dart';
import 'package:foxlearn_pos/custom_widgets/space_box.dart';

class EarningsAmountCard extends StatelessWidget {
  final String? earningsAmount;

  const EarningsAmountCard({Key? key, this.earningsAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Divider(),
      Text(AppStrings.EARNINGS_AMOUNT, style: AppTextStyles.medium()),
      Divider(),
      SpaceBox(height: 20,),
      Text(earningsAmount!,
          style: AppTextStyles.title().copyWith(
              color: Theme.of(context).colorScheme.secondaryVariant)),
      Text('ل.س', style: AppTextStyles.medium()),
    ],
  );
}
