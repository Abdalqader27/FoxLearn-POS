import 'package:flutter/material.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/custom_widgets/price_widget.dart';


class FinancialLimitWidget extends StatelessWidget {
  final String? price;

  const FinancialLimitWidget({Key? key, this.price}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(AppStrings.FINANCIAL_LIMIT,
              style:
                  AppTextStyles.medium().copyWith(fontWeight: FontWeight.w600)),
          PriceWidget(
            price: price,
            priceStyle: AppTextStyles.listTitle().copyWith(
              // color: theme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
            spStyle: AppTextStyles.listTitle().copyWith(
              // color: theme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
