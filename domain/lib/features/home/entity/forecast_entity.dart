class ForecastEntity {
  final String temp;
  final String minTemp;
  final String maxTemp;
  final String description;
  final DateTime date;
  final String icon;

  ForecastEntity({
    required this.date,
    required this.description,
    required this.icon,
    required this.maxTemp,
    required this.minTemp,
    required this.temp,
  });
}
