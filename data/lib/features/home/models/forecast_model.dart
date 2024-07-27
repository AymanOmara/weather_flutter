import 'package:data/network/decode_able.dart';

class ForecastModel implements DecodeAble<ForecastModel?, Map> {
  final String? cod;
  final int? cnt;
  List<ForecastDataModel>? data = [];

  ForecastModel({
     this.cod,
     this.cnt,
     this.data,
  });

  @override
  ForecastModel? fromJson(Map json) {
    return ForecastModel(
      cod: json['cod'],
      cnt: json['cnt'],
      data: json['list']
              ?.map<ForecastDataModel>((e) => ForecastDataModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class ForecastDataModel {
  final int? dt;
  final List<ForecastItemModel>? weather;
  final String? base;
  final ForecastMainModel? main;

  ForecastDataModel({
    this.dt,
    this.weather,
    this.base,
    required this.main,
  });
  factory ForecastDataModel.fromJson(Map<String, dynamic>? json) {
    return ForecastDataModel(
      dt: json?['dt'],
      weather: json?['weather']
              ?.map<ForecastItemModel>((e) => ForecastItemModel.fromJson(e))
              .toList() ??
          [],
      base: json?['base'],
       main: ForecastMainModel.fromJson(json?['main']),
    );
  }
}

class ForecastItemModel {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  ForecastItemModel({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory ForecastItemModel.fromJson(Map<String, dynamic>? json) {
    return ForecastItemModel(
      id: json?['id'],
      main: json?['main'],
      description: json?['description'],
      icon: json?['icon'],
    );
  }
}
class ForecastMainModel {
  final num? temp;
  final num? feels_like;
  final num? temp_min;
  final num? temp_max;
  final num? pressure;
  final num? humidity;

  ForecastMainModel({
    this.temp,
    this.feels_like,
    this.temp_min,
    this.temp_max,
    this.pressure,
    this.humidity,
  });
  factory ForecastMainModel.fromJson(Map<String, dynamic>? json) {
    return ForecastMainModel(
      temp: json?['temp'],
      feels_like: json?['feels_like'],
      temp_min: json?['temp_min'],
      temp_max: json?['temp_max'],
      pressure: json?['pressure'],
      humidity: json?['humidity'],
    );
  }}