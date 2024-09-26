// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tree_node_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TreeNodeModel _$TreeNodeModelFromJson(Map<String, dynamic> json) {
  return _TreeNodeModel.fromJson(json);
}

/// @nodoc
mixin _$TreeNodeModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get parentId => throw _privateConstructorUsedError;
  String? get locationId => throw _privateConstructorUsedError;
  String? get sensorId => throw _privateConstructorUsedError;
  SensorTypeModel? get sensorType => throw _privateConstructorUsedError;
  SensorStatusModel? get status => throw _privateConstructorUsedError;

  /// Serializes this TreeNodeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TreeNodeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TreeNodeModelCopyWith<TreeNodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreeNodeModelCopyWith<$Res> {
  factory $TreeNodeModelCopyWith(
          TreeNodeModel value, $Res Function(TreeNodeModel) then) =
      _$TreeNodeModelCopyWithImpl<$Res, TreeNodeModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? parentId,
      String? locationId,
      String? sensorId,
      SensorTypeModel? sensorType,
      SensorStatusModel? status});
}

/// @nodoc
class _$TreeNodeModelCopyWithImpl<$Res, $Val extends TreeNodeModel>
    implements $TreeNodeModelCopyWith<$Res> {
  _$TreeNodeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TreeNodeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? parentId = freezed,
    Object? locationId = freezed,
    Object? sensorId = freezed,
    Object? sensorType = freezed,
    Object? status = freezed,
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
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
      sensorId: freezed == sensorId
          ? _value.sensorId
          : sensorId // ignore: cast_nullable_to_non_nullable
              as String?,
      sensorType: freezed == sensorType
          ? _value.sensorType
          : sensorType // ignore: cast_nullable_to_non_nullable
              as SensorTypeModel?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SensorStatusModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TreeNodeModelImplCopyWith<$Res>
    implements $TreeNodeModelCopyWith<$Res> {
  factory _$$TreeNodeModelImplCopyWith(
          _$TreeNodeModelImpl value, $Res Function(_$TreeNodeModelImpl) then) =
      __$$TreeNodeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? parentId,
      String? locationId,
      String? sensorId,
      SensorTypeModel? sensorType,
      SensorStatusModel? status});
}

/// @nodoc
class __$$TreeNodeModelImplCopyWithImpl<$Res>
    extends _$TreeNodeModelCopyWithImpl<$Res, _$TreeNodeModelImpl>
    implements _$$TreeNodeModelImplCopyWith<$Res> {
  __$$TreeNodeModelImplCopyWithImpl(
      _$TreeNodeModelImpl _value, $Res Function(_$TreeNodeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TreeNodeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? parentId = freezed,
    Object? locationId = freezed,
    Object? sensorId = freezed,
    Object? sensorType = freezed,
    Object? status = freezed,
  }) {
    return _then(_$TreeNodeModelImpl(
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
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
      sensorId: freezed == sensorId
          ? _value.sensorId
          : sensorId // ignore: cast_nullable_to_non_nullable
              as String?,
      sensorType: freezed == sensorType
          ? _value.sensorType
          : sensorType // ignore: cast_nullable_to_non_nullable
              as SensorTypeModel?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SensorStatusModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TreeNodeModelImpl extends _TreeNodeModel {
  const _$TreeNodeModelImpl(
      {required this.id,
      required this.name,
      this.parentId,
      this.locationId,
      this.sensorId,
      this.sensorType,
      this.status})
      : super._();

  factory _$TreeNodeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreeNodeModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? parentId;
  @override
  final String? locationId;
  @override
  final String? sensorId;
  @override
  final SensorTypeModel? sensorType;
  @override
  final SensorStatusModel? status;

  @override
  String toString() {
    return 'TreeNodeModel(id: $id, name: $name, parentId: $parentId, locationId: $locationId, sensorId: $sensorId, sensorType: $sensorType, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreeNodeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.sensorId, sensorId) ||
                other.sensorId == sensorId) &&
            (identical(other.sensorType, sensorType) ||
                other.sensorType == sensorType) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, parentId, locationId,
      sensorId, sensorType, status);

  /// Create a copy of TreeNodeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TreeNodeModelImplCopyWith<_$TreeNodeModelImpl> get copyWith =>
      __$$TreeNodeModelImplCopyWithImpl<_$TreeNodeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TreeNodeModelImplToJson(
      this,
    );
  }
}

abstract class _TreeNodeModel extends TreeNodeModel {
  const factory _TreeNodeModel(
      {required final String id,
      required final String name,
      final String? parentId,
      final String? locationId,
      final String? sensorId,
      final SensorTypeModel? sensorType,
      final SensorStatusModel? status}) = _$TreeNodeModelImpl;
  const _TreeNodeModel._() : super._();

  factory _TreeNodeModel.fromJson(Map<String, dynamic> json) =
      _$TreeNodeModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get parentId;
  @override
  String? get locationId;
  @override
  String? get sensorId;
  @override
  SensorTypeModel? get sensorType;
  @override
  SensorStatusModel? get status;

  /// Create a copy of TreeNodeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TreeNodeModelImplCopyWith<_$TreeNodeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
