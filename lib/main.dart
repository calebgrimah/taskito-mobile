import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskito_mobile/authentication/bloc/authentication_bloc.dart';
import 'package:taskito_mobile/authentication/views/login_screen.dart';
import 'package:taskito_mobile/authentication/views/sign_up_screen.dart';
import 'package:taskito_mobile/dashboard/bloc/dashboard_bloc.dart';
import 'dashboard/views/dashboard_screen.dart';
import 'util/colors.dart';
import 'util/constants.dart';
import 'util/routes.dart';
import 'util/strings.dart';

void main() {
  runZonedGuarded(() async {
    await Hive.initFlutter();
    await Hive.openBox(AppStrings.hiveBox);

    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DashboardBloc(),
          ),
          BlocProvider(
            create: (context) => AuthenticationBloc(),
          )
        ],
        child: App(),
      ),
    );
  }, (error, stacktrace) {
    log(error.toString());
  });
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.greyLight, //top bar color
        statusBarIconBrightness: Brightness.dark, //top bar icons
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      navigatorKey: navigatorKey,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: UniformScrollBehavior(),
          child: child!,
        );
      },
      theme: ThemeData(
        primaryColor: AppColors.primary,
        backgroundColor: AppColors.greyLight,
      ),
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const DashboardScreen(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.addExpenseScreen:
            return generateSlideInFromBottomRoute(
              destinationScreen: Container(),
              // destinationScreen: BlocProvider.value(
              //   value: BlocProvider.of<AppBloc>(context)..add(SetDifficulty(difficulty)),
              //   child: BoardScreen(
              //     gameDifficulty: difficulty,
              //   ),
              // ),
              settings: settings,
            );
        }
      },
    );
  }
}
