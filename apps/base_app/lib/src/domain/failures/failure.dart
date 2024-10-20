import 'package:dependencies/dependencies.dart';

part 'failure.freezed.dart';

/// A sealed class representing different types of failures that can occur in the application.
///
/// This class uses the `freezed` package to generate union types and pattern matching.
///
/// The following types of failures are defined:
///
/// - `Failure.server`: Represents a server error with an optional message.
/// - `Failure.notFound`: Represents a not found error.
/// - `Failure.unauthorized`: Represents an unauthorized error with an optional message.
/// - `Failure.unexpected`: Represents an unexpected error.
/// - `Failure.timeout`: Represents a timeout error.

@freezedNoHelpers
sealed class Failure with _$Failure {
  /// - `Failure.server`: Represents a server error with an optional message.
  const factory Failure.server({
    @Default('') String message,
  }) = _Server;

  /// - `Failure.notFound`: Represents a not found error.
  const factory Failure.notFound() = _NotFound;

  /// - `Failure.unauthorized`: Represents an unauthorized error with an optional message.
  const factory Failure.unauthorized({
    @Default('') String message,
  }) = _Unauthorized;

  /// - `Failure.unexpected`: Represents an unexpected error.
  const factory Failure.unexpected() = _Unexpected;

  /// - `Failure.timeout`: Represents a timeout error.
  const factory Failure.timeout() = _Timeout;
}
