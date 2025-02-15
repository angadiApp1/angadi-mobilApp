// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getLocationData,
    required TResult Function(String locationId) getCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getLocationData,
    TResult? Function(String locationId)? getCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getLocationData,
    TResult Function(String locationId)? getCategories,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetLocationData value) getLocationData,
    required TResult Function(_GetCategories value) getCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetLocationData value)? getLocationData,
    TResult? Function(_GetCategories value)? getCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetLocationData value)? getLocationData,
    TResult Function(_GetCategories value)? getCategories,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'HomeEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getLocationData,
    required TResult Function(String locationId) getCategories,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getLocationData,
    TResult? Function(String locationId)? getCategories,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getLocationData,
    TResult Function(String locationId)? getCategories,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetLocationData value) getLocationData,
    required TResult Function(_GetCategories value) getCategories,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetLocationData value)? getLocationData,
    TResult? Function(_GetCategories value)? getCategories,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetLocationData value)? getLocationData,
    TResult Function(_GetCategories value)? getCategories,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements HomeEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetLocationDataImplCopyWith<$Res> {
  factory _$$GetLocationDataImplCopyWith(_$GetLocationDataImpl value,
          $Res Function(_$GetLocationDataImpl) then) =
      __$$GetLocationDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetLocationDataImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetLocationDataImpl>
    implements _$$GetLocationDataImplCopyWith<$Res> {
  __$$GetLocationDataImplCopyWithImpl(
      _$GetLocationDataImpl _value, $Res Function(_$GetLocationDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetLocationDataImpl implements _GetLocationData {
  const _$GetLocationDataImpl();

  @override
  String toString() {
    return 'HomeEvent.getLocationData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetLocationDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getLocationData,
    required TResult Function(String locationId) getCategories,
  }) {
    return getLocationData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getLocationData,
    TResult? Function(String locationId)? getCategories,
  }) {
    return getLocationData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getLocationData,
    TResult Function(String locationId)? getCategories,
    required TResult orElse(),
  }) {
    if (getLocationData != null) {
      return getLocationData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetLocationData value) getLocationData,
    required TResult Function(_GetCategories value) getCategories,
  }) {
    return getLocationData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetLocationData value)? getLocationData,
    TResult? Function(_GetCategories value)? getCategories,
  }) {
    return getLocationData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetLocationData value)? getLocationData,
    TResult Function(_GetCategories value)? getCategories,
    required TResult orElse(),
  }) {
    if (getLocationData != null) {
      return getLocationData(this);
    }
    return orElse();
  }
}

abstract class _GetLocationData implements HomeEvent {
  const factory _GetLocationData() = _$GetLocationDataImpl;
}

/// @nodoc
abstract class _$$GetCategoriesImplCopyWith<$Res> {
  factory _$$GetCategoriesImplCopyWith(
          _$GetCategoriesImpl value, $Res Function(_$GetCategoriesImpl) then) =
      __$$GetCategoriesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String locationId});
}

/// @nodoc
class __$$GetCategoriesImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetCategoriesImpl>
    implements _$$GetCategoriesImplCopyWith<$Res> {
  __$$GetCategoriesImplCopyWithImpl(
      _$GetCategoriesImpl _value, $Res Function(_$GetCategoriesImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationId = null,
  }) {
    return _then(_$GetCategoriesImpl(
      null == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetCategoriesImpl implements _GetCategories {
  const _$GetCategoriesImpl(this.locationId);

  @override
  final String locationId;

  @override
  String toString() {
    return 'HomeEvent.getCategories(locationId: $locationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCategoriesImpl &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locationId);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCategoriesImplCopyWith<_$GetCategoriesImpl> get copyWith =>
      __$$GetCategoriesImplCopyWithImpl<_$GetCategoriesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getLocationData,
    required TResult Function(String locationId) getCategories,
  }) {
    return getCategories(locationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getLocationData,
    TResult? Function(String locationId)? getCategories,
  }) {
    return getCategories?.call(locationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getLocationData,
    TResult Function(String locationId)? getCategories,
    required TResult orElse(),
  }) {
    if (getCategories != null) {
      return getCategories(locationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetLocationData value) getLocationData,
    required TResult Function(_GetCategories value) getCategories,
  }) {
    return getCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetLocationData value)? getLocationData,
    TResult? Function(_GetCategories value)? getCategories,
  }) {
    return getCategories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetLocationData value)? getLocationData,
    TResult Function(_GetCategories value)? getCategories,
    required TResult orElse(),
  }) {
    if (getCategories != null) {
      return getCategories(this);
    }
    return orElse();
  }
}

