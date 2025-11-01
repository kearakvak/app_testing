import 'package:flutter/widgets.dart';

class NavigatorStateSer {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext context() {
    return navigatorKey.currentContext!;
  }

  // Optional: Method that throws descriptive error if context is null
  static BuildContext get requiredContext {
    final context = navigatorKey.currentContext;
    if (context == null) {
      throw FlutterError(
        'NavigatorStateSer.requiredContext was called before the Navigator was built.\n'
        'Make sure your app is initialized and the Navigator is mounted before accessing the context.',
      );
    }
    return context;
  }
}
