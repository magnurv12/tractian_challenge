// Interface
import 'package:dependencies/dependencies.dart';

import '../entities/entities.dart';
import '../failures/failures.dart';
import '../repositories/repositories.dart';

/// Abstract class representing the use case for getting companies.
///
/// This use case returns a `Future` that resolves to either a `Failure` or a `Company`.
abstract class IGetCompaniesUseCase {
  /// Fetches a list of companies.
  Future<Either<Failure, List<Company>>> call();
}

/// Implementation of the `GetCompaniesUseCase`.
///
/// This class uses a repository to fetch the companies.
///
/// The repository is injected via the constructor.
class GetCompaniesUseCase implements IGetCompaniesUseCase {
  /// The repository used to fetch the companies.
  final IRepository repository;

  /// Creates an instance of `GetCompaniesUseCaseImpl`.  ///
  /// The [repository] parameter is required and must not be null.
  GetCompaniesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Company>>> call() async {
    return await repository.getCompanies();
  }
}