abstract class _GetCategories implements HomeEvent {
  const factory _GetCategories(final String locationId) = _$GetCategoriesImpl;

  String get locationId;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetCategoriesImplCopyWith<_$GetCategoriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingLocationData,
    required TResult Function(GetLocationResponseModel? response)
        loadedLocationData,
    required TResult Function(String message) errorLocationData,
    required TResult Function() loadingCategories,
    required TResult Function(dynamic response) loadedCategories,
    required TResult Function(String message) errorCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingLocationData,
    TResult? Function(GetLocationResponseModel? response)? loadedLocationData,
    TResult? Function(String message)? errorLocationData,
    TResult? Function()? loadingCategories,
    TResult? Function(dynamic response)? loadedCategories,
    TResult? Function(String message)? errorCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingLocationData,
    TResult Function(GetLocationResponseModel? response)? loadedLocationData,
    TResult Function(String message)? errorLocationData,
    TResult Function()? loadingCategories,
    TResult Function(dynamic response)? loadedCategories,
    TResult Function(String message)? errorCategories,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingLocationData value) loadingLocationData,
    required TResult Function(_LoadedLocationData value) loadedLocationData,
    required TResult Function(_ErrorLocationData value) errorLocationData,
    required TResult Function(_LoadingCategories value) loadingCategories,
    required TResult Function(_LoadedCategories value) loadedCategories,
    required TResult Function(_ErrorCategories value) errorCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingLocationData value)? loadingLocationData,
    TResult? Function(_LoadedLocationData value)? loadedLocationData,
    TResult? Function(_ErrorLocationData value)? errorLocationData,
    TResult? Function(_LoadingCategories value)? loadingCategories,
    TResult? Function(_LoadedCategories value)? loadedCategories,
    TResult? Function(_ErrorCategories value)? errorCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingLocationData value)? loadingLocationData,
    TResult Function(_LoadedLocationData value)? loadedLocationData,
    TResult Function(_ErrorLocationData value)? errorLocationData,
    TResult Function(_LoadingCategories value)? loadingCategories,
    TResult Function(_LoadedCategories value)? loadedCategories,
    TResult Function(_ErrorCategories value)? errorCategories,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeBlocStateCopyWith<$Res> {
  factory $HomeBlocStateCopyWith(
          HomeBlocState value, $Res Function(HomeBlocState) then) =
      _$HomeBlocStateCopyWithImpl<$Res, HomeBlocState>;
}

