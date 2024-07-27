import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/home/entity/forecast_entity.dart';
import 'package:domain/features/home/entity/weather_entity.dart';

abstract interface class IHomeRepository {
  String get getLastCity;

  void setCityName(String city);

  Future<Result<WeatherEntity,NetworkException>> fetchWeather(String cityName);

  Future<Result<List<ForecastEntity>,NetworkException>> fetchWeatherForecast(String cityName);

}
