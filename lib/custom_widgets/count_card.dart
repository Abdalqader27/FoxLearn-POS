import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/const/padding.dart';
import 'package:foxlearn_pos/services/screen.dart';

import 'custom_neumorphic.dart';

class CountCard extends StatelessWidget {
  final String? title;
  final int? count;
  final Color? color;

  const CountCard({Key? key, this.title, this.count, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Divider(),
        Text(title!,
            textAlign: TextAlign.center, style: AppTextStyles.medium()),
        Divider(),
        SizedBox(height: Screen.height(8)),
        Text(count.toString(),
            textAlign: TextAlign.center,
            style: AppTextStyles.bigTitle().copyWith(
                color: Theme.of(context).colorScheme.secondaryVariant))
      ],
    ),
  );
}
