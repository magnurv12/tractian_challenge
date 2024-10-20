import 'package:dependencies/dependencies.dart';

import '../domain.dart';

/// An abstract class representing a use case for fetching a view tree.
///
/// This use case is responsible for fetching a list of tree nodes associated
/// with a specific company.
///
/// Methods:
/// - `call(String companyId)`: Fetches a list of tree nodes for the given company ID.
///   - Parameters:
///     - `companyId` (String): The ID of the company for which to fetch the tree nodes.
///   - Returns: A `Future` that resolves to an `Either` containing a `Failure` or a `List<TreeNode>`.

abstract class IGetViewTreeUseCase {
  /// Fetches a list of tree nodes.
  Future<Either<Failure, List<TreeNode>>> call(String companyId);
}

/// {@template get_view_tree_use_case}
/// A use case class that retrieves the view tree from the repository.
///
/// This class implements the [IGetViewTreeUseCase] interface and is responsible
/// for interacting with the [IRepository] to fetch the view tree data.
///
/// The [GetViewTreeUseCase] constructor requires an instance of [IRepository].
///
/// Example usage:
/// ```dart
/// final useCase = GetViewTreeUseCase(repository);
/// ```
/// {@endtemplate}

class GetViewTreeUseCase implements IGetViewTreeUseCase {
  /// The repository used to fetch the view tree.
  final IRepository repository;

  /// {@macro get_view_tree_use_case}
  GetViewTreeUseCase(this.repository);

  @override
  Future<Either<Failure, List<TreeNode>>> call(String companyId) async {
    final [
      locationsResult,
      assetsResult,
    ] = await Future.wait([
      repository.getLocations(companyId),
      repository.getAssets(companyId),
    ]);

    if (locationsResult.isLeft || assetsResult.isLeft) {
      return locationsResult.isLeft ? locationsResult : assetsResult;
    }

    final treeNodes = locationsResult.right..addAll(assetsResult.right);

    final Map<String?, List<TreeNode>> nodesByParentId = {};
    for (var node in treeNodes) {
      nodesByParentId.putIfAbsent(node.parentId, () => []).add(node);
    }

    TreeNode buildTreeRecursively(TreeNode node) {
      final children =
          nodesByParentId[node.id]?.map(buildTreeRecursively).toList() ?? [];

      return node.when(
        location: (id, name, parentId, _) =>
            (node as Location).copyWith(children: children),
        asset: (id, name, parentId, _) =>
            (node as Asset).copyWith(children: children),
        component: (id, name, sensorId, sensorType, status, parentId) => node,
      );
    }

    final rootNodes = nodesByParentId[null] ?? [];

    final tree = rootNodes.map(buildTreeRecursively).toList();

    return Right(tree);
  }
}
