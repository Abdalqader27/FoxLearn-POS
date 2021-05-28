import 'package:flutter/material.dart';
import 'package:foxlearn_pos/app_theme/app_colors.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/custom_widgets/count_card.dart';
import 'package:foxlearn_pos/models/user/user.dart';

class CodeHistoryWidget extends StatelessWidget {
  final User? userInfo;

  const CodeHistoryWidget({Key? key, this.userInfo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final MediaQueryData mediaQueryData = MediaQuery.of(context);
    // final isPortrait = mediaQueryData.orientation == Orientation.portrait;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: CountCard(
              title: AppStrings.SOLD_CODES_COUNT,
              color: AppColors.cardYellow,
              count: userInfo?.count,
            ),
          ),
          SizedBox(
            width: 32,
          ),
          Expanded(
            child: CountCard(
              title: AppStrings.RECEIVABLES_CODE,
              color: theme.colorScheme.surface,
              count: userInfo!.receivedCodes??0,
            ),
          ),
        ],
      ),
    );
  }
}
