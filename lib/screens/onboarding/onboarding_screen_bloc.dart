import 'package:bloc/bloc.dart';

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

      }

      if (event is Enter) {
        // TODO: analytics

      }
    }
  }
}
