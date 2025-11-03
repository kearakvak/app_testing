import 'package:flutter/widgets.dart';

class NavigatorStateSer {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  // Null-safe getter
  static BuildContext? get maybeContext => navigatorKey.currentContext;

  // Forceful getter with error message
  static BuildContext get requiredContext {
    final ctx = navigatorKey.currentContext;
    if (ctx == null) {
      throw FlutterError(
        'NavigatorStateSer.requiredContext called before Navigator was built.\n'
        'Make sure MaterialApp(navigatorKey: NavigatorStateSer.navigatorKey) is built.',
      );
    }
    return ctx;
  }
}
