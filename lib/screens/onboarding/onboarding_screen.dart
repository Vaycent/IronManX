import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:liquid_swipe/Constants/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../../global.dart';
import '../screen_routes.dart';
import 'onboarding_screen_bloc.dart';
import 'onboarding_screen_events.dart';
import 'onboarding_screen_states.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingScreenBloc()..add(Initialise()),
      child: BlocListener<OnboardingScreenBloc, OnboardingScreenState>(
        listener: (context, state) {
          if (state is Done) {
            if (state.shouldPresentLoginScreen) {
              Navigator.pushNamedAndRemoveUntil(context, ScreenRoutes.Login, (route) => route == null);
            } else {
              Navigator.pushNamedAndRemoveUntil(context, ScreenRoutes.Main, (route) => route == null);
            }
          }
        },
        child: BlocBuilder<OnboardingScreenBloc, OnboardingScreenState>(
          builder: (context, state) {
            if (state is Initialised) {
              return Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  _buildLiquidSwipe(context, state),
                  Positioned(
                    bottom: 10,
                    child: DotsIndicator(
                      dotsCount: 5,
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
      ),
    );
  }

  Widget _buildLiquidSwipe(BuildContext context, Initialised state) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return LiquidSwipe(
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
              // _buildEnterButton(context, state),
            ],
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 58),
                width: screenWidth - 50,
                child: Text(
                  FlutterI18n.translate(context, "termsConditions.title"),
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                  ),
                  softWrap: true,
                  // maxLines: 3,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 9, top: 10.0, right: 9),
                child: Text(
                  FlutterI18n.translate(context, "termsConditions.summary"),
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                  softWrap: true,
                  // maxLines: 3,
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                child: ListView(
                  itemExtent: 40,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "隐私政策",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "微吼直播服务协议",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "安利云直播承诺书",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 9, right: 9),
                child: Text(
                  FlutterI18n.translate(context, "termsConditions.acceptTerms"),
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                  softWrap: true,
                  // maxLines: 3,
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 38),
                child: FlatButton(
                  onPressed: () {},
                  color: Colors.blue,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 9),
                    width: screenWidth - 50,
                    alignment: Alignment.center,
                    child: Text(
                      FlutterI18n.translate(context, "termsConditions.accept"),
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 19,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
        callback: () => BlocProvider.of<OnboardingScreenBloc>(context).add(Enter()),
        gradient: LinearGradient(colors: [
          Color(0xFF67A7F0),
          Color(0xFF8ADBDD),
        ]),
        shadowColor: Color(0xFF8ADBDD).withOpacity(0.5),
        elevation: 2,
      ),
    );
  }
}
