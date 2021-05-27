import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/bloc/auth/auth_bloc.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/custom_widgets/error_snackbar.dart';
import 'package:foxlearn_pos/custom_widgets/flat_neu_button.dart';
import 'package:foxlearn_pos/services/api/network_expcepations/network_exceptions.dart';
import 'package:foxlearn_pos/services/screen.dart';
import 'package:foxlearn_pos/ui/login/components/forget_password_dialog.dart';
import 'package:foxlearn_pos/ui/login/components/login_form.dart';


mixin Login {
  final TextEditingController userNamedEditingController =
      TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  FocusNode? passwordNode;

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  Widget loginSection() {
    return Builder(
      builder: (context) => Column(
        children: [
          ///Login screen form
          LoginForm(
            formKey: formKey,
            passwordNode: passwordNode,
            passwordController: passwordEditingController,
            userNameController: userNamedEditingController,
          ),

          ///forget password  and remember password section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => _onClickForgetPassword(context),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(AppStrings.FORGET_PASSWORD,
                        style: AppTextStyles.small(),
                        textAlign: TextAlign.left),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: Screen.height(64)),
          Center(
            child: FlatNeuButton.title(
                onTap: () => _onClickOk(context),
                text: AppStrings.OK,
                color: Theme.of(context).accentColor),
          ),
        ],
      ),
    );
  }

  listenToState(BuildContext context, AuthState state) {
    if (state is LoginError) {
      String errorMessage =
          NetworkExceptions.getErrorMessage(state.networkExceptions);
      _showSnackBar(errorMessage);
    } else if (state is SecurityStampError) _showSnackBar(state.errorMessage);
  }

  _showSnackBar(String message) {
    scaffoldKey.currentState!.removeCurrentSnackBar();
    scaffoldKey.currentState!.showSnackBar(ErrorSnackBar(message: message));
  }

  _onClickOk(BuildContext context) {
    if (formKey.currentState!.validate()) {
      final userName = userNamedEditingController.text;
      final password = passwordEditingController.text;
      context.read<AuthBloc>().add(LoginEvent(userName, password));
    }
  }

  _onClickForgetPassword(BuildContext context) {
    showDialog(
        context: context,
        barrierColor: Theme.of(context).cardColor.withOpacity(0.9),
        builder: (_) => ForgetPasswordDialog());
  }
}
