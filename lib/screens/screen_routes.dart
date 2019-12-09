import 'package:flutter/material.dart';

import 'onboarding/onboarding_screen.dart';
import 'splash/splash_screen.dart';

class ScreenRoutes {
  static const Splash = '/';
  static const Onboarding = '/onboarding';

  static Map<String, WidgetBuilder> routes(BuildContext context) => {
        Splash: (context) => SplashScreen(),
        Onboarding: (context) => OnboardingScreen(),
      };
}
