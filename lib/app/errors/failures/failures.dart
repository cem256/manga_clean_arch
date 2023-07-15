import 'package:equatable/equatable.dart';

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
