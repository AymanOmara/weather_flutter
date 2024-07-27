import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/home/entity/weather_entity.dart';
import 'package:domain/features/home/repository/i_home_repository.dart';

class FetchWeatherUseCase {
  final IHomeRepository _repository;

  const FetchWeatherUseCase(this._repository);

  Future<Result<WeatherEntity?,NetworkException>> call(String cityName) async {
   return await _repository.fetchWeather(
      cityName,
    );
  }
}
