import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:foxlearn_pos/services/screen.dart';

class CustomSwitch extends StatelessWidget {
  final Function? onChange;
  final bool value;

  const CustomSwitch({Key? key, this.onChange, this.value = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return NeumorphicSwitch(
      value: value,
      onChanged: onChange as void Function(bool)?,
      isEnabled: true,
      style: NeumorphicSwitchStyle(
          activeThumbColor: theme.primaryColor,
          inactiveTrackColor: theme.primaryColor.withOpacity(0.2),
          inactiveThumbColor: theme.scaffoldBackgroundColor,
          activeTrackColor: theme.primaryColor.withOpacity(0.2)),
      height: Screen.height(30),
    );
  }
}
