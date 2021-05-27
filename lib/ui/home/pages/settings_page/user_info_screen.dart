import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/custom_widgets/back_button.dart';
import 'package:foxlearn_pos/custom_widgets/neu_text_filed.dart';
import 'package:foxlearn_pos/custom_widgets/space_box.dart';
import 'package:foxlearn_pos/provider/app_provider.dart';

import 'package:provider/provider.dart';

class UserInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<AppProvider>(builder: (_, provider, __) {
          final user = provider.user!;
          return Column(
            children: [
              Row(
                children: [
                  CustomBackButton(),
                  Text(
                    'معلومات الحساب',
                    style: AppTextStyles.appBarTitle(),
                  ),
                  Spacer(),
                ],
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(32),
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            child: NeuTextFormFiled(
                              label: 'الاسم',
                              initialValue: user.firstName,
                              disable: true,
                            ),
                          ),
                          SpaceBox(
                            width: 12,
                          ),
                          Expanded(
                            child: NeuTextFormFiled(
                              label: 'الكنية',
                              disable: true,
                              initialValue: user.lastName,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (user.email!.isNotEmpty)
                      SpaceBox(
                        height: 16,
                      ),
                    if (user.email!.isNotEmpty)
                      NeuTextFormFiled(
                        label: 'البريد الالكتروني',
                        disable: true,
                        initialValue: user.email,
                        iconData: Icons.email_outlined,
                      ),
                    SpaceBox(
                      height: 16,
                    ),
                    NeuTextFormFiled(
                      label: 'اسم المستخدم',
                      initialValue: user.userName,
                      disable: true,
                      iconData: Icons.account_circle_outlined,
                    ),
                    SpaceBox(
                      height: 16,
                    ),
                    NeuTextFormFiled(
                      label: 'رقم الهاتف',
                      initialValue: user.phoneNumber,
                      disable: true,
                      iconData: Icons.phone_android_outlined,
                    ),
                    SpaceBox(
                      height: 16,
                    ),
                    NeuTextFormFiled(
                      label: 'العنوان',
                      initialValue: user.posAddress,
                      disable: true,
                      iconData: Icons.location_on_outlined,
                    ),
                    SpaceBox(
                      height: 16,
                    ),
                    NeuTextFormFiled(
                      label: 'الحد المالي',
                      initialValue: user.moneyLimit.toString(),
                      disable: true,
                      iconData: Icons.monetization_on_outlined,
                    ),
                    SpaceBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
