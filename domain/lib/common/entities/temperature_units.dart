enum TemperatureUnits {
  celsius("metric"),
  fahrenheit("imperial");

  final String value;

  const TemperatureUnits(this.value);

  static TemperatureUnits fromString(String unit) {
    for (var temperatureUnit in TemperatureUnits.values) {
      if (temperatureUnit.value.toLowerCase() == unit.toLowerCase()) {
        return temperatureUnit;
      }
    }
    return TemperatureUnits.celsius;
  }
}
