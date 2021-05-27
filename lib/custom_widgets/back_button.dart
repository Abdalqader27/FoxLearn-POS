import 'package:flutter/material.dart';
import 'package:foxlearn_pos/const/padding.dart';
import 'package:foxlearn_pos/services/screen.dart';

class CustomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(
            left: AppPadding.p8,
            right: AppPadding.p32,
            bottom: AppPadding.p8,
            top: AppPadding.p8,
          ),
          child: RawMaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Icon(
              Icons.chevron_left,
              size: Screen.width(40),
            ),
            shape: CircleBorder(),
          ),
        ));
  }

  // IconButton(
  // icon: Icon(
  // Icons.chevron_left,
  // size: Screen.width(40),
  // ),
  // onPressed: () {
  // Navigator.pop(context);
  // })
}
