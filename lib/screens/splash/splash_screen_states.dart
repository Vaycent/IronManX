import 'package:equatable/equatable.dart';

abstract class SplashScreenState extends Equatable {
  const SplashScreenState();

  @override
  List<Object> get props => null;
}

class Uninitialised extends SplashScreenState {}

class Initialising extends SplashScreenState {
  final int progress;

  const Initialising({this.progress = 0});

  @override
  List<Object> get props => [progress];

  Initialising copyWith({int progress}) {
    return Initialising(progress: progress ?? this.progress);
  }
}

class Initialised extends SplashScreenState {
  final bool shouldPresentOnboardingScreen;
  final bool shouldPresentLoginScreen;

  const Initialised({
    this.shouldPresentOnboardingScreen = true, // TODO: change later
    this.shouldPresentLoginScreen = false, // TODO: change later
  });

  @override
  List<Object> get props => [
        shouldPresentOnboardingScreen,
        shouldPresentLoginScreen,
      ];

  Initialised copyWith({
    bool shouldDisplayOnboardingScreen,
    bool shouldPresentLoginScreen,
  }) {
    return Initialised(
      shouldPresentOnboardingScreen: shouldPresentOnboardingScreen ?? this.shouldPresentOnboardingScreen,
      shouldPresentLoginScreen: shouldPresentLoginScreen ?? this.shouldPresentLoginScreen,
    );
  }
}

class NetworkError extends SplashScreenState {
  @override
  List<Object> get props => null;
}
