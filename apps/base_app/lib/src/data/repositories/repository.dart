import 'dart:io';

import 'package:dependencies/dependencies.dart';

import '../../domain/domain.dart';
import '../datasources/datasources.dart';

/// {@template repository}
/// A repository class that implements the [IRepository] interface.
/// This class is responsible for handling data operations and acts as a
/// mediator between the data source and the rest of the application.
///
/// The [Repository] class requires an instance of [IDataSource] to be
/// provided, which it uses to perform data-related tasks.
///
/// Example usage:
/// ```dart
/// final repository = Repository(dataSource);
/// ```
///
/// [IDataSource]: The data source interface that provides the necessary
/// methods for data operations.
/// {@endtemplate}
class Repository implements IRepository {
  final IDataSource _dataSource;

  /// {@macro repository}
  Repository(this._dataSource);

  @override
  Future<Either<Failure, List<Company>>> getCompanies() async {
    try {
      final companies = await _dataSource.getCompanies();
      return Right(companies.map((e) => e.toEntity()).toList());
    } on HttpException catch (e) {
      return Left(Failure.server(message: e.message));
    } catch (e) {
      return const Left(Failure.unexpected());
    }
  }

  @override
  Future<Either<Failure, List<TreeNode>>> getAssets(String companyId) async {
    try {
      final assets = await _dataSource.getAssets(companyId);
      return Right(assets.map((e) => e.toEntity()).toList());
    } on HttpException catch (e) {
      return Left(Failure.server(message: e.message));
    } catch (e) {
      return const Left(Failure.unexpected());
    }
  }

  @override
  Future<Either<Failure, List<TreeNode>>> getLocations(
    String companyId,
  ) async {
    try {
      final locations = await _dataSource.getLocations(companyId);
      return Right(locations.map((e) => e.toEntityLocation()).toList());
    } on HttpException catch (e) {
      return Left(Failure.server(message: e.message));
    } catch (e) {
      return const Left(Failure.unexpected());
    }
  }
}
