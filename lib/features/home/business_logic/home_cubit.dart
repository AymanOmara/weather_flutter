import 'package:bloc/bloc.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/home/entity/forecast_entity.dart';
import 'package:domain/features/home/entity/weather_entity.dart';
import 'package:domain/features/home/use_case/fetch_weather_forecast_use_case.dart';
import 'package:domain/features/home/use_case/fetch_weather_use_case.dart';
import 'package:domain/features/home/use_case/get_last_selected_city_use_case.dart';
import 'package:domain/features/home/use_case/save_city_use_case.dart';
import 'package:domain/features/settings/use_case/fetch_temperature_units_use_case.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/core/display/i_update_able.dart';
import 'package:weather_app/core/display/loading_states.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> implements IUpdateAble {
  HomeCubit(
    this._cityUseCase,
    this._saveCityUseCase,
    this._fetchWeatherUseCase,
    this._fetchWeatherForecastUseCase,
    this._fetchTemperatureUnitsUseCase,
  ) : super(HomeInitial()) {
    cityName = _cityUseCase();
    temperatureUnits = _fetchTemperatureUnitsUseCase().name[0];
    fetch();
  }

  void fetch() {
    Future.wait([
      fetchWeather(),
      fetchWeatherForecast(),
    ]);
  }

  String cityName = "";
  String temperatureUnits = "";
  LoadingState weatherLoadingState = Idle();
  LoadingState forecastLoadingState = Idle();
  final GetLastSelectedCityUseCase _cityUseCase;
  final SaveCityUseCase _saveCityUseCase;
  final FetchWeatherUseCase _fetchWeatherUseCase;
  final FetchWeatherForecastUseCase _fetchWeatherForecastUseCase;
  final FetchTemperatureUnitsUseCase _fetchTemperatureUnitsUseCase;
  WeatherEntity? weather;
  List<ForecastEntity> forecast = [];

  Future<void> fetchWeather() async {
    _saveCityUseCase(cityName);
    weatherLoadingState = Loading();
    emit(HomeLoading());
    _fetchWeatherUseCase(cityName).then((value) {
      switch (value) {
        case Success(data: final data):
          weather = data;
          weatherLoadingState = LoadingSuccess(data: data);
          emit(HomeResult());
          break;
        case Failure(exception: final exception):
          weatherLoadingState = LoadingException(exception);
          emit(HomeResult());
          break;
      }
    });
  }

  Future<void> fetchWeatherForecast() async {
    forecastLoadingState = Loading();
    emit(HomeLoading());
    _fetchWeatherForecastUseCase(cityName).then((value) {
      switch (value) {
        case Success(data: final data):
          final items = [0, 8, 16, 24, 32];
          forecast = [for (var i in items) data[i]];
          forecastLoadingState = LoadingSuccess(data: data);
          emit(HomeResult());
          break;
        case Failure(exception: final exception):
          forecastLoadingState = LoadingException(exception);
          emit(HomeResult());
          break;
      }
    });
  }

  @override
  void onUpdate() {
    temperatureUnits = _fetchTemperatureUnitsUseCase().name[0];
    fetch();
  }
}