/// @nodoc
class _$HomeBlocStateCopyWithImpl<$Res, $Val extends HomeBlocState>
    implements $HomeBlocStateCopyWith<$Res> {
  _$HomeBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeBlocState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HomeBlocStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeBlocState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'HomeBlocState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingLocationData,
    required TResult Function(GetLocationResponseModel? response)
        loadedLocationData,
    required TResult Function(String message) errorLocationData,
    required TResult Function() loadingCategories,
    required TResult Function(dynamic response) loadedCategories,
    required TResult Function(String message) errorCategories,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingLocationData,
    TResult? Function(GetLocationResponseModel? response)? loadedLocationData,
    TResult? Function(String message)? errorLocationData,
    TResult? Function()? loadingCategories,
    TResult? Function(dynamic response)? loadedCategories,
    TResult? Function(String message)? errorCategories,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingLocationData,
    TResult Function(GetLocationResponseModel? response)? loadedLocationData,
    TResult Function(String message)? errorLocationData,
    TResult Function()? loadingCategories,
    TResult Function(dynamic response)? loadedCategories,
    TResult Function(String message)? errorCategories,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingLocationData value) loadingLocationData,
    required TResult Function(_LoadedLocationData value) loadedLocationData,
    required TResult Function(_ErrorLocationData value) errorLocationData,
    required TResult Function(_LoadingCategories value) loadingCategories,
    required TResult Function(_LoadedCategories value) loadedCategories,
    required TResult Function(_ErrorCategories value) errorCategories,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingLocationData value)? loadingLocationData,
    TResult? Function(_LoadedLocationData value)? loadedLocationData,
    TResult? Function(_ErrorLocationData value)? errorLocationData,
    TResult? Function(_LoadingCategories value)? loadingCategories,
    TResult? Function(_LoadedCategories value)? loadedCategories,
    TResult? Function(_ErrorCategories value)? errorCategories,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingLocationData value)? loadingLocationData,
    TResult Function(_LoadedLocationData value)? loadedLocationData,
    TResult Function(_ErrorLocationData value)? errorLocationData,
    TResult Function(_LoadingCategories value)? loadingCategories,
    TResult Function(_LoadedCategories value)? loadedCategories,
    TResult Function(_ErrorCategories value)? errorCategories,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomeBlocState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingLocationDataImplCopyWith<$Res> {
  factory _$$LoadingLocationDataImplCopyWith(_$LoadingLocationDataImpl value,
          $Res Function(_$LoadingLocationDataImpl) then) =
      __$$LoadingLocationDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingLocationDataImplCopyWithImpl<$Res>
    extends _$HomeBlocStateCopyWithImpl<$Res, _$LoadingLocationDataImpl>
    implements _$$LoadingLocationDataImplCopyWith<$Res> {
  __$$LoadingLocationDataImplCopyWithImpl(_$LoadingLocationDataImpl _value,
      $Res Function(_$LoadingLocationDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeBlocState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingLocationDataImpl implements _LoadingLocationData {
  const _$LoadingLocationDataImpl();

  @override
  String toString() {
    return 'HomeBlocState.loadingLocationData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingLocationDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingLocationData,
    required TResult Function(GetLocationResponseModel? response)
        loadedLocationData,
    required TResult Function(String message) errorLocationData,
    required TResult Function() loadingCategories,
    required TResult Function(dynamic response) loadedCategories,
    required TResult Function(String message) errorCategories,
  }) {
    return loadingLocationData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingLocationData,
    TResult? Function(GetLocationResponseModel? response)? loadedLocationData,
    TResult? Function(String message)? errorLocationData,
    TResult? Function()? loadingCategories,
    TResult? Function(dynamic response)? loadedCategories,
    TResult? Function(String message)? errorCategories,
  }) {
    return loadingLocationData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingLocationData,
    TResult Function(GetLocationResponseModel? response)? loadedLocationData,
    TResult Function(String message)? errorLocationData,
    TResult Function()? loadingCategories,
    TResult Function(dynamic response)? loadedCategories,
    TResult Function(String message)? errorCategories,
    required TResult orElse(),
  }) {
    if (loadingLocationData != null) {
      return loadingLocationData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingLocationData value) loadingLocationData,
    required TResult Function(_LoadedLocationData value) loadedLocationData,
    required TResult Function(_ErrorLocationData value) errorLocationData,
    required TResult Function(_LoadingCategories value) loadingCategories,
    required TResult Function(_LoadedCategories value) loadedCategories,
    required TResult Function(_ErrorCategories value) errorCategories,
  }) {
    return loadingLocationData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingLocationData value)? loadingLocationData,
    TResult? Function(_LoadedLocationData value)? loadedLocationData,
    TResult? Function(_ErrorLocationData value)? errorLocationData,
    TResult? Function(_LoadingCategories value)? loadingCategories,
    TResult? Function(_LoadedCategories value)? loadedCategories,
    TResult? Function(_ErrorCategories value)? errorCategories,
  }) {
    return loadingLocationData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingLocationData value)? loadingLocationData,
    TResult Function(_LoadedLocationData value)? loadedLocationData,
    TResult Function(_ErrorLocationData value)? errorLocationData,
    TResult Function(_LoadingCategories value)? loadingCategories,
    TResult Function(_LoadedCategories value)? loadedCategories,
    TResult Function(_ErrorCategories value)? errorCategories,
    required TResult orElse(),
  }) {
    if (loadingLocationData != null) {
      return loadingLocationData(this);
    }
    return orElse();
  }
}

