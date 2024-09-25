import 'package:dependencies/dependencies.dart';

import '../entities/entities.dart';
import '../failures/failures.dart';

/// An abstract class that defines the contract for a repository.
///
/// This repository interface declares a method for fetching companies.
abstract class IRepository {
  /// Fetches a list of companies.
  ///
  /// Returns a [Future] that completes with an [Either] object containing
  /// the result of the operation.
  Future<Either<Failure, List<Company>>> getCompanies();

  // Future<Either<Failure, Company>> getLocations(String id);

  // Future<Either<Failure, Company>> getAssets(String id);
}
