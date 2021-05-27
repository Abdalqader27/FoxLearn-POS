import 'package:flutter/material.dart';
import 'package:foxlearn_pos/const/padding.dart';
import 'package:foxlearn_pos/custom_widgets/image_title_card.dart';
import 'package:foxlearn_pos/models/package/package.dart';
import 'package:foxlearn_pos/models/package/package_type.dart';
import 'package:foxlearn_pos/provider/app_provider.dart';
import 'package:foxlearn_pos/provider/bottom_nav_provider.dart';
import 'package:foxlearn_pos/provider/generate_code_provider.dart';
import 'package:foxlearn_pos/ui/home/pages/code_generation_page/providers/TabBarProvider.dart';
import 'package:provider/provider.dart';

class QuickActivationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<AppProvider, List<Package>>(
      selector: (_, provider) => provider.fastPackages,
      builder: (_, fastPackages, __) => GridView.builder(
          itemCount: fastPackages.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: AppPadding.p16,
              crossAxisSpacing: 0,
              childAspectRatio: 100 / 85),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          itemBuilder: (_, index) {
            return ImageTitleCard(
              package: fastPackages[index],
              onTap: () => _onTap(fastPackages[index], context),
            );
          }),
    );
  }

  _onTap(Package package, BuildContext context) {
    final provider = Provider.of<GenerateCodeProvider>(context, listen: false);
    final tabProvider =  Provider.of<TabBarProvider>(context, listen: false);
    if (package.packageType == PackageType.OFFER) {
      provider.selectedOfferPackage = package;
      tabProvider.pageIndex=1;
    }
    else {
      provider.selectedNormalPackage = package;
      tabProvider.pageIndex=0;
    }
    Provider.of<BottomNavProvider>(context, listen: false).jumpToPage(3);
  }
}
