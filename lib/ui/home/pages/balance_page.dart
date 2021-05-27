import 'package:flutter/material.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/const/padding.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/custom_widgets/empty.dart';
import 'package:foxlearn_pos/custom_widgets/financial_activity_card.dart';
import 'package:foxlearn_pos/custom_widgets/space_box.dart';
import 'package:foxlearn_pos/models/invoice/invoice.dart';
import 'package:foxlearn_pos/models/user/user.dart';
import 'package:foxlearn_pos/provider/app_provider.dart';
import 'package:foxlearn_pos/services/screen.dart';

import 'package:provider/provider.dart';

import '../pages/code_history_page/components/financial_limit_widget.dart';
import '../pages/main_page/components/balance_widget.dart';

class BalancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      final isPortrait = mediaQueryData.orientation == Orientation.portrait;
      return SingleChildScrollView(
        child: Container(
          height: isPortrait ? constraints.maxHeight : Screen.size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: Screen.height(16),
              ),
              Selector<AppProvider, User?>(
                selector: (_, data) => data.user,
                builder: (_, userInfo, __) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p32),
                      child: FinancialLimitWidget(
                        price: userInfo!.moneyLimit==0?'غير محدود':userInfo.moneyLimit.toString(),
                      ),
                    ),
                    SpaceBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p32),
                      child: BalanceWidget(
                        userInfo: userInfo,
                      ),
                    ),
                  ],
                ),
              ),
              SpaceBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p32),
                child: Text(
                  AppStrings.FINANCIAL_ACTIVITY_HISTORY,
                  textAlign: TextAlign.right,
                  style: AppTextStyles.listTitle(),
                ),
              ),
              SpaceBox(
                height: 8,
              ),
              Expanded(
                child: Selector<AppProvider, List<Invoice>>(
                  selector: (_, provider) => provider.invoices,
                  builder: (_, invoicesList, __) => Visibility(
                    visible: invoicesList.isNotEmpty,
                    replacement: EmptyWidget(
                      text: '',
                    ),
                    child: ListView.separated(
                        separatorBuilder: (_, __) => SpaceBox(
                              height: 16,
                            ),
                        padding: EdgeInsets.symmetric(
                            horizontal: AppPadding.p32,
                            vertical: AppPadding.p8),
                        itemCount: invoicesList.length,
                        itemBuilder: (_, index) {
                          return FinancialActivityCard(
                            date: invoicesList[index].invoiceDate,
                            money: invoicesList[index].paidValue.toString(),
                          );
                        }),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
