import 'package:angadiapp/src/features/home_shops/data/response/fetch_shops_model.dart';
import 'package:angadiapp/src/features/home_shops/data/response/get_banners_model.dart';
import 'package:angadiapp/src/features/home_shops/data/response/get_location_response_model.dart';
import 'package:angadiapp/src/features/home_shops/data/response/shop_offers_model.dart';
import 'package:angadiapp/src/features/home_shops/domain/usecase/get_adBanners_usecase.dart';
import 'package:angadiapp/src/features/home_shops/domain/usecase/get_categories_usecase.dart';
import 'package:angadiapp/src/features/home_shops/domain/usecase/get_location_usecase.dart';
import 'package:angadiapp/src/features/home_shops/domain/usecase/get_shop_offers_usecase.dart';
import 'package:angadiapp/src/features/home_shops/domain/usecase/get_shops_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeBlocState> {
  final GetLocationUsecase getLocationUsecase;
  final GetCategoriesUsecase getCategoriesUsecase;
  final GetAdBannersUsecase getAdBannersUsecase;
  final GetShopsUsecase getShopsUsecase;
  final GetShopOffersUsecase getShopOffersUsecase;
  HomeBloc(this.getLocationUsecase, this.getCategoriesUsecase,
      this.getAdBannersUsecase, this.getShopsUsecase, this.getShopOffersUsecase)
      : super(_Initial()) {
    on<HomeEvent>((event, emit) async {
      await event.when(
        started: () {},
        getLocationData: () => _getLocationData(event, emit),
        getCategories: () => _getCategories(event, emit),
        getBanners: (locationId) => _getBanners(event, emit, locationId),
        getShops: (locationId) => _getShops(event, emit, locationId),
        getShopOffers: (shopId) => _getShopOffers(event, emit, shopId),
      );
    });
  }

  Future<void> _getLocationData(
      HomeEvent event, Emitter<HomeBlocState> emit) async {
    emit(_LoadingLocationData());
    final result = await getLocationUsecase.execute();
    result.fold((failure) {
      emit(_ErrorLocationData(failure.message));
    }, (response) {
      emit(_LoadedLocationData(response));
    });
  }

  Future<void> _getCategories(
    HomeEvent event,
    Emitter<HomeBlocState> emit,
  ) async {
    emit(_LoadingCategories());
    final result = await getCategoriesUsecase.execute();
    result.fold((failure) {
      emit(_ErrorCategories(failure.message));
    }, (response) {
      emit(_LoadedCategories(response));
    });
  }

  Future<void> _getBanners(
      HomeEvent event, Emitter<HomeBlocState> emit, String locationId) async {
    emit(_LoadingBanners());
    final result = await getAdBannersUsecase.execute(locationId);
    result.fold((failure) {
      emit(_ErrorBanners(failure.message));
    }, (response) {
      emit(_LoadedBanners(response));
    });
  }

  Future<void> _getShops(
      HomeEvent event, Emitter<HomeBlocState> emit, String locationId) async {
    emit(_LoadingShops());
    final result = await getShopsUsecase.execute(locationId);
    result.fold((failure) {
      emit(_ErrorShops(failure.message));
    }, (response) {
      emit(_LoadedShops(response));
    });
  }

  Future<void> _getShopOffers(
      HomeEvent event, Emitter<HomeBlocState> emit, String shopId) async {
    emit(_LoadingShopOffers());
    final result = await getShopOffersUsecase.execute(shopId);
    result.fold((failure) {
      emit(_ErrorShopOffers(failure.message));
    }, (response) {
      emit(_LoadedShopOffers(response));
    });
  }
}
