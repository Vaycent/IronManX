import 'package:flutter/material.dart';

import 'splash/splash_screen.dart';

class ScreenRoutes {
  static Map<String, WidgetBuilder> routes(BuildContext context) => {
        '/': (context) => SplashScreen(),
      };
}
