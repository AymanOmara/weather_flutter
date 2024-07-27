import 'package:data/locale/locale_keys.dart';
import 'package:domain/common/entities/temperature_units.dart';
import 'package:domain/locale_storage/i_user_local.dart';
import 'package:get_storage/get_storage.dart';

class UserLocal implements IUserLocal {
  final GetStorage _storage;

  UserLocal(this._storage);

  @override
  String get cityName => _storage.read(LocaleKeys.cityName) ?? "";

  @override
  void setCity(String cityName) {
    _storage.write(LocaleKeys.cityName, cityName);
  }

  @override
  void setUnit(String unit) {
    _storage.write(LocaleKeys.unit, unit);
  }

  @override
  String get unit => _storage.read(LocaleKeys.unit) ?? TemperatureUnits.fahrenheit.value;
}
