import 'package:flutter/material.dart';
import 'package:foxlearn_pos/bloc/requests/requests_bloc.dart';
import 'package:foxlearn_pos/custom_widgets/loading.dart';
import 'package:foxlearn_pos/models/user/user.dart';
import 'package:foxlearn_pos/provider/app_provider.dart';
import 'package:foxlearn_pos/provider/bottom_nav_provider.dart';
import 'package:foxlearn_pos/provider/generate_code_provider.dart';
import 'package:foxlearn_pos/ui/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../init_notifications_service.dart';
import '../loading_failure_screen.dart';
import 'pages/code_generation_page/providers/TabBarProvider.dart';

class HomeScreenBuilder extends StatelessWidget {
  final User? user;

  const HomeScreenBuilder({Key? key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Selector<AppProvider, Tuple2<bool, String?>>(
      selector: (_, provider) => Tuple2(provider.loading, provider.errorMessage),
      builder: (_, data, __) {
        if (data.item1)
          return Scaffold(
            body: Center(child: Loading()),
          );
        else if (data.item2 != null) return FailureScreen();
        return InitNotificationsService(
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => BottomNavProvider()),
              ChangeNotifierProvider(
                create: (_) => TabBarProvider(),
              ),
              ChangeNotifierProvider(
                create: _createGenerateCodeProvider,
              ),
            ],
            child: HomeScreen(),
          ),
        );
      },
    );
  }

  GenerateCodeProvider _createGenerateCodeProvider(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);

    ///init packages for generate code provider
    final packages = appProvider.normalPackages;
    final offersPackages = appProvider.offersPackages;
    return GenerateCodeProvider(
        packages.length != 0 ? packages.first : null,
        offersPackages.length != 0 ? offersPackages.first : null,
        context.read<RequestsBloc>());
  }
}
