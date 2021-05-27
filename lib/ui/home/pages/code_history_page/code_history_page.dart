import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/custom_widgets/code_card.dart';
import 'package:foxlearn_pos/custom_widgets/empty.dart';
import 'package:foxlearn_pos/provider/app_provider.dart';
import 'package:foxlearn_pos/ui/home/pages/main_page/components/code_history_widget.dart';
import 'package:provider/provider.dart';

class CodeHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (_, appProvider, __) => Column(
        children: [
          SizedBox(
            height: 16,
          ),
          CodeHistoryWidget(
            userInfo: appProvider.user,
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: appProvider.codesList.length != 0
                ? ListView.separated(
                    separatorBuilder: (_, __) => SizedBox(
                          height: 16,
                        ),
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    itemCount: appProvider.codesList.length,
                    itemBuilder: (_, index) {
                      return CodeCard(
                        code: appProvider.codesList[index],
                      );
                    })
                : Center(
                    child: EmptyWidget(
                      text: AppStrings.EMPTY_CODES_HISTORY,
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
