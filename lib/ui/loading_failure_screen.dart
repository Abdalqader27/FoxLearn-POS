import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/generated/assets.dart';
import 'package:foxlearn_pos/provider/app_provider.dart';
import 'package:foxlearn_pos/services/screen.dart';

import 'package:provider/provider.dart';

class FailureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset(
            Assets.svgFox,
            height: Screen.height(250),
          ),
          IconButton(
            icon: Icon(Icons.refresh_rounded, size: Screen.width(35)),
            onPressed: () => appProvider.getAppData(),
          ),
          SizedBox(height: Screen.height(16)),
          Text(
            appProvider.errorMessage!,
            textAlign: TextAlign.center,
            style: AppTextStyles.medium(),
          ),
        ],
      ),
    );
  }
}
