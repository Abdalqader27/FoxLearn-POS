import 'package:flutter/material.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/const/padding.dart';
import 'package:foxlearn_pos/custom_widgets/space_box.dart';
import 'package:foxlearn_pos/custom_widgets/subject_content.dart';
import 'package:foxlearn_pos/models/package/package.dart';
import 'package:foxlearn_pos/services/screen.dart';


class PackageContent extends StatelessWidget {
  final Package? package;

  const PackageContent({Key? key, this.package}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Screen.height(55)),
        child: AppBar(
          title: Text(package!.name!, style: AppTextStyles.appBarTitle()),
          centerTitle: true,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SpaceBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p32, vertical: AppPadding.p16),
                shrinkWrap: true,
                itemCount: package!.subjects!.length,
                itemBuilder: (_, index) {
                  return SubjectContent(
                    subject: package!.subjects![index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
