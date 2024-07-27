import 'package:domain/locale_storage/i_user_local.dart';
import 'package:flutter_test/flutter_test.dart';

class UserLocalTest implements IUserLocal {
  String cityNamePersistent = "";
  String unitPersistent = "";

  @override
  String get cityName => cityNamePersistent;

  @override
  void setCity(String countryName) {
    cityNamePersistent = countryName;
  }

  @override
  void setUnit(String unit) {
    unitPersistent = unit;
  }

  @override
  String get unit => unitPersistent;
}

void main() {
  IUserLocal userLocal = UserLocalTest();
  setUp(() {
    userLocal.setCity("cairo");
    userLocal.setUnit("test");
  });
  test('getLastCity returns the city name from userLocal', () {
    expect(userLocal.cityName, 'cairo');
  });

  test('setUnit returns the unit from userLocal', () {
    expect(userLocal.unit, 'test');
  });
}
