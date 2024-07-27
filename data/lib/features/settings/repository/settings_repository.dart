import 'package:domain/common/entities/temperature_units.dart';
import 'package:domain/features/settings/repository/i_settings_repository.dart';
import 'package:domain/locale_storage/i_user_local.dart';

class SettingsRepository implements ISettingsRepository{
  final IUserLocal _userLocal;
  const SettingsRepository(this._userLocal);
  @override
  void changeTemperatureUnits(TemperatureUnits unit) {
    _userLocal.setUnit(unit.value);
  }

  @override
  TemperatureUnits fetchTemperatureUnits() {
    return TemperatureUnits.fromString(_userLocal.unit);
  }

}