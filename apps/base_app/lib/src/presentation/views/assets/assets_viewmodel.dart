import 'package:core/core.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/domain.dart';
import 'assets_state.dart';

/// The assets page view model
class AssetsViewmodel extends ViewModel<AssetsState> {
  final IGetViewTreeUseCase _getViewTreeUseCase;

  /// Creates a [AssetsViewmodel]
  AssetsViewmodel(
    this._getViewTreeUseCase,
  ) : super(const AssetsState.loading());

  /// Load the tree
  Future<void> loadTree(String companyId) async {
    emit(const AssetsState.loading());
    final result = await compute(_getViewTreeUseCase.call, companyId);
    final state = result.fold(
      (error) => const AssetsState.error(),
      (nodes) => AssetsState.loaded(
        nodes: nodes,
        initialNodes: nodes,
      ),
    );

    emit(state);
  }

  /// Filter the tree by name
  Future<void> filterByName(String? name) async {
    if (state case AssetsStateLoaded(:final nodes, :final initialNodes)) {
      if (name == null || name.isEmpty) {
        emit(
          AssetsState.loaded(
            nodes: initialNodes,
            initialNodes: initialNodes,
          ),
        );
        return;
      }
      final filteredNodes = _filterByName(nodes, name);
      emit(
        AssetsState.loaded(nodes: filteredNodes, initialNodes: initialNodes),
      );
    }
  }

  /// Filter the tree by sensor type
  Future<void> filterBySensorType(SensorType? sensorType) async {
    if (state case AssetsStateLoaded(:final nodes, :final initialNodes)) {
      if (sensorType == null) {
        emit(
          AssetsState.loaded(
            nodes: initialNodes,
            initialNodes: initialNodes,
          ),
        );
        return;
      }
      final filteredNodes = _filterBySensorType(nodes, sensorType);
      emit(
        AssetsState.loaded(nodes: filteredNodes, initialNodes: initialNodes),
      );
    }
  }

  /// Filter the tree by status
  Future<void> filterByStatus(SensorStatus? status) async {
    if (state case AssetsStateLoaded(:final nodes, :final initialNodes)) {
      if (status == null) {
        emit(
          AssetsState.loaded(
            nodes: initialNodes,
            initialNodes: initialNodes,
          ),
        );
        return;
      }
      final filteredNodes = _filterByStatus(nodes, status);
      emit(
        AssetsState.loaded(nodes: filteredNodes, initialNodes: initialNodes),
      );
    }
  }

  List<TreeNode> _filterByName(List<TreeNode> nodes, String query) {
    query = query.toLowerCase();

    return nodes.where((node) {
      switch (node) {
        case Location(name: final name, children: final children):
          return name.toLowerCase().contains(query) ||
              _filterByName(children, query).isNotEmpty;
        case Asset(name: final name, children: final children):
          return name.toLowerCase().contains(query) ||
              _filterByName(children, query).isNotEmpty;
        case Component(name: final name):
          return name.toLowerCase().contains(query);
        default:
          return false;
      }
    }).map((node) {
      switch (node) {
        case Location(children: final children):
          return node.copyWith(children: _filterByName(children, query));
        case Asset(children: final children):
          return node.copyWith(children: _filterByName(children, query));
        default:
          return node;
      }
    }).toList();
  }

  List<TreeNode> _filterBySensorType(
    List<TreeNode> nodes,
    SensorType sensorType,
  ) {
    return nodes.where((node) {
      switch (node) {
        case Location(children: final children):
          return _filterBySensorType(children, sensorType).isNotEmpty;
        case Asset(children: final children):
          return _filterBySensorType(children, sensorType).isNotEmpty;
        case Component(sensorType: final nodeSensorType):
          return nodeSensorType == sensorType;
        default:
          return false;
      }
    }).map((node) {
      switch (node) {
        case Location(children: final children):
          return node.copyWith(
            children: _filterBySensorType(children, sensorType),
          );
        case Asset(children: final children):
          return node.copyWith(
            children: _filterBySensorType(children, sensorType),
          );
        default:
          return node;
      }
    }).toList();
  }

  List<TreeNode> _filterByStatus(List<TreeNode> nodes, SensorStatus status) {
    return nodes.where((node) {
      switch (node) {
        case Location(children: final children):
          return _filterByStatus(children, status).isNotEmpty;
        case Asset(children: final children):
          return _filterByStatus(children, status).isNotEmpty;
        case Component(status: final nodeStatus):
          return nodeStatus == status;
        default:
          return false;
      }
    }).map((node) {
      switch (node) {
        case Location(children: final children):
          return node.copyWith(children: _filterByStatus(children, status));
        case Asset(children: final children):
          return node.copyWith(children: _filterByStatus(children, status));
        default:
          return node;
      }
    }).toList();
  }
}
