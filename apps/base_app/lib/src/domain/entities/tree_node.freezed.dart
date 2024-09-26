// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tree_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TreeNode {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get parentId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id, String name, String? parentId, List<TreeNode> children)
        location,
    required TResult Function(
            String id, String name, String? parentId, List<TreeNode> children)
        asset,
    required TResult Function(String id, String name, String sensorId,
            SensorType sensorType, SensorStatus status, String? parentId)
        component,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id, String name, String? parentId, List<TreeNode> children)?
        location,
    TResult? Function(
            String id, String name, String? parentId, List<TreeNode> children)?
        asset,
    TResult? Function(String id, String name, String sensorId,
            SensorType sensorType, SensorStatus status, String? parentId)?
        component,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id, String name, String? parentId, List<TreeNode> children)?
        location,
    TResult Function(
            String id, String name, String? parentId, List<TreeNode> children)?
        asset,
    TResult Function(String id, String name, String sensorId,
            SensorType sensorType, SensorStatus status, String? parentId)?
        component,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Location value) location,
    required TResult Function(Asset value) asset,
    required TResult Function(Component value) component,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Location value)? location,
    TResult? Function(Asset value)? asset,
    TResult? Function(Component value)? component,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Location value)? location,
    TResult Function(Asset value)? asset,
    TResult Function(Component value)? component,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TreeNodeCopyWith<TreeNode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreeNodeCopyWith<$Res> {
  factory $TreeNodeCopyWith(TreeNode value, $Res Function(TreeNode) then) =
      _$TreeNodeCopyWithImpl<$Res, TreeNode>;
  @useResult
  $Res call({String id, String name, String? parentId});
}

/// @nodoc
class _$TreeNodeCopyWithImpl<$Res, $Val extends TreeNode>
    implements $TreeNodeCopyWith<$Res> {
  _$TreeNodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? parentId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationImplCopyWith<$Res>
    implements $TreeNodeCopyWith<$Res> {
  factory _$$LocationImplCopyWith(
          _$LocationImpl value, $Res Function(_$LocationImpl) then) =
      __$$LocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, String? parentId, List<TreeNode> children});
}

/// @nodoc
class __$$LocationImplCopyWithImpl<$Res>
    extends _$TreeNodeCopyWithImpl<$Res, _$LocationImpl>
    implements _$$LocationImplCopyWith<$Res> {
  __$$LocationImplCopyWithImpl(
      _$LocationImpl _value, $Res Function(_$LocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? parentId = freezed,
    Object? children = null,
  }) {
    return _then(_$LocationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      children: null == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<TreeNode>,
    ));
  }
}

/// @nodoc

class _$LocationImpl implements Location {
  const _$LocationImpl(
      {required this.id,
      required this.name,
      this.parentId,
      final List<TreeNode> children = const []})
      : _children = children;

  @override
  final String id;
  @override
  final String name;
  @override
  final String? parentId;
  final List<TreeNode> _children;
  @override
  @JsonKey()
  List<TreeNode> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  String toString() {
    return 'TreeNode.location(id: $id, name: $name, parentId: $parentId, children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, parentId,
      const DeepCollectionEquality().hash(_children));

  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      __$$LocationImplCopyWithImpl<_$LocationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id, String name, String? parentId, List<TreeNode> children)
        location,
    required TResult Function(
            String id, String name, String? parentId, List<TreeNode> children)
        asset,
    required TResult Function(String id, String name, String sensorId,
            SensorType sensorType, SensorStatus status, String? parentId)
        component,
  }) {
    return location(id, name, parentId, children);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id, String name, String? parentId, List<TreeNode> children)?
        location,
    TResult? Function(
            String id, String name, String? parentId, List<TreeNode> children)?
        asset,
    TResult? Function(String id, String name, String sensorId,
            SensorType sensorType, SensorStatus status, String? parentId)?
        component,
  }) {
    return location?.call(id, name, parentId, children);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id, String name, String? parentId, List<TreeNode> children)?
        location,
    TResult Function(
            String id, String name, String? parentId, List<TreeNode> children)?
        asset,
    TResult Function(String id, String name, String sensorId,
            SensorType sensorType, SensorStatus status, String? parentId)?
        component,
    required TResult orElse(),
  }) {
    if (location != null) {
      return location(id, name, parentId, children);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Location value) location,
    required TResult Function(Asset value) asset,
    required TResult Function(Component value) component,
  }) {
    return location(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Location value)? location,
    TResult? Function(Asset value)? asset,
    TResult? Function(Component value)? component,
  }) {
    return location?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Location value)? location,
    TResult Function(Asset value)? asset,
    TResult Function(Component value)? component,
    required TResult orElse(),
  }) {
    if (location != null) {
      return location(this);
    }
    return orElse();
  }
}

