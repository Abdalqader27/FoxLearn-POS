import 'package:flutter/material.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';

class PriceWidget extends StatelessWidget {
  final String? price;
  final TextStyle? priceStyle;
  final TextStyle? spStyle;

  const PriceWidget({Key? key, this.price, this.priceStyle, this.spStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) => RichText(
      textAlign: TextAlign.center,
      text: TextSpan(style: DefaultTextStyle.of(context).style, children: [
        TextSpan(
          text: price,
          style: priceStyle ?? AppTextStyles.medium().copyWith(fontWeight: FontWeight.bold),
        ),
        TextSpan(text: ' '),
        TextSpan(text: 'ل.س', style: spStyle ?? AppTextStyles.small()),
      ]));
}
