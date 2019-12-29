import 'package:flutter/material.dart';

import 'authentication/login_screen.dart';
import 'main/main_screen.dart';
import 'onboarding/onboarding_screen.dart';
import 'splash/splash_screen.dart';

class ScreenRoutes {
  static const Splash = '/';
  static const Onboarding = '/onboarding';
  static const Login = '/login';
  static const Main = '/main';

  static Map<String, WidgetBuilder> routes(BuildContext context) => {
        Splash: (context) => SplashScreen(),
        Onboarding: (context) => OnboardingScreen(),
        Login: (context) => LoginScreen(),
        Main: (context) => MainScreen(),
      };
}
