import 'package:flutter/material.dart';
import 'package:foxlearn_pos/app_theme/app_colors.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/const/padding.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/custom_widgets/custom_flat_button.dart';
import 'package:foxlearn_pos/custom_widgets/loading.dart';
import 'package:foxlearn_pos/services/screen.dart';


class LoadingDialog extends StatelessWidget {
  final String? loadingMessage;

  const LoadingDialog({Key? key, this.loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              height: Screen.size.height / 4,
              width: double.infinity,
              decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor, borderRadius: BorderRadius.all(Radius.circular(15))),
              margin: const EdgeInsets.all(AppPadding.p32),
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(loadingMessage!, style: AppTextStyles.medium().copyWith(fontWeight: FontWeight.w600)),
                    SizedBox(height: Screen.height(16)),
                    Flexible(child: Loading()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ErrorDialog extends StatelessWidget {
  final String? errorMessage;

  const ErrorDialog({Key? key, this.errorMessage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          height: Screen.size.height / 4,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          margin: const EdgeInsets.all(AppPadding.p32),
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Icon(
                Icons.warning_amber_rounded,
                size: Screen.width(50),
                color: Theme.of(context).errorColor,
              ),
              SizedBox(
                height: Screen.height(16),
              ),
              Text(
                errorMessage!,
                style: AppTextStyles.medium()
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Container(
                width: double.infinity,
                child: CustomFlatButton(
                  title: AppStrings.ACCEPT,
                  color: AppColors.fadedPurple,
                  textStyle: AppTextStyles.medium(),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
