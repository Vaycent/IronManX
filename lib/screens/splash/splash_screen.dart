import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../repositories/content_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'splash_screen_bloc.dart';
import 'splash_screen_events.dart';
import 'splash_screen_states.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => SplashScreenBloc(RepositoryProvider.of<ContentRepository>(context))..add(Initialise()),
      child: BlocListener<SplashScreenBloc, SplashScreenState>(
        listener: (context, state) {
          if (state is Initialised) {
            // TODO:navigate to homepage
          }
        },
        child: Container(
          color: const Color(0xFFF1F2FF),
          child: BlocBuilder<SplashScreenBloc, SplashScreenState>(
            builder: (context, state) {
              if (state is Initialising) {
                return Stack(
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
                            style: TextStyle(
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
                                valueColor: AlwaysStoppedAnimation(Color(0xFF38539A)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 36,
                      child: Text(FlutterI18n.translate(context, "splash.firstLaunch"),
                          style: TextStyle(
                            color: Color(0xFF616165),
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.none,
                          )),
                    ),
                  ],
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  List<Widget> _buildWidgets(BuildContext context, Initialising state) {}
}
