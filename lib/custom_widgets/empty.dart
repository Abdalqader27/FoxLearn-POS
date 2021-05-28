import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/custom_widgets/space_box.dart';
import 'package:foxlearn_pos/generated/assets.dart';
import 'package:foxlearn_pos/services/screen.dart';


class EmptyWidget extends StatelessWidget {
  final String? text;
  final bool type2;

  const EmptyWidget({Key? key, this.text, this.type2 = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(!type2 ? Assets.svgFox : Assets.svgFox, width: Screen.width(type2 ? 190 : 190)),
        SpaceBox(height: 16),
        Text(text!, textAlign: TextAlign.center, style: AppTextStyles.medium()),
      ],
    );
  }
}
