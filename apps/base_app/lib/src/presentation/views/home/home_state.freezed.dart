// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$HomeStateLoadingImplCopyWith<$Res> {
  factory _$$HomeStateLoadingImplCopyWith(_$HomeStateLoadingImpl value,
          $Res Function(_$HomeStateLoadingImpl) then) =
      __$$HomeStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeStateLoadingImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateLoadingImpl>
    implements _$$HomeStateLoadingImplCopyWith<$Res> {
  __$$HomeStateLoadingImplCopyWithImpl(_$HomeStateLoadingImpl _value,
      $Res Function(_$HomeStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HomeStateLoadingImpl implements HomeStateLoading {
  const _$HomeStateLoadingImpl();

  @override
  String toString() {
    return 'HomeState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class HomeStateLoading implements HomeState {
  const factory HomeStateLoading() = _$HomeStateLoadingImpl;
}

/// @nodoc
abstract class _$$HomeStateLoadedImplCopyWith<$Res> {
  factory _$$HomeStateLoadedImplCopyWith(_$HomeStateLoadedImpl value,
          $Res Function(_$HomeStateLoadedImpl) then) =
      __$$HomeStateLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Company> companies});
}

/// @nodoc
class __$$HomeStateLoadedImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateLoadedImpl>
    implements _$$HomeStateLoadedImplCopyWith<$Res> {
  __$$HomeStateLoadedImplCopyWithImpl(
      _$HomeStateLoadedImpl _value, $Res Function(_$HomeStateLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companies = null,
  }) {
    return _then(_$HomeStateLoadedImpl(
      companies: null == companies
          ? _value._companies
          : companies // ignore: cast_nullable_to_non_nullable
              as List<Company>,
    ));
  }
}

/// @nodoc

class _$HomeStateLoadedImpl implements HomeStateLoaded {
  const _$HomeStateLoadedImpl({required final List<Company> companies})
      : _companies = companies;

  final List<Company> _companies;
  @override
  List<Company> get companies {
    if (_companies is EqualUnmodifiableListView) return _companies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_companies);
  }

  @override
  String toString() {
    return 'HomeState.loaded(companies: $companies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._companies, _companies));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_companies));

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateLoadedImplCopyWith<_$HomeStateLoadedImpl> get copyWith =>
      __$$HomeStateLoadedImplCopyWithImpl<_$HomeStateLoadedImpl>(
          this, _$identity);
}

abstract class HomeStateLoaded implements HomeState {
  const factory HomeStateLoaded({required final List<Company> companies}) =
      _$HomeStateLoadedImpl;

  List<Company> get companies;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateLoadedImplCopyWith<_$HomeStateLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeStateErrorImplCopyWith<$Res> {
  factory _$$HomeStateErrorImplCopyWith(_$HomeStateErrorImpl value,
          $Res Function(_$HomeStateErrorImpl) then) =
      __$$HomeStateErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeStateErrorImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateErrorImpl>
    implements _$$HomeStateErrorImplCopyWith<$Res> {
  __$$HomeStateErrorImplCopyWithImpl(
      _$HomeStateErrorImpl _value, $Res Function(_$HomeStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HomeStateErrorImpl implements HomeStateError {
  const _$HomeStateErrorImpl();

  @override
  String toString() {
    return 'HomeState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeStateErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class HomeStateError implements HomeState {
  const factory HomeStateError() = _$HomeStateErrorImpl;
}
