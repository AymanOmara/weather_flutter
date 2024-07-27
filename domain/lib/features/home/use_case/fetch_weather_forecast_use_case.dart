import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/home/entity/forecast_entity.dart';
import 'package:domain/features/home/repository/i_home_repository.dart';

class FetchWeatherForecastUseCase {
  final IHomeRepository _repository;

  const FetchWeatherForecastUseCase(this._repository);

  Future<Result<List<ForecastEntity>,NetworkException>> call(String cityName) async {
    return await _repository.fetchWeatherForecast(cityName);
  }
}
