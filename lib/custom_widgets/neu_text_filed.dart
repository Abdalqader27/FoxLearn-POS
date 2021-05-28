import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/custom_widgets/custom_neumorphic.dart';
import 'package:foxlearn_pos/services/screen.dart';

class NeuTextFormFiled extends StatelessWidget {
  final TextEditingController? controller;
  final Function? onSubmit;
  final Function? onTap;
  final Function? onTapIcon;
  final bool obscure;
  final bool autofocus;
  final bool errorState;
  final bool disable;
  final String? Function(String?)? validator;
  final Function? onChange;
  final IconData? iconData;
  final TextInputType? inputType;
  final FocusNode? focusNode;
  final String? initialValue;
  final String? suffixText;
  final String? label;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputAction? inputAction;

  NeuTextFormFiled(
      {Key? key,
      this.controller,
      this.onSubmit,
      this.validator,
      this.obscure = false,
      this.errorState = false,
      this.iconData,
      this.onTap,
      this.onChange,
      this.autofocus = false,
      this.inputAction,
      this.onTapIcon,
      this.inputType,
      this.focusNode,
      this.disable = false,
      this.initialValue,
      this.suffixText,
      this.maxLength,
      this.inputFormatter,
      this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      onFieldSubmitted: onSubmit as void Function(String)?,
      style: AppTextStyles.medium(),
      obscureText: obscure,
      focusNode: focusNode,
      initialValue: initialValue,
      enabled: !disable,
      controller: controller,
      textInputAction: inputAction,
      keyboardType: inputType,
      validator: validator,
      autofocus: autofocus,
      onTap: onTap as void Function()?,
      onChanged: onChange as void Function(String)?,
      maxLength: maxLength,
      inputFormatters: inputFormatter,
      decoration: InputDecoration(
          isDense: true,
          labelText: label,
          labelStyle: AppTextStyles.medium(),
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          suffixText: suffixText,
          suffixStyle:
              AppTextStyles.medium().copyWith(fontWeight: FontWeight.w600),
          counterText: '',
          prefixIcon: iconData != null
              ? Icon(
                  iconData,
                  size: Screen.width(25),
                  color: disable ? theme.textTheme.headline1!.color : null,
                )
              : null),
    );
  }
}
