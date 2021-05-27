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
      {Key? key, required this.codes, required this.unpaidCodes, required this.title, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomNeumorphic(
      color: color ?? Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: AppTextStyles.medium(),
            ),
            SizedBox(
              height: Screen.height(8),
            ),
            CircularPercentIndicator(
              radius: Screen.width(85),
              lineWidth: Screen.width(8),
              percent: (codes - unpaidCodes) / codes,
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
        ),
      ),
    );
  }
}
