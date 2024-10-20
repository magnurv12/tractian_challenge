import 'package:dependencies/dependencies.dart';

part 'company.freezed.dart';

/// {@template company}
/// A class representing a company entity.
///
/// This class is generated using the `freezed` package to provide
/// immutability and other useful features.
///
/// The [Company] class has the following properties:
/// - `id`: A unique identifier for the company.
/// - `name`: The name of the company.
///
/// Example usage:
/// ```dart
/// final company = Company(id: '123', name: 'Tractian');
/// ```
/// {@endtemplate}
@freezed
class Company with _$Company {
  const Company._();

  /// {@macro company}
  const factory Company({
    required String id,
    required String name,
  }) = _Company;
}
