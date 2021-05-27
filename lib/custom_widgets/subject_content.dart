import 'package:flutter/material.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/const/padding.dart';
import 'package:foxlearn_pos/models/subject/subject.dart';
import 'package:foxlearn_pos/services/screen.dart';


class SubjectContent extends StatelessWidget {
  final Subject? subject;
  const SubjectContent({Key? key, this.subject}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          border:
              Border.all(width: 2, color: theme.primaryColor.withOpacity(0.5))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(AppPadding.p8),
            color: theme.primaryColor.withOpacity(0.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  subject!.subjectName!,
                  style: AppTextStyles.medium()
                      .copyWith(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                Text(
                  ' (${subject!.units!.length})',
                  style: AppTextStyles.small()
                      .copyWith(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: subject!.units!.length,
            separatorBuilder: (_, index) => Divider(
              height: 2,
              thickness: 2,
              color: theme.primaryColor.withOpacity(0.5),
            ),
            itemBuilder: (_, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: Text(
                    subject!.units![index].name!,
                    textAlign: TextAlign.center,
                  )),
                  Container(
                    height: Screen.height(30),
                    width: 2,
                    color: theme.primaryColor.withOpacity(0.5),
                  ),
                  Expanded(
                      child: Text(
                    subject!.units![index].price.toString(),
                    textAlign: TextAlign.center,
                  )),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