abstract class _LoadingLocationData implements HomeBlocState {
  const factory _LoadingLocationData() = _$LoadingLocationDataImpl;
}

/// @nodoc
abstract class _$$LoadedLocationDataImplCopyWith<$Res> {
  factory _$$LoadedLocationDataImplCopyWith(_$LoadedLocationDataImpl value,
          $Res Function(_$LoadedLocationDataImpl) then) =
      __$$LoadedLocationDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GetLocationResponseModel? response});
}

/// @nodoc
class __$$LoadedLocationDataImplCopyWithImpl<$Res>
    extends _$HomeBlocStateCopyWithImpl<$Res, _$LoadedLocationDataImpl>
    implements _$$LoadedLocationDataImplCopyWith<$Res> {
  __$$LoadedLocationDataImplCopyWithImpl(_$LoadedLocationDataImpl _value,
      $Res Function(_$LoadedLocationDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_$LoadedLocationDataImpl(
      freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as GetLocationResponseModel?,
    ));
  }
}

/// @nodoc

class _$LoadedLocationDataImpl implements _LoadedLocationData {
  const _$LoadedLocationDataImpl(this.response);

  @override
  final GetLocationResponseModel? response;

  @override
  String toString() {
    return 'HomeBlocState.loadedLocationData(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedLocationDataImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  /// Create a copy of HomeBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedLocationDataImplCopyWith<_$LoadedLocationDataImpl> get copyWith =>
      __$$LoadedLocationDataImplCopyWithImpl<_$LoadedLocationDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingLocationData,
    required TResult Function(GetLocationResponseModel? response)
        loadedLocationData,
    required TResult Function(String message) errorLocationData,
    required TResult Function() loadingCategories,
    required TResult Function(dynamic response) loadedCategories,
    required TResult Function(String message) errorCategories,
  }) {
    return loadedLocationData(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingLocationData,
    TResult? Function(GetLocationResponseModel? response)? loadedLocationData,
    TResult? Function(String message)? errorLocationData,
    TResult? Function()? loadingCategories,
    TResult? Function(dynamic response)? loadedCategories,
    TResult? Function(String message)? errorCategories,
  }) {
    return loadedLocationData?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingLocationData,
    TResult Function(GetLocationResponseModel? response)? loadedLocationData,
    TResult Function(String message)? errorLocationData,
    TResult Function()? loadingCategories,
    TResult Function(dynamic response)? loadedCategories,
    TResult Function(String message)? errorCategories,
    required TResult orElse(),
  }) {
    if (loadedLocationData != null) {
      return loadedLocationData(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingLocationData value) loadingLocationData,
    required TResult Function(_LoadedLocationData value) loadedLocationData,
    required TResult Function(_ErrorLocationData value) errorLocationData,
    required TResult Function(_LoadingCategories value) loadingCategories,
    required TResult Function(_LoadedCategories value) loadedCategories,
    required TResult Function(_ErrorCategories value) errorCategories,
  }) {
    return loadedLocationData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingLocationData value)? loadingLocationData,
    TResult? Function(_LoadedLocationData value)? loadedLocationData,
    TResult? Function(_ErrorLocationData value)? errorLocationData,
    TResult? Function(_LoadingCategories value)? loadingCategories,
    TResult? Function(_LoadedCategories value)? loadedCategories,
    TResult? Function(_ErrorCategories value)? errorCategories,
  }) {
    return loadedLocationData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingLocationData value)? loadingLocationData,
    TResult Function(_LoadedLocationData value)? loadedLocationData,
    TResult Function(_ErrorLocationData value)? errorLocationData,
    TResult Function(_LoadingCategories value)? loadingCategories,
    TResult Function(_LoadedCategories value)? loadedCategories,
    TResult Function(_ErrorCategories value)? errorCategories,
    required TResult orElse(),
  }) {
    if (loadedLocationData != null) {
      return loadedLocationData(this);
    }
    return orElse();
  }
}

