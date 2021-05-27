import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:foxlearn_pos/provider/app_provider.dart';
import 'package:foxlearn_pos/ui/home/home_screen_builder.dart';
import 'package:provider/provider.dart';

import 'app_theme/theme_data.dart';
import 'bloc/auth/auth_bloc.dart';
import 'bloc/requests/requests_bloc.dart';
import 'init_screen.dart';
import 'ui/login/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => RequestsBloc()),
        BlocProvider(create: (_) => AuthBloc()..add(CheckAuthEvent())),
      ],
      builder: (context, _) {
        return ChangeNotifierProvider(
          lazy: true,
          create: (_) => AppProvider(context.read<AuthBloc>(), context.read<RequestsBloc>()),
          child: MaterialApp(
            builder: DevicePreview.appBuilder, // Add the builder here
            title: 'POS FOX-LEARN',
            themeMode: ThemeMode.light,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [Locale('ar', 'SY')],
            locale: Locale('ar', 'SY'),
            theme: AppThemesData.getLightTheme(),
            home: InitScreen(
                child: BlocConsumer<AuthBloc, AuthState>(
                    buildWhen: _buildWhen,
                    listenWhen: _buildWhen,
                    listener: _listener,
                    builder: (context, state) {
                      if (state is CheckingAuth) return Scaffold();
                      else if (state is LoginSuccess) return HomeScreenBuilder(
                          user: state.user
                        );
                      return LoginScreen();
                    })),
          ),
        );
      },
    );
  }

  _listener(BuildContext context, AuthState authState) {
    if (authState is LoginSuccess) {
      final user = authState.user;
      final provider = Provider.of<AppProvider>(context, listen: false);
      provider.user = user;
      provider.getAppData();
    }
  }

  bool _buildWhen(AuthState preState, AuthState nextState) {
    final bool shouldRebuild = (preState is LoginSuccess && nextState is LoggedOutState) ||
        (preState is CheckingAuth && nextState is LoggedOutState) ||
        (nextState is LoginSuccess);
    return shouldRebuild;
  }
}
