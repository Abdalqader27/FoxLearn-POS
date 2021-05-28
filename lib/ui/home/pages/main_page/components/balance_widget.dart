import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/custom_widgets/char_card.dart';
import 'package:foxlearn_pos/custom_widgets/earnings_amount_card.dart';
import 'package:foxlearn_pos/models/user/user.dart';

class BalanceWidget extends StatelessWidget {
  final User? userInfo;
  const BalanceWidget({Key? key, this.userInfo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: CharCard(
                codes: userInfo!.count??0,
                unpaidCodes: userInfo!.receivedCodes!,
                color: Theme.of(context).colorScheme.surface,
                title: AppStrings.FINANCIAL_ACTIVITY,
              ),
            ),
            SizedBox(
              width: 32,
            ),
            Expanded(
              child: EarningsAmountCard(
                earningsAmount:
                    userInfo!.netProfit != null ? userInfo!.netProfit.toString() : '0.0',
              ),
            )
          ],
        ),
      ),
    );
  }
}
