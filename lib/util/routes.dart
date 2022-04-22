import 'package:flutter/widgets.dart';

class AppRoutes {
  static const home = "/home";
  static const addExpenseScreen = "/addExpenseScreen";
  static const statistics = "/statistics";
}

Route generateSlideInRoute({
  required Widget destinationScreen,
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) => destinationScreen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
    settings: settings,
  );
}

Route generateSlideInFromBottomRoute({
  required Widget destinationScreen,
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) => destinationScreen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
    settings: settings,
  );
}

Route generateSlideInFromLeftRoute({
  required Widget destinationScreen,
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) => destinationScreen,
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) {
      var begin = const Offset(-1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(
        begin: begin,
        end: end,
      ).chain(
        CurveTween(
          curve: curve,
        ),
      );

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
    settings: settings,
  );
}

Route generateFadeInRoute({
  required Widget destinationScreen,
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (_, __, ___) => destinationScreen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    settings: settings,
  );
}
