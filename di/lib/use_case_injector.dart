import 'package:domain/features/home/use_case/fetch_weather_forecast_use_case.dart';
import 'package:domain/features/home/use_case/fetch_weather_use_case.dart';
import 'package:domain/features/home/use_case/get_last_selected_city_use_case.dart';
import 'package:domain/features/home/use_case/save_city_use_case.dart';
import 'package:domain/features/settings/use_case/change_temperature_unit_use_case.dart';
import 'package:domain/features/settings/use_case/fetch_temperature_units_use_case.dart';
import 'package:get_it/get_it.dart';

Future<void> setupUseCaseInjector(GetIt diInjector) async {
  /// ********* Home **********
  diInjector.registerFactory(
    () => GetLastSelectedCityUseCase(
      diInjector(),
    ),
  );

  diInjector.registerFactory(
    () => SaveCityUseCase(
      diInjector(),
    ),
  );

  diInjector.registerFactory(
    () => FetchWeatherUseCase(
      diInjector(),
    ),
  );

  diInjector.registerFactory(
    () => FetchWeatherForecastUseCase(
      diInjector(),
    ),
  );
  /// ********* Settings **********
  diInjector.registerFactory(
    () => FetchTemperatureUnitsUseCase(
      diInjector(),
    ),
  );
  diInjector.registerFactory(
    () => ChangeTemperatureUnitUseCase(
      diInjector(),
    ),
  );
}