abstract class Location implements TreeNode {
  const factory Location(
      {required final String id,
      required final String name,
      final String? parentId,
      final List<TreeNode> children}) = _$LocationImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get parentId;
  List<TreeNode> get children;

  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AssetImplCopyWith<$Res> implements $TreeNodeCopyWith<$Res> {
  factory _$$AssetImplCopyWith(
          _$AssetImpl value, $Res Function(_$AssetImpl) then) =
      __$$AssetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String name, String? parentId, List<TreeNode> children});
}

/// @nodoc
class __$$AssetImplCopyWithImpl<$Res>
    extends _$TreeNodeCopyWithImpl<$Res, _$AssetImpl>
    implements _$$AssetImplCopyWith<$Res> {
  __$$AssetImplCopyWithImpl(
      _$AssetImpl _value, $Res Function(_$AssetImpl) _then)
      : super(_value, _then);

  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? parentId = freezed,
    Object? children = null,
  }) {
    return _then(_$AssetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      children: null == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<TreeNode>,
    ));
  }
}

/// @nodoc

class _$AssetImpl implements Asset {
  const _$AssetImpl(
      {required this.id,
      required this.name,
      this.parentId,
      final List<TreeNode> children = const []})
      : _children = children;

  @override
  final String id;
  @override
  final String name;
  @override
  final String? parentId;
  final List<TreeNode> _children;
  @override
  @JsonKey()
  List<TreeNode> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  String toString() {
    return 'TreeNode.asset(id: $id, name: $name, parentId: $parentId, children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, parentId,
      const DeepCollectionEquality().hash(_children));

  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetImplCopyWith<_$AssetImpl> get copyWith =>
      __$$AssetImplCopyWithImpl<_$AssetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id, String name, String? parentId, List<TreeNode> children)
        location,
    required TResult Function(
            String id, String name, String? parentId, List<TreeNode> children)
        asset,
    required TResult Function(String id, String name, String sensorId,
            SensorType sensorType, SensorStatus status, String? parentId)
        component,
  }) {
    return asset(id, name, parentId, children);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id, String name, String? parentId, List<TreeNode> children)?
        location,
    TResult? Function(
            String id, String name, String? parentId, List<TreeNode> children)?
        asset,
    TResult? Function(String id, String name, String sensorId,
            SensorType sensorType, SensorStatus status, String? parentId)?
        component,
  }) {
    return asset?.call(id, name, parentId, children);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id, String name, String? parentId, List<TreeNode> children)?
        location,
    TResult Function(
            String id, String name, String? parentId, List<TreeNode> children)?
        asset,
    TResult Function(String id, String name, String sensorId,
            SensorType sensorType, SensorStatus status, String? parentId)?
        component,
    required TResult orElse(),
  }) {
    if (asset != null) {
      return asset(id, name, parentId, children);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Location value) location,
    required TResult Function(Asset value) asset,
    required TResult Function(Component value) component,
  }) {
    return asset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Location value)? location,
    TResult? Function(Asset value)? asset,
    TResult? Function(Component value)? component,
  }) {
    return asset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Location value)? location,
    TResult Function(Asset value)? asset,
    TResult Function(Component value)? component,
    required TResult orElse(),
  }) {
    if (asset != null) {
      return asset(this);
    }
    return orElse();
  }
}

