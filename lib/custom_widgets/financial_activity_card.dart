import 'package:flutter/material.dart';
import 'package:foxlearn_pos/app_theme/app_colors.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/custom_widgets/custom_neumorphic.dart';
import 'package:foxlearn_pos/custom_widgets/price_widget.dart';
import 'package:foxlearn_pos/services/screen.dart';
import 'package:intl/intl.dart' as intl;


class FinancialActivityCard extends StatelessWidget {
  final String? date;
  final String? money;

  const FinancialActivityCard({Key? key, this.date, this.money})
      : super(key: key);

  @override
  Widget build(BuildContext context) => CustomNeumorphic(
        depth: 2,
        intensity: 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  color: AppColors.cardYellow,
                  child: Center(
                      child: Icon(Icons.calendar_today_outlined,
                          size: Screen.width(16))),
                ),
                SizedBox(width: Screen.width(8)),
                Expanded(
                    child: Text(_formatLongDate(date!),
                        textAlign: TextAlign.right,
                        style: AppTextStyles.medium()
                            .copyWith(fontWeight: FontWeight.w600))),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  color: AppColors.cardYellow,
                  child: Center(
                      child: Icon(Icons.monetization_on_outlined,
                          size: Screen.width(16))),
                ),
                SizedBox(width: Screen.width(8)),
                PriceWidget(price: money),
              ],
            ),
          ],
        ),
      );

  _formatLongDate(String date) {
    DateTime dateTime = DateTime.parse(date);

    return intl.DateFormat.yMMMd().format(dateTime);
  }
}
