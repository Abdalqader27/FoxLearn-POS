import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/custom_widgets/neu_text_filed.dart';
import 'package:foxlearn_pos/services/screen.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController? userNameController;
  final TextEditingController? passwordController;
  final FocusNode? userNode;
  final FocusNode? passwordNode;
  final GlobalKey<FormState>? formKey;

  const LoginForm({
    Key? key,
    this.userNameController,
    this.passwordController,
    this.formKey,
    this.userNode,
    this.passwordNode,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: Screen.size.height * 0.05,
            ),
            Text(
              AppStrings.USER_NAME,
              style: AppTextStyles.medium(),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              height: Screen.height(8),
            ),
            NeuTextFormFiled(
              controller: userNameController,
              focusNode: passwordNode,
              iconData: FontAwesomeIcons.user,
              inputAction: TextInputAction.next,
              onTap: () {
                _resetForm();
              },
              onSubmit: (_) {
                _unFocus(context);
              },
              validator: _lengthValidate,
            ),
            SizedBox(
              height: Screen.height(16),
            ),
            Text(
              AppStrings.PASSWORD,
              style: AppTextStyles.medium(),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              height: Screen.height(8),
            ),
            NeuTextFormFiled(
              controller: passwordController,
              focusNode: passwordNode,
              iconData: Icons.lock_outline_rounded,
              obscure: true,
              inputAction: TextInputAction.send,
              onTap: () {
                _resetForm();
              },
              onSubmit: (_) {},
              validator: _lengthValidate,
            ),
            SizedBox(
              height: Screen.height(8),
            ),
          ],
        ),
      ),
    );
  }

  _resetForm() {
    // formKey.currentState.reset();
  }

  _unFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(passwordNode);
  }

  String? _lengthValidate(String? value) {
    if (value?.trim().length == 0) return AppStrings.INPUT_ERROR;
    return null;
  }
}