abstract class _LoadedLocationData implements HomeBlocState {
  const factory _LoadedLocationData(final GetLocationResponseModel? response) =
      _$LoadedLocationDataImpl;

  GetLocationResponseModel? get response;

  /// Create a copy of HomeBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedLocationDataImplCopyWith<_$LoadedLocationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorLocationDataImplCopyWith<$Res> {
  factory _$$ErrorLocationDataImplCopyWith(_$ErrorLocationDataImpl value,
          $Res Function(_$ErrorLocationDataImpl) then) =
      __$$ErrorLocationDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorLocationDataImplCopyWithImpl<$Res>
    extends _$HomeBlocStateCopyWithImpl<$Res, _$ErrorLocationDataImpl>
    implements _$$ErrorLocationDataImplCopyWith<$Res> {
  __$$ErrorLocationDataImplCopyWithImpl(_$ErrorLocationDataImpl _value,
      $Res Function(_$ErrorLocationDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorLocationDataImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorLocationDataImpl implements _ErrorLocationData {
  const _$ErrorLocationDataImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'HomeBlocState.errorLocationData(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorLocationDataImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of HomeBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorLocationDataImplCopyWith<_$ErrorLocationDataImpl> get copyWith =>
      __$$ErrorLocationDataImplCopyWithImpl<_$ErrorLocationDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingLocationData,
    required TResult Function(GetLocationResponseModel? response)
        loadedLocationData,
    required TResult Function(String message) errorLocationData,
    required TResult Function() loadingCategories,
    required TResult Function(dynamic response) loadedCategories,
    required TResult Function(String message) errorCategories,
  }) {
    return errorLocationData(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingLocationData,
    TResult? Function(GetLocationResponseModel? response)? loadedLocationData,
    TResult? Function(String message)? errorLocationData,
    TResult? Function()? loadingCategories,
    TResult? Function(dynamic response)? loadedCategories,
    TResult? Function(String message)? errorCategories,
  }) {
    return errorLocationData?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingLocationData,
    TResult Function(GetLocationResponseModel? response)? loadedLocationData,
    TResult Function(String message)? errorLocationData,
    TResult Function()? loadingCategories,
    TResult Function(dynamic response)? loadedCategories,
    TResult Function(String message)? errorCategories,
    required TResult orElse(),
  }) {
    if (errorLocationData != null) {
      return errorLocationData(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingLocationData value) loadingLocationData,
    required TResult Function(_LoadedLocationData value) loadedLocationData,
    required TResult Function(_ErrorLocationData value) errorLocationData,
    required TResult Function(_LoadingCategories value) loadingCategories,
    required TResult Function(_LoadedCategories value) loadedCategories,
    required TResult Function(_ErrorCategories value) errorCategories,
  }) {
    return errorLocationData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingLocationData value)? loadingLocationData,
    TResult? Function(_LoadedLocationData value)? loadedLocationData,
    TResult? Function(_ErrorLocationData value)? errorLocationData,
    TResult? Function(_LoadingCategories value)? loadingCategories,
    TResult? Function(_LoadedCategories value)? loadedCategories,
    TResult? Function(_ErrorCategories value)? errorCategories,
  }) {
    return errorLocationData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingLocationData value)? loadingLocationData,
    TResult Function(_LoadedLocationData value)? loadedLocationData,
    TResult Function(_ErrorLocationData value)? errorLocationData,
    TResult Function(_LoadingCategories value)? loadingCategories,
    TResult Function(_LoadedCategories value)? loadedCategories,
    TResult Function(_ErrorCategories value)? errorCategories,
    required TResult orElse(),
  }) {
    if (errorLocationData != null) {
      return errorLocationData(this);
    }
    return orElse();
  }
}

