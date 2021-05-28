import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/custom_widgets/custom_neumorphic.dart';
import 'package:foxlearn_pos/services/screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CharCard extends StatelessWidget {
  final int codes;
  final int unpaidCodes;
  final String title;
  final Color? color;

  const CharCard(
      {Key? key,  this.codes=0,  this.unpaidCodes=0, required this.title, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Divider(),
        Text(
          title,
          style: AppTextStyles.medium(),
        ),
        Divider(),
        SizedBox(
          height: Screen.height(8),
        ),
        CircularPercentIndicator(
          radius: Screen.width(85),
          lineWidth: Screen.width(8),
          percent: (codes - unpaidCodes) / codes==0?0.0:1,
          animation: true,
          restartAnimation: false,
          animationDuration: 500,
          center: Text(
            '${codes - unpaidCodes}/$codes',
            style: AppTextStyles.medium(),
          ),
          backgroundColor: theme.highlightColor,
          progressColor: Theme.of(context).colorScheme.secondaryVariant,
        )
      ],
    );
  }
}
