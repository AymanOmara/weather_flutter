import 'package:domain/common/entities/temperature_units.dart';
import 'package:domain/features/settings/repository/i_settings_repository.dart';
import 'package:domain/locale_storage/i_user_local.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../locale/user_local_test.dart';

class SettingsRepositoryMock implements ISettingsRepository {
  final IUserLocal _userLocal;

  const SettingsRepositoryMock(this._userLocal);

  @override
  void changeTemperatureUnits(TemperatureUnits unit) {
    _userLocal.setUnit(unit.value);
  }

  @override
  TemperatureUnits fetchTemperatureUnits() {
    return TemperatureUnits.fromString(_userLocal.unit);
  }
}
void main() {
  IUserLocal userLocal = UserLocalTest();
  ISettingsRepository settingsRepository = SettingsRepositoryMock(userLocal);

  setUp((){
    userLocal.setUnit(TemperatureUnits.celsius.value);
  });

  test('changeTemperatureUnits changes the temperature unit', () {
    settingsRepository.changeTemperatureUnits(TemperatureUnits.fahrenheit);
    expect(settingsRepository.fetchTemperatureUnits(), TemperatureUnits.fahrenheit);
  });

  test('fetchTemperatureUnits returns the temperature unit', () {
    expect(settingsRepository.fetchTemperatureUnits(), TemperatureUnits.celsius);
  });
}