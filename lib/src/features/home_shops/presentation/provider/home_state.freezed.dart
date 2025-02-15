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

HomeState _$HomeStateFromJson(Map<String, dynamic> json) {
  return _HomeState.fromJson(json);
}

/// @nodoc
mixin _$HomeState {
  String? get selectedDistrict => throw _privateConstructorUsedError;
  LocationData? get selectedLocation => throw _privateConstructorUsedError;
  List<CountryData> get availableCountries =>
      throw _privateConstructorUsedError;
  List<StateData> get availableStates => throw _privateConstructorUsedError;
  List<DistrictData> get availableDistricts =>
      throw _privateConstructorUsedError;
  List<LocationData> get availableLocations =>
      throw _privateConstructorUsedError;

  /// Serializes this HomeState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {String? selectedDistrict,
      LocationData? selectedLocation,
      List<CountryData> availableCountries,
      List<StateData> availableStates,
      List<DistrictData> availableDistricts,
      List<LocationData> availableLocations});
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
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDistrict = freezed,
    Object? selectedLocation = freezed,
    Object? availableCountries = null,
    Object? availableStates = null,
    Object? availableDistricts = null,
    Object? availableLocations = null,
  }) {
    return _then(_value.copyWith(
      selectedDistrict: freezed == selectedDistrict
          ? _value.selectedDistrict
          : selectedDistrict // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedLocation: freezed == selectedLocation
          ? _value.selectedLocation
          : selectedLocation // ignore: cast_nullable_to_non_nullable
              as LocationData?,
      availableCountries: null == availableCountries
          ? _value.availableCountries
          : availableCountries // ignore: cast_nullable_to_non_nullable
              as List<CountryData>,
      availableStates: null == availableStates
          ? _value.availableStates
          : availableStates // ignore: cast_nullable_to_non_nullable
              as List<StateData>,
      availableDistricts: null == availableDistricts
          ? _value.availableDistricts
          : availableDistricts // ignore: cast_nullable_to_non_nullable
              as List<DistrictData>,
      availableLocations: null == availableLocations
          ? _value.availableLocations
          : availableLocations // ignore: cast_nullable_to_non_nullable
              as List<LocationData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? selectedDistrict,
      LocationData? selectedLocation,
      List<CountryData> availableCountries,
      List<StateData> availableStates,
      List<DistrictData> availableDistricts,
      List<LocationData> availableLocations});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDistrict = freezed,
    Object? selectedLocation = freezed,
    Object? availableCountries = null,
    Object? availableStates = null,
    Object? availableDistricts = null,
    Object? availableLocations = null,
  }) {
    return _then(_$HomeStateImpl(
      selectedDistrict: freezed == selectedDistrict
          ? _value.selectedDistrict
          : selectedDistrict // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedLocation: freezed == selectedLocation
          ? _value.selectedLocation
          : selectedLocation // ignore: cast_nullable_to_non_nullable
              as LocationData?,
      availableCountries: null == availableCountries
          ? _value._availableCountries
          : availableCountries // ignore: cast_nullable_to_non_nullable
              as List<CountryData>,
      availableStates: null == availableStates
          ? _value._availableStates
          : availableStates // ignore: cast_nullable_to_non_nullable
              as List<StateData>,
      availableDistricts: null == availableDistricts
          ? _value._availableDistricts
          : availableDistricts // ignore: cast_nullable_to_non_nullable
              as List<DistrictData>,
      availableLocations: null == availableLocations
          ? _value._availableLocations
          : availableLocations // ignore: cast_nullable_to_non_nullable
              as List<LocationData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {this.selectedDistrict = null,
      this.selectedLocation = null,
      final List<CountryData> availableCountries = const [],
      final List<StateData> availableStates = const [],
      final List<DistrictData> availableDistricts = const [],
      final List<LocationData> availableLocations = const []})
      : _availableCountries = availableCountries,
        _availableStates = availableStates,
        _availableDistricts = availableDistricts,
        _availableLocations = availableLocations;

  factory _$HomeStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeStateImplFromJson(json);

  @override
  @JsonKey()
  final String? selectedDistrict;
  @override
  @JsonKey()
  final LocationData? selectedLocation;
  final List<CountryData> _availableCountries;
  @override
  @JsonKey()
  List<CountryData> get availableCountries {
    if (_availableCountries is EqualUnmodifiableListView)
      return _availableCountries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableCountries);
  }

  final List<StateData> _availableStates;
  @override
  @JsonKey()
  List<StateData> get availableStates {
    if (_availableStates is EqualUnmodifiableListView) return _availableStates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableStates);
  }

  final List<DistrictData> _availableDistricts;
  @override
  @JsonKey()
  List<DistrictData> get availableDistricts {
    if (_availableDistricts is EqualUnmodifiableListView)
      return _availableDistricts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableDistricts);
  }

  final List<LocationData> _availableLocations;
  @override
  @JsonKey()
  List<LocationData> get availableLocations {
    if (_availableLocations is EqualUnmodifiableListView)
      return _availableLocations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableLocations);
  }

  @override
  String toString() {
    return 'HomeState(selectedDistrict: $selectedDistrict, selectedLocation: $selectedLocation, availableCountries: $availableCountries, availableStates: $availableStates, availableDistricts: $availableDistricts, availableLocations: $availableLocations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.selectedDistrict, selectedDistrict) ||
                other.selectedDistrict == selectedDistrict) &&
            (identical(other.selectedLocation, selectedLocation) ||
                other.selectedLocation == selectedLocation) &&
            const DeepCollectionEquality()
                .equals(other._availableCountries, _availableCountries) &&
            const DeepCollectionEquality()
                .equals(other._availableStates, _availableStates) &&
            const DeepCollectionEquality()
                .equals(other._availableDistricts, _availableDistricts) &&
            const DeepCollectionEquality()
                .equals(other._availableLocations, _availableLocations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedDistrict,
      selectedLocation,
      const DeepCollectionEquality().hash(_availableCountries),
      const DeepCollectionEquality().hash(_availableStates),
      const DeepCollectionEquality().hash(_availableDistricts),
      const DeepCollectionEquality().hash(_availableLocations));

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeStateImplToJson(
      this,
    );
  }
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final String? selectedDistrict,
      final LocationData? selectedLocation,
      final List<CountryData> availableCountries,
      final List<StateData> availableStates,
      final List<DistrictData> availableDistricts,
      final List<LocationData> availableLocations}) = _$HomeStateImpl;

  factory _HomeState.fromJson(Map<String, dynamic> json) =
      _$HomeStateImpl.fromJson;

  @override
  String? get selectedDistrict;
  @override
  LocationData? get selectedLocation;
  @override
  List<CountryData> get availableCountries;
  @override
  List<StateData> get availableStates;
  @override
  List<DistrictData> get availableDistricts;
  @override
  List<LocationData> get availableLocations;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
