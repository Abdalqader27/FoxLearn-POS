import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/custom_widgets/custom_neumorphic.dart';
import 'package:foxlearn_pos/custom_widgets/price_widget.dart';
import 'package:foxlearn_pos/models/code/code.dart';
import 'package:foxlearn_pos/provider/app_provider.dart';
import 'package:foxlearn_pos/services/screen.dart';
import 'package:intl/intl.dart' as intl;

import 'package:provider/provider.dart';

import 'custom_alert_dialog.dart';

class CodeCard extends StatelessWidget {
  final Code code;

  const CodeCard({Key? key, required this.code}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        CustomNeumorphic(
          depth: 2,
          intensity: 0.9,
          // color: Theme.of(context).colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Text(code.packagesNames!.first,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.medium()
                                .copyWith(fontWeight: FontWeight.bold)),
                      ),
                      Flexible(
                        flex: 1,
                        child: Text(_formatDate("${code.dateCreated}"),
                            style: AppTextStyles.small()),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Screen.height(8)),
                Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                            onLongPress: () {
                              Clipboard.setData(ClipboardData(text: code.code));
                              Fluttertoast.showToast(
                                  msg: "تم نسخ الكود بنجاح",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  textColor: Colors.white,
                                  fontSize: Screen.width(18));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(code.code!,
                                  style: AppTextStyles.small()),
                            )),
                      ),
                      Row(
                        children: [
                          PriceWidget(price: code.price.toString()),
                          Visibility(
                            visible: code.dateActivated == null,
                            replacement: SizedBox(width: Screen.width(10)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                      child: Icon(Icons.delete_outline,
                                          color: Colors.redAccent
                                              .withOpacity(0.75),
                                          size: Screen.width(20)),
                                      onTap: () => _onTapDelete(context))),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 10,
          height: 10,
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: code.dateActivated != null
                  ? Colors.green
                  : theme.disabledColor),
        ),
      ],
    );
  }

  _onTapDelete(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6),
      builder: (_) => NeuAlertDialog(
        alertText: 'هل انت متأكد من حذف الكود؟',
        onTapAccept: () {
          Provider.of<AppProvider>(context, listen: false).removeCode(code);
        },
      ),
    );
  }

  _formatDate(String date) =>
      intl.DateFormat.yMMMd().format(DateTime.parse(date));
}
