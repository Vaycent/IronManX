import 'package:equatable/equatable.dart';

abstract class SplashScreenEvent extends Equatable {
  const SplashScreenEvent();
}

class Initialise extends SplashScreenEvent {
  @override
  List<Object> get props => null;
}
