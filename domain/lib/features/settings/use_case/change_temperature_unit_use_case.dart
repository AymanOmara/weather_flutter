import 'package:domain/common/entities/temperature_units.dart';
import 'package:domain/features/settings/repository/i_settings_repository.dart';

class ChangeTemperatureUnitUseCase {
  final ISettingsRepository _repository;

  ChangeTemperatureUnitUseCase(this._repository);

  void call(TemperatureUnits unit) {
    _repository.changeTemperatureUnits(unit);
  }
}
