import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/domain.dart';
import 'models.dart';

part 'tree_node_model.freezed.dart';
part 'tree_node_model.g.dart';

/// {@template tree_node_model}
/// A data model representing a tree node.
///
/// This model is generated using the `freezed` package to provide
/// immutable data classes and union types.
///
/// The [TreeNodeModel] class contains the following fields:
/// - `id`: A required [String] representing the unique identifier of the node.
/// - `name`: A required [String] representing the name of the node.
/// - `children`: An optional [List] of [TreeNodeModel] representing the child nodes.
///
/// The [TreeNodeModel] class also includes a factory constructor [TreeNodeModel.fromJson]
/// to create an instance from a JSON map.
/// {@endtemplate}
@freezed
class TreeNodeModel with _$TreeNodeModel {
  const TreeNodeModel._();

  /// {@macro tree_node_model}
  const factory TreeNodeModel({
    required String id,
    required String name,
    String? parentId,
    String? locationId,
    String? sensorId,
    SensorTypeModel? sensorType,
    SensorStatusModel? status,
  }) = _TreeNodeModel;

  /// Creates a [TreeNodeModel] from a JSON map.
  factory TreeNodeModel.fromJson(Map<String, dynamic> json) =>
      _$TreeNodeModelFromJson(json);

  /// Converts this [TreeNodeModel] to a [TreeNode].
  TreeNode toEntityLocation() {
    return TreeNode.location(
      id: id,
      name: name,
      parentId: parentId,
    );
  }

  /// Converts this [TreeNodeModel] to a [TreeNode].
  TreeNode toEntity() {
    if (sensorType != null) {
      return TreeNode.component(
        id: id,
        parentId: parentId ?? locationId,
        name: name,
        sensorType: sensorType!.toEntity(),
        status: status!.toEntity(),
        sensorId: sensorId!,
      );
    }

    return TreeNode.asset(
      id: id,
      name: name,
      parentId: parentId ?? locationId,
    );
  }
}
