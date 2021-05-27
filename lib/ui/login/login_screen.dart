import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/bloc/auth/auth_bloc.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/custom_widgets/space_box.dart';
import 'package:foxlearn_pos/services/screen.dart';


import 'components/login.dart';
import 'components/top_section_image.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget with Login {
  @override
  Widget build(BuildContext context) => ScaffoldMessenger(
        key: scaffoldKey,
        child: Scaffold(
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SafeArea(
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  children: [
                    ///top section image and background
                    ///well be visible in portrait mode

                    TopSectionImage(),
                    SizedBox(height: Screen.size.height * 0.025),
                    Text(AppStrings.WELCOME,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.title()),
                    SizedBox(height: Screen.size.height * 0.025),
                    Text(AppStrings.LOGIN,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.medium()),
                    BlocConsumer<AuthBloc, AuthState>(
                        listener: listenToState,
                        builder: (context, state) {
                          if (state is LoadingState)
                            return SizedBox(
                                height: Screen.height(300),
                                child:
                                    Center(child: CircularProgressIndicator()));
                          else
                            return loginSection();
                        }),
                    SpaceBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
