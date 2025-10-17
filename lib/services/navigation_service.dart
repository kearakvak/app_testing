import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext context() {
    return navigatorKey.currentContext!;
  }

  static void switchtoscreen(Widget widget) {
    Navigator.pushAndRemoveUntil(
      NavigationService.navigatorKey.currentContext!,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
    );
  }

  static void gotoscreen(Widget widget) {
    Navigator.push(
      NavigationService.navigatorKey.currentContext!,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => widget,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // Slide from right
          const end = Offset.zero;
          final tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: Curves.easeInOut));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  static Future<T?> goToScreenWithResult<T>(Widget widget) async {
    return await Navigator.push<T>(
      NavigationService.navigatorKey.currentContext!,
      MaterialPageRoute(builder: (ctx) => widget),
    );
  }

  static void pop<T extends Object?>(T result) {
    Navigator.pop<T>(NavigationService.navigatorKey.currentContext!, result);
  }
}
