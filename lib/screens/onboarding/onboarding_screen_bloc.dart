import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared_preference_keys.dart';
import 'onboarding_screen_events.dart';
import 'onboarding_screen_states.dart';

class OnboardingScreenBloc extends Bloc<OnboardingScreenEvent, OnboardingScreenState> {
  static const int MaxPageIndex = 3;

  @override
  OnboardingScreenState get initialState => Uninitialised();

  @override
  Stream<OnboardingScreenState> mapEventToState(OnboardingScreenEvent event) async* {
    if (event is Initialise) {
      // TODO: analytics
      yield Initialised();
    }

    if (state is Initialised) {
      Initialised currentState = state;

      if (event is OnPageChange) {
        // TODO: analytics
        yield currentState.copyWith(
          currentIndex: event.currentIndex.toDouble(),
          atLastPage: event.currentIndex == MaxPageIndex,
        );
      }

      if (event is Skip) {
        // TODO: analytics
        yield Done();
      }

      if (event is Enter) {
        // TODO: analytics

        final prefs = await SharedPreferences.getInstance();

        yield Done(
          shouldPresentLoginScreen: prefs.getBool(SharedPreferenceKeys.ShouldPresentLoginScreen) ?? true,
        );
      }
    }
  }
}
