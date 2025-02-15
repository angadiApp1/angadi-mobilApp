import 'package:angadiapp/src/features/home_shops/data/response/get_location_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_state.freezed.dart';
part 'home_state.g.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(null) String? selectedDistrict,
    @Default(null) LocationData? selectedLocation,
    @Default([]) List<CountryData> availableCountries,
    @Default([]) List<StateData> availableStates,
    @Default([]) List<DistrictData> availableDistricts,
    @Default([]) List<LocationData> availableLocations,
  }) = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}

@Riverpod(keepAlive: true)
class HomeStateProvider extends _$HomeStateProvider {
  @override
  HomeState build() {
    return const HomeState();
  }

  void setSelectedLocation(LocationData? location) {
    state = state.copyWith(selectedLocation: location);
  }
  void setSelectedDistrict(String? district) {
    state = state.copyWith(selectedDistrict: district);
  }

  void setAvailableLocations(GetLocationResponseModel? response) {
    if (response == null) {
      state = state.copyWith(
        availableCountries: [],
        availableStates: [],
        availableDistricts: [],
        availableLocations: [],
      );
      return;
    }

    // Set countries
    final countries = response.locations;
    
    // Extract all states from all countries
    final states = countries.expand((country) => country.states).toList();
    
    // Extract all districts from all states
    final districts = states.expand((state) => state.districts).toList();
    
    // Extract all locations from all districts
    final locations = districts
        .expand((district) => district.locations)
        .toList();

    state = state.copyWith(
      availableCountries: countries,
      availableStates: states,
      availableDistricts: districts,
      availableLocations: locations,
    );
  }

  // Helper methods to get filtered data
  List<StateData> getStatesForCountry(String countryId) {
    final country = state.availableCountries
        .firstWhere((country) => country.id == countryId);
    return country.states;
  }

  List<DistrictData> getDistrictsForState(String stateId) {
    final state = this.state.availableStates
        .firstWhere((state) => state.id == stateId);
    return state.districts;
  }

  List<LocationData> getLocationsForDistrict(String districtId) {
    final district = state.availableDistricts
        .firstWhere((district) => district.id == districtId);
    return district.locations;
  }
}