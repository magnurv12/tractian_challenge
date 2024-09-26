import 'package:dependencies/dependencies.dart';

import '../domain.dart';

abstract class IGetViewTreeUseCase {
  /// Fetches a list of tree nodes.
  Future<Either<Failure, List<TreeNode>>> call(String companyId);
}

class GetViewTreeUseCase implements IGetViewTreeUseCase {
  final IRepository repository;

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
