import 'package:domain/common/entities/temperature_units.dart';

abstract interface class ISettingsRepository {
  void changeTemperatureUnits(TemperatureUnits unit);

  TemperatureUnits fetchTemperatureUnits();
}
