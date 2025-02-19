import 'package:angadiapp/src/features/home_shops/data/response/fetch_shops_model.dart';
import 'package:angadiapp/src/features/home_shops/data/response/get_categories_model.dart';
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
    @Default([]) List<CategoryData> availableCategories,
    @Default([]) List<String> advertisementBanners,
    @Default([]) List<ShopData> availableShops,
    @Default([]) List<ShopData> filteredShops,
    @Default("All offers") String selectedCategory,
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

  void setAvailableShops(List<ShopData> shops) {
    // Update available shops and immediately filter them based on current category
    state = state.copyWith(availableShops: shops);

    // Always apply current category filter when shops are updated
    _applyCurrentCategoryFilter();
  }

  void setSelectedCategory(String category) {
    state = state.copyWith(selectedCategory: category);
    _applyCurrentCategoryFilter();
  }

  // Helper method to apply current category filter
  void _applyCurrentCategoryFilter() {
    if (state.selectedCategory == "All offers") {
      state = state.copyWith(filteredShops: state.availableShops);
    } else {
      final filteredShops = state.availableShops.where((shop) {
        // Filter shops based on category
        return shop.categoryName.contains(state.selectedCategory);
      }).toList();

      state = state.copyWith(filteredShops: filteredShops);
    }
  }

  void setAdvertisementBanners(List<String> banners) {
    state = state.copyWith(advertisementBanners: banners);
  }

  void setSelectedLocation(LocationData? location) {
    state = state.copyWith(selectedLocation: location);

    // Reset filtered shops to empty when location changes
    // The UI will show loading state until new shops are fetched
    state = state.copyWith(filteredShops: []);
  }

  void setSelectedDistrict(String? district) {
    state = state.copyWith(selectedDistrict: district);
  }

  void setAvailableCategories(GetCategoriesResponseModel? response) {
    state = state.copyWith(availableCategories: response?.categories ?? []);
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
    final locations =
        districts.expand((district) => district.locations).toList();

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
    final state =
        this.state.availableStates.firstWhere((state) => state.id == stateId);
    return state.districts;
  }

  List<LocationData> getLocationsForDistrict(String districtId) {
    final district = state.availableDistricts
        .firstWhere((district) => district.id == districtId);
    return district.locations;
  }
}
