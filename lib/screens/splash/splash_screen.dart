import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../global.dart';
import '../../repositories/content_repository.dart';
import '../screen_routes.dart';
import 'splash_screen_bloc.dart';
import 'splash_screen_events.dart';
import 'splash_screen_states.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashScreenBloc(RepositoryProvider.of<ContentRepository>(context))..add(Initialise()),
      child: BlocListener<SplashScreenBloc, SplashScreenState>(
        listener: (context, state) {
          if (state is Initialised) {
            if (state.shouldPresentOnboardingScreen) {
              Navigator.pushNamedAndRemoveUntil(context, ScreenRoutes.Onboarding, (route) => route == null);
            } else if (state.shouldPresentLoginScreen) {
              Navigator.pushNamedAndRemoveUntil(context, ScreenRoutes.Login, (route) => route == null);
            } else {
              Navigator.pushNamedAndRemoveUntil(context, ScreenRoutes.Main, (route) => route == null);
            }
          }
        },
        child: Material(
          child: Container(
            color: Global.AmwayLightPurple,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/images/amway-logo-purple.svg',
                        semanticsLabel: FlutterI18n.translate(context, "splash.semanticsLabel"),
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                      Text(
                        FlutterI18n.translate(context, "splash.title"),
                        style: const TextStyle(
                          color: Color(0xFF616165),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: SizedBox(
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Global.AmwayDeepPurple),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<SplashScreenBloc, SplashScreenState>(
                  builder: (context, state) {
                    if (state is Initialising) {
                      if (state.progress < 90) {
                        return Positioned(
                          bottom: 36,
                          child: Text(FlutterI18n.translate(context, "splash.firstLaunch"),
                              style: TextStyle(
                                color: Color(0xFF616165),
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                decoration: TextDecoration.none,
                              )),
                        );
                      }
                    }
                    return SizedBox.shrink();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
