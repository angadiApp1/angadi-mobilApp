part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;

  const factory HomeEvent.getLocationData() = _GetLocationData;

  const factory HomeEvent.getCategories(
  ) = _GetCategories;

  const factory HomeEvent.getBanners(
    String locationId,
  ) = _GetBanners;

  const factory HomeEvent.getShops(
    String locationId,
  ) = _GetShops;
}
