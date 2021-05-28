import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foxlearn_pos/generated/assets.dart';
import 'package:foxlearn_pos/services/screen.dart';

class TopSectionImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Visibility(
      visible: !isLandscape,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                height: Screen.size.height * 0.12,
                color: theme.primaryColor,
              ),
              SizedBox(
                height: Screen.size.height * 0.012,
              ),
              Container(
                width: double.infinity,
                height: Screen.size.height * 0.025,
                color: theme.accentColor.withOpacity(0.5),
              ),
            ],
          ),

          ///Top image
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SvgPicture.asset(
                Assets.svgFox,
                height: Screen.height(200),
              ),
            ),
          )
        ],
      ),
    );
  }
}