abstract class _ErrorLocationData implements HomeBlocState {
  const factory _ErrorLocationData(final String message) =
      _$ErrorLocationDataImpl;

  String get message;

  /// Create a copy of HomeBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorLocationDataImplCopyWith<_$ErrorLocationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingCategoriesImplCopyWith<$Res> {
  factory _$$LoadingCategoriesImplCopyWith(_$LoadingCategoriesImpl value,
          $Res Function(_$LoadingCategoriesImpl) then) =
      __$$LoadingCategoriesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCategoriesImplCopyWithImpl<$Res>
    extends _$HomeBlocStateCopyWithImpl<$Res, _$LoadingCategoriesImpl>
    implements _$$LoadingCategoriesImplCopyWith<$Res> {
  __$$LoadingCategoriesImplCopyWithImpl(_$LoadingCategoriesImpl _value,
      $Res Function(_$LoadingCategoriesImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeBlocState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingCategoriesImpl implements _LoadingCategories {
  const _$LoadingCategoriesImpl();

  @override
  String toString() {
    return 'HomeBlocState.loadingCategories()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingCategoriesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingLocationData,
    required TResult Function(GetLocationResponseModel? response)
        loadedLocationData,
    required TResult Function(String message) errorLocationData,
    required TResult Function() loadingCategories,
    required TResult Function(dynamic response) loadedCategories,
    required TResult Function(String message) errorCategories,
  }) {
    return loadingCategories();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingLocationData,
    TResult? Function(GetLocationResponseModel? response)? loadedLocationData,
    TResult? Function(String message)? errorLocationData,
    TResult? Function()? loadingCategories,
    TResult? Function(dynamic response)? loadedCategories,
    TResult? Function(String message)? errorCategories,
  }) {
    return loadingCategories?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingLocationData,
    TResult Function(GetLocationResponseModel? response)? loadedLocationData,
    TResult Function(String message)? errorLocationData,
    TResult Function()? loadingCategories,
    TResult Function(dynamic response)? loadedCategories,
    TResult Function(String message)? errorCategories,
    required TResult orElse(),
  }) {
    if (loadingCategories != null) {
      return loadingCategories();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingLocationData value) loadingLocationData,
    required TResult Function(_LoadedLocationData value) loadedLocationData,
    required TResult Function(_ErrorLocationData value) errorLocationData,
    required TResult Function(_LoadingCategories value) loadingCategories,
    required TResult Function(_LoadedCategories value) loadedCategories,
    required TResult Function(_ErrorCategories value) errorCategories,
  }) {
    return loadingCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingLocationData value)? loadingLocationData,
    TResult? Function(_LoadedLocationData value)? loadedLocationData,
    TResult? Function(_ErrorLocationData value)? errorLocationData,
    TResult? Function(_LoadingCategories value)? loadingCategories,
    TResult? Function(_LoadedCategories value)? loadedCategories,
    TResult? Function(_ErrorCategories value)? errorCategories,
  }) {
    return loadingCategories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingLocationData value)? loadingLocationData,
    TResult Function(_LoadedLocationData value)? loadedLocationData,
    TResult Function(_ErrorLocationData value)? errorLocationData,
    TResult Function(_LoadingCategories value)? loadingCategories,
    TResult Function(_LoadedCategories value)? loadedCategories,
    TResult Function(_ErrorCategories value)? errorCategories,
    required TResult orElse(),
  }) {
    if (loadingCategories != null) {
      return loadingCategories(this);
    }
    return orElse();
  }
}

