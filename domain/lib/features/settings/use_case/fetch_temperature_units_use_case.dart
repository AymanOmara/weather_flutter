import 'package:domain/common/entities/temperature_units.dart';
import 'package:domain/features/settings/repository/i_settings_repository.dart';

class FetchTemperatureUnitsUseCase {
  final ISettingsRepository _repository;

  FetchTemperatureUnitsUseCase(this._repository);

  TemperatureUnits call() {
    return _repository.fetchTemperatureUnits();
  }
}
