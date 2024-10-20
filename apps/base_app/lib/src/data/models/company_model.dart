import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/domain.dart';

part 'company_model.freezed.dart';
part 'company_model.g.dart';

/// {@template company_model}
/// A data model representing a company.
///
/// This model is generated using the `freezed` package to provide
/// immutable data classes and union types.
///
/// The [CompanyModel] class contains the following fields:
/// - `id`: A required [String] representing the unique identifier of the company.
/// - `name`: A required [String] representing the name of the company.
///
/// The [CompanyModel] class also includes a factory constructor [CompanyModel.fromJson]
/// to create an instance from a JSON map.
/// {@endtemplate}
@freezed
class CompanyModel with _$CompanyModel {
  const CompanyModel._();

  /// {@macro company_model}
  const factory CompanyModel({
    required String id,
    required String name,
  }) = _CompanyModel;

  /// Creates a [CompanyModel] from a JSON map.
  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  /// Converts this [CompanyModel] to a [Company].
  Company toEntity() {
    return Company(
      id: id,
      name: name,
    );
  }
}