abstract class _LoadingCategories implements HomeBlocState {
  const factory _LoadingCategories() = _$LoadingCategoriesImpl;
}

/// @nodoc
abstract class _$$LoadedCategoriesImplCopyWith<$Res> {
  factory _$$LoadedCategoriesImplCopyWith(_$LoadedCategoriesImpl value,
          $Res Function(_$LoadedCategoriesImpl) then) =
      __$$LoadedCategoriesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic response});
}

/// @nodoc
class __$$LoadedCategoriesImplCopyWithImpl<$Res>
    extends _$HomeBlocStateCopyWithImpl<$Res, _$LoadedCategoriesImpl>
    implements _$$LoadedCategoriesImplCopyWith<$Res> {
  __$$LoadedCategoriesImplCopyWithImpl(_$LoadedCategoriesImpl _value,
      $Res Function(_$LoadedCategoriesImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_$LoadedCategoriesImpl(
      freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$LoadedCategoriesImpl implements _LoadedCategories {
  const _$LoadedCategoriesImpl(this.response);

  @override
  final dynamic response;

  @override
  String toString() {
    return 'HomeBlocState.loadedCategories(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedCategoriesImpl &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(response));

  /// Create a copy of HomeBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedCategoriesImplCopyWith<_$LoadedCategoriesImpl> get copyWith =>
      __$$LoadedCategoriesImplCopyWithImpl<_$LoadedCategoriesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingLocationData,
    required TResult Function(GetLocationResponseModel? response)
        loadedLocationData,
    required TResult Function(String message) errorLocationData,
    required TResult Function() loadingCategories,
    required TResult Function(dynamic response) loadedCategories,
    required TResult Function(String message) errorCategories,
  }) {
    return loadedCategories(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingLocationData,
    TResult? Function(GetLocationResponseModel? response)? loadedLocationData,
    TResult? Function(String message)? errorLocationData,
    TResult? Function()? loadingCategories,
    TResult? Function(dynamic response)? loadedCategories,
    TResult? Function(String message)? errorCategories,
  }) {
    return loadedCategories?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingLocationData,
    TResult Function(GetLocationResponseModel? response)? loadedLocationData,
    TResult Function(String message)? errorLocationData,
    TResult Function()? loadingCategories,
    TResult Function(dynamic response)? loadedCategories,
    TResult Function(String message)? errorCategories,
    required TResult orElse(),
  }) {
    if (loadedCategories != null) {
      return loadedCategories(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingLocationData value) loadingLocationData,
    required TResult Function(_LoadedLocationData value) loadedLocationData,
    required TResult Function(_ErrorLocationData value) errorLocationData,
    required TResult Function(_LoadingCategories value) loadingCategories,
    required TResult Function(_LoadedCategories value) loadedCategories,
    required TResult Function(_ErrorCategories value) errorCategories,
  }) {
    return loadedCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingLocationData value)? loadingLocationData,
    TResult? Function(_LoadedLocationData value)? loadedLocationData,
    TResult? Function(_ErrorLocationData value)? errorLocationData,
    TResult? Function(_LoadingCategories value)? loadingCategories,
    TResult? Function(_LoadedCategories value)? loadedCategories,
    TResult? Function(_ErrorCategories value)? errorCategories,
  }) {
    return loadedCategories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingLocationData value)? loadingLocationData,
    TResult Function(_LoadedLocationData value)? loadedLocationData,
    TResult Function(_ErrorLocationData value)? errorLocationData,
    TResult Function(_LoadingCategories value)? loadingCategories,
    TResult Function(_LoadedCategories value)? loadedCategories,
    TResult Function(_ErrorCategories value)? errorCategories,
    required TResult orElse(),
  }) {
    if (loadedCategories != null) {
      return loadedCategories(this);
    }
    return orElse();
  }
}

