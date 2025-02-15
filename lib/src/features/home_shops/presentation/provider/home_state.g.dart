// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeStateImpl _$$HomeStateImplFromJson(Map<String, dynamic> json) =>
    _$HomeStateImpl(
      selectedDistrict: json['selectedDistrict'] as String? ?? null,
      selectedLocation: json['selectedLocation'] == null
          ? null
          : LocationData.fromJson(
              json['selectedLocation'] as Map<String, dynamic>),
      availableCountries: (json['availableCountries'] as List<dynamic>?)
              ?.map((e) => CountryData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      availableStates: (json['availableStates'] as List<dynamic>?)
              ?.map((e) => StateData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      availableDistricts: (json['availableDistricts'] as List<dynamic>?)
              ?.map((e) => DistrictData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      availableLocations: (json['availableLocations'] as List<dynamic>?)
              ?.map((e) => LocationData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$HomeStateImplToJson(_$HomeStateImpl instance) =>
    <String, dynamic>{
      'selectedDistrict': instance.selectedDistrict,
      'selectedLocation': instance.selectedLocation,
      'availableCountries': instance.availableCountries,
      'availableStates': instance.availableStates,
      'availableDistricts': instance.availableDistricts,
      'availableLocations': instance.availableLocations,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeStateProviderHash() => r'8d6d897d9922d8b3548a9ae9ed937a3a9dd89631';

/// See also [HomeStateProvider].
@ProviderFor(HomeStateProvider)
final homeStateProviderProvider =
    NotifierProvider<HomeStateProvider, HomeState>.internal(
  HomeStateProvider.new,
  name: r'homeStateProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homeStateProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomeStateProvider = Notifier<HomeState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
