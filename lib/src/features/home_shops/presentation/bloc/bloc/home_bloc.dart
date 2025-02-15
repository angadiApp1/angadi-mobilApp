import 'package:angadiapp/core/constants/db_ids.dart';
import 'package:angadiapp/src/features/home_shops/data/response/get_location_response_model.dart';
import 'package:angadiapp/src/features/home_shops/domain/usecase/get_categories_usecase.dart';
import 'package:angadiapp/src/features/home_shops/domain/usecase/get_location_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeBlocState> {
  final GetLocationUsecase getLocationUsecase;
  final GetCategoriesUsecase getCategoriesUsecase;
  HomeBloc(this.getLocationUsecase, this.getCategoriesUsecase) : super(_Initial()) {
    on<HomeEvent>((event, emit) async {
      await event.when(
        started: (){},
        getLocationData: () => _getLocationData(event, emit),
        getCategories: (locationId) => _getCategories(event, emit, locationId),
      );
    });
  }

  Future<void> _getLocationData(HomeEvent event, Emitter<HomeBlocState> emit) async {
    final result = await getLocationUsecase.execute();
    result.fold((failure) {
      emit(_ErrorLocationData(failure.message));
    }, (response) {
      emit(_LoadedLocationData(response));
    });
  }

  Future<void> _getCategories(HomeEvent event, Emitter<HomeBlocState> emit, String locationId) async {
    final result = await getCategoriesUsecase.execute();
  }
}

