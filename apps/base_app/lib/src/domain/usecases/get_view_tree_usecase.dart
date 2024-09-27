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
    // Fazendo as chamadas para obter Locations e Assets
    final [
      locationsResult,
      assetsResut,
    ] = await Future.wait([
      repository.getLocations(companyId),
      repository.getAssets(companyId),
    ]);

    // Verificação de erro
    if (locationsResult.isLeft || assetsResut.isLeft) {
      return locationsResult.isLeft ? locationsResult : assetsResut;
    }

    final treeNodes = locationsResult.right..addAll(assetsResut.right);

    // Função recursiva para construir a árvore a partir de um nó pai
    TreeNode buildTreeRecursively(TreeNode node) {
      // Busca todos os filhos do nó atual
      final children = treeNodes
          .where((child) => child.parentId == node.id)
          .map(buildTreeRecursively) // Chamada recursiva para os filhos
          .toList();

      // Atualiza o nó atual com seus filhos
      return node.when(
        location: (id, name, parentId, _) =>
            (node as Location).copyWith(children: children),
        asset: (id, name, parentId, _) =>
            (node as Asset).copyWith(children: children),
        component: (id, name, sensorId, sensorType, status, parentId) => node,
      );
    }

    // Filtrar os nós raiz (aqueles que não têm parentId)
    final rootNodes = treeNodes.where((node) => node.parentId == null).toList();

    // Construir a árvore recursivamente a partir dos nós raiz
    final tree = rootNodes.map(buildTreeRecursively).toList();

    return Right(tree);
  }
}
