import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foxlearn_pos/app_theme/app_colors.dart';
import 'package:foxlearn_pos/app_theme/text_styles.dart';
import 'package:foxlearn_pos/bloc/requests/requests_bloc.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/custom_widgets/bottom_navy_bar.dart';
import 'package:foxlearn_pos/custom_widgets/custom_dialog.dart';
import 'package:foxlearn_pos/generated/assets.dart';
import 'package:foxlearn_pos/provider/bottom_nav_provider.dart';
import 'package:foxlearn_pos/services/navigator.dart';
import 'package:foxlearn_pos/services/screen.dart';
import 'package:provider/provider.dart';

import 'export_pages.dart';
import 'home_screen_header.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> _assetsIcons = [
    Assets.svgMainScreenIcon,
    Assets.svgHistoryScreenIcon,
    Assets.svgBalanceScreenIcon,
    Assets.svgCodeGenerationScreenIcon,
    Assets.svgSettings,
  ];
  final List<String> _titles = const [
    AppStrings.HOME,
    AppStrings.CODE_HISTORY,
    AppStrings.BALANCE,
    AppStrings.CODES_GENERATION,
    AppStrings.SITTING,
  ];

  PageController? _pageController;

  @override
  void initState() {
    final bottomProvider =
        Provider.of<BottomNavProvider>(context, listen: false);
    final initPage = bottomProvider.pageIndex;
    bottomProvider.scaffoldKey = _scaffoldKey;
    _pageController = PageController(initialPage: initPage);
    bottomProvider.pageController = _pageController;
    super.initState();
  }

  final _pages = [
    MainPage(),
    CodeHistoryPage(),
    BalancePage(),
    CodeGenerationPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: Consumer<BottomNavProvider>(
        builder: (_, navProvider, __) => BottomNavyBar(
          onItemSelected: navProvider.jumpToPage,
          animationDuration: Duration(milliseconds: 250),
          curve: Curves.easeOut,
          backgroundColor: AppColors.LIGHT_Red,
          selectedIndex: navProvider.pageIndex,
          containerHeight: Screen.height(60),
          itemCornerRadius: 15,
          items: _buildBottomItem(context),
        ),
      ),
      body: BlocListener<RequestsBloc, RequestsState>(
        listener: _listen,
        child: SafeArea(
          child: Column(
            children: [
              HomeScreenHeader(),
              Expanded(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (index) {
                    Provider.of<BottomNavProvider>(context, listen: false)
                        .pageIndex = index;
                  },
                  itemCount: 5,
                  itemBuilder: (_, index) {
                    return _pages[index];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _listen(BuildContext context, RequestsState state) {
    FocusScope.of(context).unfocus();

    ///App will loading when send request from AppProvider
    if (state is LoadingState)
      showDialog(
          context: context,
          builder: (_) => LoadingDialog(loadingMessage: state.loadingMassage));

    ///App will open screen result when request is success
    else if (state is SuccessWithResultState) {
      AppNavigator.pushReplacement(context, state.successScreen);
    }

    ///this for show success result in dialog (didn't used yet)
    else if (state is SuccessState) {
      Navigator.pop(context);
    }

    ///this for show [ErrorDialog]  if request is failure
    else if (state is FailureState) {
      Navigator.pop(context);
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => ErrorDialog(
          errorMessage: state.failureMassage,
        ),
      );
    }
  }

  _buildBottomItem(BuildContext context) {
    final theme = Theme.of(context);
    int selectedPage =
        Provider.of<BottomNavProvider>(context, listen: false).pageIndex;
    List<BottomNavyBarItem> _items = [];
    for (int i = 0; i < 5; i++)
      _items.add(BottomNavyBarItem(
        icon: SvgPicture.asset(
          _assetsIcons[i],
          color: selectedPage == i ? theme.cardColor : null,
          width: Screen.width(20),
        ),
        textAlign: TextAlign.center,
        title: Text(_titles[i],
            style: AppTextStyles.medium()
                .copyWith(color: theme.colorScheme.onPrimary)),
        activeColor: theme.shadowColor,
        inactiveColor: Colors.black87,
      ));
    return _items;
  }
}
