import 'package:data/features/home/mappers/forecast_mapper.dart';
import 'package:data/features/home/mappers/weather_mapper.dart';
import 'package:data/features/home/models/forecast_model.dart';
import 'package:data/features/home/models/weather_model.dart';
import 'package:data/features/home/request/get_current_weather_request.dart';
import 'package:data/features/home/request/get_weather_forecast_request.dart';
import 'package:data/network/i_base_api.dart';
import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/home/entity/forecast_entity.dart';
import 'package:domain/features/home/entity/weather_entity.dart';
import 'package:domain/features/home/repository/i_home_repository.dart';
import 'package:domain/locale_storage/i_user_local.dart';

class HomeRepository implements IHomeRepository {
  final IUserLocal _userLocal;
  final IAPIService _service;

  const HomeRepository(
    this._userLocal,
    this._service,
  );

  @override
  String get getLastCity => _userLocal.cityName;

  @override
  void setCityName(String city) {
    _userLocal.setCity(city);
  }

  @override
  Future<Result<WeatherEntity,NetworkException>> fetchWeather(String cityName) async {
    var result = await _service.fetchData<WeatherModel?>(
      GetCurrentWeatherRequest(
        cityName: cityName,
        unit: _userLocal.unit,
      ),
      data: WeatherModel()
    );
    switch (result) {
      case Success(data:final data):
        return Success(data!.toEntity());
      case Failure(exception:final exception):
        return Failure(exception);
    }
  }

  @override
  Future<Result<List<ForecastEntity>,NetworkException>> fetchWeatherForecast(String cityName)async {
    var result = await _service.fetchData<ForecastModel?>(
        GetWeatherForecastRequest(
          cityName: cityName,
          unit: _userLocal.unit,
        ),
        data: ForecastModel()
    );
    switch (result) {
      case Success(data:final data):
        return Success(data?.data?.map((e) => e.toEntity()).toList() ?? []);
      case Failure(exception:final exception):
        return Failure(exception);
    }
  }
}
