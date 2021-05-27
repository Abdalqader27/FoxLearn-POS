import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/custom_widgets/space_box.dart';


class ErrorSnackBar extends SnackBar {
  final String message;

  ErrorSnackBar({Key? key, required this.message})
      : super(
            content: Row(
          children: [
            Icon(
              FontAwesomeIcons.exclamationCircle,
              color: Colors.white,
            ),
            SpaceBox(width: 8),
            Text(message, style: AppTextStyles.medium())
          ],
        ));
}
