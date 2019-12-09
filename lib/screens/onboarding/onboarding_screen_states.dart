import 'package:equatable/equatable.dart';

abstract class OnboardingScreenState extends Equatable {
  const OnboardingScreenState();
}

class Uninitialised extends OnboardingScreenState {
  @override
  List<Object> get props => null;
}

class Initialised extends OnboardingScreenState {
  final double currentIndex;
  // final bool atLastPage;

  const Initialised({
    this.currentIndex = 0,
    // this.atLastPage = false,
  });

  @override
  List<Object> get props => [
        currentIndex,
        // atLastPage,
      ];

  Initialised copyWith({
    double currentIndex,
    bool atLastPage,
  }) {
    return Initialised(
      currentIndex: currentIndex ?? this.currentIndex,
      // atLastPage: atLastPage ?? this.atLastPage,
    );
  }
}

class Done extends OnboardingScreenState {
  final bool shouldPresentLoginScreen;

  const Done({
    this.shouldPresentLoginScreen = false, // TODO: change later
  });

  @override
  List<Object> get props => [shouldPresentLoginScreen];
}

class NetworkError extends OnboardingScreenState {
  @override
  List<Object> get props => null;
}