abstract class _LoadedCategories implements HomeBlocState {
  const factory _LoadedCategories(final dynamic response) =
      _$LoadedCategoriesImpl;

  dynamic get response;

  /// Create a copy of HomeBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedCategoriesImplCopyWith<_$LoadedCategoriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorCategoriesImplCopyWith<$Res> {
  factory _$$ErrorCategoriesImplCopyWith(_$ErrorCategoriesImpl value,
          $Res Function(_$ErrorCategoriesImpl) then) =
      __$$ErrorCategoriesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorCategoriesImplCopyWithImpl<$Res>
    extends _$HomeBlocStateCopyWithImpl<$Res, _$ErrorCategoriesImpl>
    implements _$$ErrorCategoriesImplCopyWith<$Res> {
  __$$ErrorCategoriesImplCopyWithImpl(
      _$ErrorCategoriesImpl _value, $Res Function(_$ErrorCategoriesImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorCategoriesImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorCategoriesImpl implements _ErrorCategories {
  const _$ErrorCategoriesImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'HomeBlocState.errorCategories(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorCategoriesImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of HomeBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorCategoriesImplCopyWith<_$ErrorCategoriesImpl> get copyWith =>
      __$$ErrorCategoriesImplCopyWithImpl<_$ErrorCategoriesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingLocationData,
    required TResult Function(GetLocationResponseModel? response)
        loadedLocationData,
    required TResult Function(String message) errorLocationData,
    required TResult Function() loadingCategories,
    required TResult Function(dynamic response) loadedCategories,
    required TResult Function(String message) errorCategories,
  }) {
    return errorCategories(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingLocationData,
    TResult? Function(GetLocationResponseModel? response)? loadedLocationData,
    TResult? Function(String message)? errorLocationData,
    TResult? Function()? loadingCategories,
    TResult? Function(dynamic response)? loadedCategories,
    TResult? Function(String message)? errorCategories,
  }) {
    return errorCategories?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingLocationData,
    TResult Function(GetLocationResponseModel? response)? loadedLocationData,
    TResult Function(String message)? errorLocationData,
    TResult Function()? loadingCategories,
    TResult Function(dynamic response)? loadedCategories,
    TResult Function(String message)? errorCategories,
    required TResult orElse(),
  }) {
    if (errorCategories != null) {
      return errorCategories(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingLocationData value) loadingLocationData,
    required TResult Function(_LoadedLocationData value) loadedLocationData,
    required TResult Function(_ErrorLocationData value) errorLocationData,
    required TResult Function(_LoadingCategories value) loadingCategories,
    required TResult Function(_LoadedCategories value) loadedCategories,
    required TResult Function(_ErrorCategories value) errorCategories,
  }) {
    return errorCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingLocationData value)? loadingLocationData,
    TResult? Function(_LoadedLocationData value)? loadedLocationData,
    TResult? Function(_ErrorLocationData value)? errorLocationData,
    TResult? Function(_LoadingCategories value)? loadingCategories,
    TResult? Function(_LoadedCategories value)? loadedCategories,
    TResult? Function(_ErrorCategories value)? errorCategories,
  }) {
    return errorCategories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingLocationData value)? loadingLocationData,
    TResult Function(_LoadedLocationData value)? loadedLocationData,
    TResult Function(_ErrorLocationData value)? errorLocationData,
    TResult Function(_LoadingCategories value)? loadingCategories,
    TResult Function(_LoadedCategories value)? loadedCategories,
    TResult Function(_ErrorCategories value)? errorCategories,
    required TResult orElse(),
  }) {
    if (errorCategories != null) {
      return errorCategories(this);
    }
    return orElse();
  }
}

abstract class _ErrorCategories implements HomeBlocState {
  const factory _ErrorCategories(final String message) = _$ErrorCategoriesImpl;

  String get message;

  /// Create a copy of HomeBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorCategoriesImplCopyWith<_$ErrorCategoriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
