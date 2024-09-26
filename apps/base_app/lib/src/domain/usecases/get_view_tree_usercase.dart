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
    final [
      locationsResult,
      assetsResut,
    ] = await Future.wait([
      repository.getLocations(companyId),
      repository.getAssets(companyId),
    ]);

    if (locationsResult.isLeft || assetsResut.isLeft) {
      return locationsResult.isLeft ? locationsResult : assetsResut;
    }

    final locations = locationsResult.right;
    final assets = assetsResut.right;

    // Mapa para armazenar todos os TreeNodes (por ID)
    final Map<String, TreeNode> treeMap = {};

    // Adicionando Locations ao mapa de TreeNodes
    for (var location in locations) {
      treeMap[location.id] = TreeNode.location(
        id: location.id,
        name: location.name,
        parentId: location.parentId,
      );
    }

    // Adicionando Assets e Components ao mapa de TreeNodes
    for (var item in assets) {
      if (item is Asset) {
        treeMap[item.id] = TreeNode.asset(
          id: item.id,
          name: item.name,
          parentId: item.parentId,
        );
      }
      if (item is Component) {
        treeMap[item.id] = TreeNode.component(
          id: item.id,
          name: item.name,
          sensorId: item.sensorId,
          parentId: item.parentId,
          sensorType: item.sensorType,
          status: item.status,
        );
      }
    }

    // Agora ligamos os nós aos seus pais
    for (var node in treeMap.values) {
      if (node.parentId != null && treeMap.containsKey(node.parentId)) {
        final parent = treeMap[node.parentId]!;

        // Usando copyWith para atualizar a lista de filhos do pai
        treeMap[node.parentId!] = parent.when(
          location: (id, name, parentId, children) =>
              (parent as Location).copyWith(
            children: [...children, node],
          ),
          asset: (id, name, parentId, children) => (parent as Asset).copyWith(
            children: [...children, node],
          ),
          component: (id, name, sensorId, sensorType, status, parentId) =>
              (parent as Component),
        );
      }
    }

    // Retornar apenas os nós raiz (aqueles que não têm pai)
    return Right(
      treeMap.values.where((node) => node.parentId == null).toList(),
    );
  }
}
