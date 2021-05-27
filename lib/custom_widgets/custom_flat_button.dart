import 'package:flutter/material.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/const/padding.dart';

class CustomFlatButton extends StatelessWidget {
  final String? title;
  final Function? onTap;
  final Color? color;
  final Color? borderColor;
  final TextStyle? textStyle;

  const CustomFlatButton(
      {Key? key,
      this.title,
      this.onTap,
      this.color,
      this.borderColor,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                side: borderColor != null
                    ? BorderSide(color: borderColor!)
                    : BorderSide.none),
          ),
          padding:
              MaterialStateProperty.all(const EdgeInsets.all(AppPadding.p16)),
        ),
        onPressed: onTap as void Function()?,
        child: Text(
          title!,
          textAlign: TextAlign.center,
          style: textStyle ??
              AppTextStyles.medium().copyWith(color: theme.shadowColor),
        ));
  }
}
