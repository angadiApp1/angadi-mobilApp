import 'package:angadiapp/core/network/dio_factory.dart';
import 'package:angadiapp/src/features/home_shops/data/datasource/home_remote_data_source.dart';
import 'package:angadiapp/src/features/home_shops/data/network/home_api_clients.dart';
import 'package:angadiapp/src/features/home_shops/data/repository/home_repository_impl.dart';
import 'package:angadiapp/src/features/home_shops/domain/repository/home_repository.dart';
import 'package:angadiapp/src/features/home_shops/domain/usecase/get_adBanners_usecase.dart';
import 'package:angadiapp/src/features/home_shops/domain/usecase/get_categories_usecase.dart';
import 'package:angadiapp/src/features/home_shops/domain/usecase/get_location_usecase.dart';
import 'package:angadiapp/src/features/home_shops/domain/usecase/get_shop_offers_usecase.dart';
import 'package:angadiapp/src/features/home_shops/domain/usecase/get_shops_usecase.dart';
import 'package:angadiapp/src/features/home_shops/presentation/bloc/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Dio
  serviceLocator.registerLazySingleton<DioFactory>(() => DioFactory());
  final dio = await serviceLocator<DioFactory>().getDio();

  // API Clients
  serviceLocator.registerLazySingleton(() => HomeServiceClient(dio));

  // Data Sources
  serviceLocator.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(serviceLocator()),
  );

  // Repositories
  serviceLocator.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(serviceLocator()),
  );

  // Use Cases
  serviceLocator
      .registerLazySingleton(() => GetLocationUsecase(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => GetCategoriesUsecase(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => GetAdBannersUsecase(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetShopsUsecase(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => GetShopOffersUsecase(serviceLocator()));

  // BLoCs
  serviceLocator.registerFactory(() => HomeBloc(serviceLocator(),
      serviceLocator(), serviceLocator(), serviceLocator(), serviceLocator()));
}
