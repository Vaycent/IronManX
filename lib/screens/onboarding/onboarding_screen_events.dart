import 'package:equatable/equatable.dart';

abstract class OnboardingScreenEvent extends Equatable {
  const OnboardingScreenEvent();
}

class Initialise extends OnboardingScreenEvent {
  @override
  List<Object> get props => null;
}

class OnPageChange extends OnboardingScreenEvent {
  final int currentIndex;

  const OnPageChange({this.currentIndex = 0});

  @override
  List<Object> get props => [currentIndex];
}

class Skip extends OnboardingScreenEvent {
  @override
  List<Object> get props => null;
}

class Enter extends OnboardingScreenEvent {
  @override
  List<Object> get props => null;
}
