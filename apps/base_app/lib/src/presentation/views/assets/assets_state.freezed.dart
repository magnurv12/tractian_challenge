// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assets_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AssetsState {}

/// @nodoc
abstract class $AssetsStateCopyWith<$Res> {
  factory $AssetsStateCopyWith(
          AssetsState value, $Res Function(AssetsState) then) =
      _$AssetsStateCopyWithImpl<$Res, AssetsState>;
}

/// @nodoc
class _$AssetsStateCopyWithImpl<$Res, $Val extends AssetsState>
    implements $AssetsStateCopyWith<$Res> {
  _$AssetsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssetsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AssetsStateLoadingImplCopyWith<$Res> {
  factory _$$AssetsStateLoadingImplCopyWith(_$AssetsStateLoadingImpl value,
          $Res Function(_$AssetsStateLoadingImpl) then) =
      __$$AssetsStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AssetsStateLoadingImplCopyWithImpl<$Res>
    extends _$AssetsStateCopyWithImpl<$Res, _$AssetsStateLoadingImpl>
    implements _$$AssetsStateLoadingImplCopyWith<$Res> {
  __$$AssetsStateLoadingImplCopyWithImpl(_$AssetsStateLoadingImpl _value,
      $Res Function(_$AssetsStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssetsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AssetsStateLoadingImpl implements AssetsStateLoading {
  const _$AssetsStateLoadingImpl();

  @override
  String toString() {
    return 'AssetsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AssetsStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class AssetsStateLoading implements AssetsState {
  const factory AssetsStateLoading() = _$AssetsStateLoadingImpl;
}

/// @nodoc
abstract class _$$AssetsStateLoadedImplCopyWith<$Res> {
  factory _$$AssetsStateLoadedImplCopyWith(_$AssetsStateLoadedImpl value,
          $Res Function(_$AssetsStateLoadedImpl) then) =
      __$$AssetsStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TreeNode> nodes});
}

/// @nodoc
class __$$AssetsStateLoadedImplCopyWithImpl<$Res>
    extends _$AssetsStateCopyWithImpl<$Res, _$AssetsStateLoadedImpl>
    implements _$$AssetsStateLoadedImplCopyWith<$Res> {
  __$$AssetsStateLoadedImplCopyWithImpl(_$AssetsStateLoadedImpl _value,
      $Res Function(_$AssetsStateLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssetsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nodes = null,
  }) {
    return _then(_$AssetsStateLoadedImpl(
      nodes: null == nodes
          ? _value._nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<TreeNode>,
    ));
  }
}

/// @nodoc

class _$AssetsStateLoadedImpl implements AssetsStateLoaded {
  const _$AssetsStateLoadedImpl({required final List<TreeNode> nodes})
      : _nodes = nodes;

  final List<TreeNode> _nodes;
  @override
  List<TreeNode> get nodes {
    if (_nodes is EqualUnmodifiableListView) return _nodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nodes);
  }

  @override
  String toString() {
    return 'AssetsState.loaded(nodes: $nodes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetsStateLoadedImpl &&
            const DeepCollectionEquality().equals(other._nodes, _nodes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_nodes));

  /// Create a copy of AssetsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetsStateLoadedImplCopyWith<_$AssetsStateLoadedImpl> get copyWith =>
      __$$AssetsStateLoadedImplCopyWithImpl<_$AssetsStateLoadedImpl>(
          this, _$identity);
}

abstract class AssetsStateLoaded implements AssetsState {
  const factory AssetsStateLoaded({required final List<TreeNode> nodes}) =
      _$AssetsStateLoadedImpl;

  List<TreeNode> get nodes;

  /// Create a copy of AssetsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssetsStateLoadedImplCopyWith<_$AssetsStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AssetsStateErrorImplCopyWith<$Res> {
  factory _$$AssetsStateErrorImplCopyWith(_$AssetsStateErrorImpl value,
          $Res Function(_$AssetsStateErrorImpl) then) =
      __$$AssetsStateErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AssetsStateErrorImplCopyWithImpl<$Res>
    extends _$AssetsStateCopyWithImpl<$Res, _$AssetsStateErrorImpl>
    implements _$$AssetsStateErrorImplCopyWith<$Res> {
  __$$AssetsStateErrorImplCopyWithImpl(_$AssetsStateErrorImpl _value,
      $Res Function(_$AssetsStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssetsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AssetsStateErrorImpl implements AssetsStateError {
  const _$AssetsStateErrorImpl();

  @override
  String toString() {
    return 'AssetsState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AssetsStateErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class AssetsStateError implements AssetsState {
  const factory AssetsStateError() = _$AssetsStateErrorImpl;
}
