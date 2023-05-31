import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  // If the subclasses have some properties, they'll get passed to this constructor
  // so that Equatable can perform value comparison.
  const Failure([List properties = const <dynamic>[]]);
}

// General failures
class ServerFailure extends Failure {
  final String message;

  const ServerFailure({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}

/// Use to return a [NoConnectionFailure] when there is a no internet connection
class NoConnectionFailure extends Failure {
  @override
  List<Object?> get props => [];
}

/// Use to return a [NoPermissionFailure] when permission not granted
class NoPermissionFailure extends Failure {
  @override
  List<Object?> get props => [];
}