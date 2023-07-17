import 'package:equatable/equatable.dart';

/// A base class for all the failures in the app
sealed class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

final class UnknownFailure extends Failure {
  @override
  List<Object?> get props => [];
}

final class NetworkFailure extends Failure {
  @override
  List<Object?> get props => [];
}

final class NullResponseFailure extends Failure {
  @override
  List<Object?> get props => [];
}
