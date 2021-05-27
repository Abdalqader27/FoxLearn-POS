import 'package:flutter/material.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/custom_widgets/custom_neumorphic.dart';
import 'package:foxlearn_pos/models/package/package.dart';
import 'package:foxlearn_pos/services/screen.dart';

class ImageTitleCard extends StatelessWidget {
  final Package? package;
  final Function? onTap;
  final Color? color;

  const ImageTitleCard({Key? key, this.onTap, this.color, this.package})
      : super(key: key);

  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap as void Function()?,
        child: CustomNeumorphic(
          intensity: 0.8,
          depth: 2,
          color: color ?? Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(package!.name!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppTextStyles.medium(),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: Screen.height(8),
                ),
                // Flexible(child: SvgPicture.asset(pa)),
                SizedBox(
                  height: Screen.height(8),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border:
                            Border.all(color: Theme.of(context).accentColor)),
                    child: Icon(Icons.arrow_forward,
                        size: Screen.width(15),
                        color: Theme.of(context).accentColor),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
