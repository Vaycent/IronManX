import 'package:equatable/equatable.dart';

abstract class SplashScreenState extends Equatable {
  const SplashScreenState();
}

class Uninitialised extends SplashScreenState {
  @override
  List<Object> get props => null;
}

class Initialising extends SplashScreenState {
  final int progress;

  const Initialising({this.progress});

  @override
  List<Object> get props => [progress];

  Initialising copyWith({int progress}) {
    return Initialising(progress: progress ?? this.progress);
  }
}

class Initialised extends SplashScreenState {
  @override
  List<Object> get props => null;
}

class NetworkError extends SplashScreenState {
  @override
  List<Object> get props => null;
}
