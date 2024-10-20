import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain.dart';

part 'tree_node.freezed.dart';

/// A `TreeNode` represents a node in a hierarchical structure, which can be
/// either a location, an asset, or a component. Each node type has its own
/// specific properties.
///
/// - `TreeNode.location`: Represents a location node.
///   - `id`: The unique identifier for the location.
///   - `name`: The name of the location.
///   - `parentId`: The optional identifier of the parent node.
///   - `children`: A list of child nodes.
///
/// - `TreeNode.asset`: Represents an asset node.
///   - `id`: The unique identifier for the asset.
///   - `name`: The name of the asset.
///   - `parentId`: The optional identifier of the parent node.
///   - `children`: A list of child nodes.
///
/// - `TreeNode.component`: Represents a component node.
///   - `id`: The unique identifier for the component.
///   - `sensorId`: The unique identifier for the sensor associated with the component.
///   - `name`: The name of the component.
///   - `sensorType`: The type of sensor associated with the component.
///   - `status`: The status of the sensor.
///   - `parentId`: The optional identifier of the parent node.

@freezed
class TreeNode with _$TreeNode {
  /// Represents a location node.
  const factory TreeNode.location({
    required String id,
    required String name,
    String? parentId,
    @Default([]) List<TreeNode> children,
  }) = Location;

  /// Represents an asset node.
  const factory TreeNode.asset({
    required String id,
    required String name,
    String? parentId,
    @Default([]) List<TreeNode> children,
  }) = Asset;

  /// Represents a component node.
  const factory TreeNode.component({
    required String id,
    required String name,
    required String sensorId,
    required SensorType sensorType,
    required SensorStatus status,
    String? parentId,
  }) = Component;
}
