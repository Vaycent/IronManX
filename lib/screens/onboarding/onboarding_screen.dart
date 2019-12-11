import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:liquid_swipe/Constants/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../../global.dart';
import 'onboarding_screen_bloc.dart';
import 'onboarding_screen_events.dart';
import 'onboarding_screen_states.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => OnboardingScreenBloc()..add(Initialise()),
      child: BlocBuilder<OnboardingScreenBloc, OnboardingScreenState>(
        builder: (context, state) {
          if (state is Initialised) {
            return Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                LiquidSwipe(
                  enableLoop: false,
                  waveType: WaveType.circularReveal,
                  fullTransitionValue: 500,
                  // enableSlideIcon: true,
                  // onPageChangeCallback: (page) => print(page),
                  onPageChangeCallback: (page) => BlocProvider.of<OnboardingScreenBloc>(context).add(OnPageChange(currentIndex: page)),
                  currentUpdateTypeCallback: (updateType) => print(updateType),
                  pages: [
                    Container(
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            FlutterI18n.translate(context, "onboarding.1.image"),
                            fit: BoxFit.cover,
                            width: screenWidth,
                            height: screenHeight,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 14, right: 14, bottom: 45),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  FlutterI18n.translate(context, "onboarding.1.title"),
                                  style: TextStyle(
                                    color: Color(0xFF7F3E3E),
                                    fontSize: 38,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  FlutterI18n.translate(context, "onboarding.1.summary"),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w200,
                                  ),
                                  softWrap: true,
                                  // maxLines: 3,
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                          // _buildSkipButton(context),
                        ],
                      ),
                    ),
                    Container(
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            FlutterI18n.translate(context, "onboarding.2.image"),
                            fit: BoxFit.cover,
                            width: screenWidth,
                            height: screenHeight,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 9, right: 9, bottom: 19),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Text(
                                  FlutterI18n.translate(context, "onboarding.2.title"),
                                  style: TextStyle(
                                    color: Color(0xFF73793B),
                                    fontSize: 38,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  FlutterI18n.translate(context, "onboarding.2.summary"),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w200,
                                  ),
                                  softWrap: true,
                                  // maxLines: 3,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          // _buildSkipButton(context),
                        ],
                      ),
                    ),
                    Container(
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            FlutterI18n.translate(context, "onboarding.3.image"),
                            fit: BoxFit.cover,
                            width: screenWidth,
                            height: screenHeight,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 9, right: 9, bottom: 19),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  FlutterI18n.translate(context, "onboarding.3.title"),
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 38,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  FlutterI18n.translate(context, "onboarding.3.summary"),
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w200,
                                  ),
                                  softWrap: true,
                                  // maxLines: 3,
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                          // _buildSkipButton(context),
                        ],
                      ),
                    ),
                    Container(
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          Image.asset(
                            FlutterI18n.translate(context, "onboarding.4.image"),
                            fit: BoxFit.cover,
                            width: screenWidth,
                            height: screenHeight,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 9, right: 9, bottom: 19),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  FlutterI18n.translate(context, "onboarding.4.title"),
                                  style: TextStyle(
                                    color: Color(0xFF396E75),
                                    fontSize: 38,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  FlutterI18n.translate(context, "onboarding.4.summary"),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w200,
                                  ),
                                  softWrap: true,
                                  // maxLines: 3,
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                          _buildEnterButton(context, state),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 10,
                  child: DotsIndicator(
                    dotsCount: 4,
                    position: state.currentIndex,
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                ),
              ],
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildSkipButton(BuildContext context) {
    return Positioned(
      top: 20,
      left: 9,
      child: FlatButton(
        onPressed: () {},
        color: Colors.blue,
        child: Text(
          FlutterI18n.translate(context, "onboarding.skip"),
          style: TextStyle(
            color: Colors.white70,
            fontSize: 18,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );
  }

  Widget _buildEnterButton(BuildContext context, Initialised state) {
    return Positioned(
      bottom: 50,
      child: CircularGradientButton(
        child: Text(
          FlutterI18n.translate(context, "onboarding.enter"),
          style: TextStyle(
            color: Global.AmwayLightPurple,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        callback: () {},
        gradient: LinearGradient(colors: [Color(0xFF67A7F0), Color(0xFF8ADBDD)]),
        shadowColor: Color(0xFF8ADBDD).withOpacity(0.5),
        elevation: 2,
      ),
    );
  }
}
