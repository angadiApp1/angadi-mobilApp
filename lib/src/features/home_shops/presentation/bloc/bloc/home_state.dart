part of 'home_bloc.dart';

@freezed
class HomeBlocState with _$HomeBlocState {
  const factory HomeBlocState.initial() = _Initial;

  const factory HomeBlocState.loadingLocationData() = _LoadingLocationData;
  const factory HomeBlocState.loadedLocationData(GetLocationResponseModel? response) =
      _LoadedLocationData;
  const factory HomeBlocState.errorLocationData(String message) = _ErrorLocationData;

  const factory HomeBlocState.loadingCategories() = _LoadingCategories;
  const factory HomeBlocState.loadedCategories(dynamic response) = _LoadedCategories;
  const factory HomeBlocState.errorCategories(String message) = _ErrorCategories;
}