abstract class Asset implements TreeNode {
  const factory Asset(
      {required final String id,
      required final String name,
      final String? parentId,
      final List<TreeNode> children}) = _$AssetImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get parentId;
  List<TreeNode> get children;

  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssetImplCopyWith<_$AssetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ComponentImplCopyWith<$Res>
    implements $TreeNodeCopyWith<$Res> {
  factory _$$ComponentImplCopyWith(
          _$ComponentImpl value, $Res Function(_$ComponentImpl) then) =
      __$$ComponentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String sensorId,
      SensorType sensorType,
      SensorStatus status,
      String? parentId});
}

/// @nodoc
class __$$ComponentImplCopyWithImpl<$Res>
    extends _$TreeNodeCopyWithImpl<$Res, _$ComponentImpl>
    implements _$$ComponentImplCopyWith<$Res> {
  __$$ComponentImplCopyWithImpl(
      _$ComponentImpl _value, $Res Function(_$ComponentImpl) _then)
      : super(_value, _then);

  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sensorId = null,
    Object? sensorType = null,
    Object? status = null,
    Object? parentId = freezed,
  }) {
    return _then(_$ComponentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sensorId: null == sensorId
          ? _value.sensorId
          : sensorId // ignore: cast_nullable_to_non_nullable
              as String,
      sensorType: null == sensorType
          ? _value.sensorType
          : sensorType // ignore: cast_nullable_to_non_nullable
              as SensorType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SensorStatus,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ComponentImpl implements Component {
  const _$ComponentImpl(
      {required this.id,
      required this.name,
      required this.sensorId,
      required this.sensorType,
      required this.status,
      this.parentId});

  @override
  final String id;
  @override
  final String name;
  @override
  final String sensorId;
  @override
  final SensorType sensorType;
  @override
  final SensorStatus status;
  @override
  final String? parentId;

  @override
  String toString() {
    return 'TreeNode.component(id: $id, name: $name, sensorId: $sensorId, sensorType: $sensorType, status: $status, parentId: $parentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComponentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sensorId, sensorId) ||
                other.sensorId == sensorId) &&
            (identical(other.sensorType, sensorType) ||
                other.sensorType == sensorType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, sensorId, sensorType, status, parentId);

  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ComponentImplCopyWith<_$ComponentImpl> get copyWith =>
      __$$ComponentImplCopyWithImpl<_$ComponentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id, String name, String? parentId, List<TreeNode> children)
        location,
    required TResult Function(
            String id, String name, String? parentId, List<TreeNode> children)
        asset,
    required TResult Function(String id, String name, String sensorId,
            SensorType sensorType, SensorStatus status, String? parentId)
        component,
  }) {
    return component(id, name, sensorId, sensorType, status, parentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id, String name, String? parentId, List<TreeNode> children)?
        location,
    TResult? Function(
            String id, String name, String? parentId, List<TreeNode> children)?
        asset,
    TResult? Function(String id, String name, String sensorId,
            SensorType sensorType, SensorStatus status, String? parentId)?
        component,
  }) {
    return component?.call(id, name, sensorId, sensorType, status, parentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id, String name, String? parentId, List<TreeNode> children)?
        location,
    TResult Function(
            String id, String name, String? parentId, List<TreeNode> children)?
        asset,
    TResult Function(String id, String name, String sensorId,
            SensorType sensorType, SensorStatus status, String? parentId)?
        component,
    required TResult orElse(),
  }) {
    if (component != null) {
      return component(id, name, sensorId, sensorType, status, parentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Location value) location,
    required TResult Function(Asset value) asset,
    required TResult Function(Component value) component,
  }) {
    return component(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Location value)? location,
    TResult? Function(Asset value)? asset,
    TResult? Function(Component value)? component,
  }) {
    return component?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Location value)? location,
    TResult Function(Asset value)? asset,
    TResult Function(Component value)? component,
    required TResult orElse(),
  }) {
    if (component != null) {
      return component(this);
    }
    return orElse();
  }
}

abstract class Component implements TreeNode {
  const factory Component(
      {required final String id,
      required final String name,
      required final String sensorId,
      required final SensorType sensorType,
      required final SensorStatus status,
      final String? parentId}) = _$ComponentImpl;

  @override
  String get id;
  @override
  String get name;
  String get sensorId;
  SensorType get sensorType;
  SensorStatus get status;
  @override
  String? get parentId;

  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComponentImplCopyWith<_$ComponentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
