import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/home/entity/forecast_entity.dart';
import 'package:domain/features/home/entity/weather_entity.dart';
import 'package:domain/features/home/repository/i_home_repository.dart';
import 'package:domain/locale_storage/i_user_local.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../locale/user_local_test.dart';

class HomeRepositoryMock implements IHomeRepository {
  final IUserLocal _userLocal;

  const HomeRepositoryMock(this._userLocal);

  @override
  Future<Result<WeatherEntity, NetworkException>> fetchWeather(
    String cityName,
  ) async {
    var entity = WeatherEntity(
      coord: CoordEntity(lon: -74.0060, lat: 40.7128),
      weather: [
        WeatherItemEntity(
          id: 800,
          main: "Clear",
          description: "clear sky",
          icon: "01d",
        ),
      ],
      base: "stations",
      main: MainEntity(
        temp: 293.55,
        feelsLike: 293.13,
        tempMin: 292.04,
        tempMax: 295.37,
        pressure: 1013,
        humidity: 53,
        seaLevel: 1013,
        grndLevel: 1009,
      ),
      visibility: 10000,
      wind: WindEntity(
        speed: 5.1,
        deg: 200,
      ),
      clouds: CloudsEntity(
        all: 1,
      ),
      dt: 1622822020,
      sys: SysEntity(
        type: 1,
        id: 1414,
        country: "US",
        sunrise: 1622819447,
        sunset: 1622873524,
      ),
      timezone: -14400,
      id: 5128581,
      name: "New York",
      cod: 200,
    );
    return Success(entity);
  }

  @override
  Future<Result<List<ForecastEntity>, NetworkException>> fetchWeatherForecast(
    String cityName,
  ) async {
    return Success(
      [
        ForecastEntity(
          date: DateTime.now().add(const Duration(days: 1)),
          description: "Partly cloudy",
          icon: "03d",
          maxTemp: "30°C",
          minTemp: "20°C",
          temp: "25°C",
        ),
      ],
    );
  }

  @override
  String get getLastCity => _userLocal.cityName;

  @override
  void setCityName(String city) {
    _userLocal.setCity(city);
  }
}

void main() {
  late IHomeRepository _homeRepository;
  late IUserLocal _userLocal;
  setUp(() {
    _userLocal = UserLocalTest();
    _homeRepository = HomeRepositoryMock(_userLocal);
    _userLocal.setCity("cairo");
    _homeRepository.setCityName("cairo");
  });

  test('fetchWeather', () async {
    var result = await _homeRepository.fetchWeather("cairo");
    switch (result) {
      case Success(data: final data):
        expect(data, isA<WeatherEntity>());
        break;
      case Failure(exception: final exception):
        break;
    }
  });

  test("getLastCity", () {
    expect(_homeRepository.getLastCity, "cairo");
  });

  test('fetchWeatherForecast', () async {
    var result = await _homeRepository.fetchWeatherForecast("cairo");
    switch (result) {
      case Success(data: final data):
        expect(data, isA<List<ForecastEntity>>());
        expect(data.first.description, "Partly cloudy");
        break;
      case Failure(exception: final exception):
        break;
    }
  });
  test("getLastCity", () {
    expect(_homeRepository.getLastCity, "cairo");
  });
  test("setCityName", () {
    expect(_homeRepository.getLastCity, "cairo");
  });
}
