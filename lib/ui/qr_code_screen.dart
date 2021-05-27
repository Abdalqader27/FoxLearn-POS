import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/custom_widgets/custom_neumorphic.dart';
import 'package:foxlearn_pos/custom_widgets/flat_neu_button.dart';
import 'package:foxlearn_pos/custom_widgets/space_box.dart';
import 'package:foxlearn_pos/services/screen.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeScreen extends StatelessWidget {
  final String? code;

  const QRCodeScreen({Key? key, this.code}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SpaceBox(
                  height: 16,
                ),
                Center(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        AppStrings.GENERATING_CODE_SUCCESS,
                        textStyle:
                            AppTextStyles.title().copyWith(color: Colors.black),
                        speed: Duration(milliseconds: 60),
                        textAlign: TextAlign.start,
                      )
                    ],
                    isRepeatingAnimation: false,
                    repeatForever: false,
                  ),
                ),
                SpaceBox(
                  height: 16,
                ),
                _buildTitle(AppStrings.CODE),
                SpaceBox(
                  height: 8,
                ),
                SizedBox(
                  height: Screen.height(60),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: CustomNeumorphic(
                          child: Center(
                            child: Text(
                              code!,
                              style: AppTextStyles.medium(),
                            ),
                          ),
                        ),
                      ),
                      SpaceBox(
                        width: 16,
                      ),
                      AspectRatio(
                        aspectRatio: 1,
                        child: FlatNeuButton.icon(
                          iconData: FontAwesomeIcons.copy,
                          onTap: _copyCodeToClipboard,
                          color: theme.accentColor.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                SpaceBox(
                  height: 16,
                ),
                _buildTitle(AppStrings.SCAN_CODE),
                SpaceBox(
                  height: 32,
                ),
                Center(
                  child: SizedBox(
                    height: Screen.height(300),
                    width: Screen.height(300),
                    child: CustomNeumorphic(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: QrImage(
                          data: code!,
                          version: QrVersions.auto,
                          size: Screen.size.width,
                        ),
                      ),
                    ),
                  ),
                ),
                SpaceBox(
                  height: 64,
                ),
                Center(
                  child: FlatNeuButton.title(
                    onTap: () => _onClickFinish(context),
                    text: AppStrings.FINISH,
                    color: theme.accentColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildTitle(String title) {
    return Text(title, style: AppTextStyles.listTitle());
  }

  _copyCodeToClipboard() {
    Clipboard.setData(ClipboardData(text: code));
  }

  void _onClickFinish(BuildContext context) {
    Navigator.of(context).pop();
  }
}
