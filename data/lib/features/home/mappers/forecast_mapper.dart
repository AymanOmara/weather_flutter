import 'package:data/features/home/models/forecast_model.dart';
import 'package:domain/features/home/entity/forecast_entity.dart';

extension ForecastMapper on ForecastDataModel {
  ForecastEntity toEntity() {
    return ForecastEntity(
      date: DateTime.fromMillisecondsSinceEpoch((dt ?? 0) * 1000),
      description: weather?[0].description ?? "",
      icon: weather?[0].icon ?? "",
      maxTemp: main!.temp_max.toString(),
      minTemp: main!.temp_min.toString(),
      temp: main!.temp.toString(),
    );
  }
}
