import 'package:data/network/decode_able.dart';

class WeatherModel implements DecodeAble<WeatherModel?, Map?> {
  final CoordModel? coord;
  final List<WeatherItemModel>? weather;
  final String? base;
  final MainModel? main;
  final int? visibility;
  final WindModel? wind;
  final CloudsModel? clouds;
  final int? dt;
  final SysModel? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  WeatherModel({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  @override
  WeatherModel? fromJson(Map? json) {
    return WeatherModel(
      coord: CoordModel.fromJson(json?['coord']),
      weather: json?['weather']
              ?.map<WeatherItemModel>((e) => WeatherItemModel.fromJson(e))
              .toList() ??
          [],
      base: json?['base'],
      main: MainModel.fromJson(json?['main']),
      visibility: json?['visibility'],
      wind: WindModel.fromJson(json?['wind']),
      clouds: CloudsModel.fromJson(json?['clouds']),
      dt: json?['dt'],
      sys: SysModel.fromJson(json?['sys']),
      timezone: json?['timezone'],
      id: json?['id'],
      name: json?['name'],
      cod: json?['cod'],
    );
  }
}

class CoordModel {
  final double? lon;
  final double? lat;

  CoordModel({this.lon, this.lat});

  factory CoordModel.fromJson(Map<String, dynamic>? json) {
    return CoordModel(
      lon: json?['lon'].toDouble(),
      lat: json?['lat'].toDouble(),
    );
  }
}

class WeatherItemModel {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  WeatherItemModel({this.id, this.main, this.description, this.icon});

  factory WeatherItemModel.fromJson(Map<String, dynamic>? json) {
    return WeatherItemModel(
      id: json?['id'],
      main: json?['main'],
      description: json?['description'],
      icon: json?['icon'],
    );
  }
}

class MainModel {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? humidity;
  final int? seaLevel;
  final int? grndLevel;

  MainModel({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  factory MainModel.fromJson(Map<String, dynamic>? json) {
    return MainModel(
      temp: json?['temp'].toDouble(),
      feelsLike: json?['feels_like'].toDouble(),
      tempMin: json?['temp_min'].toDouble(),
      tempMax: json?['temp_max'].toDouble(),
      pressure: json?['pressure'],
      humidity: json?['humidity'],
      seaLevel: json?['sea_level'],
      grndLevel: json?['grnd_level'],
    );
  }
}

class WindModel {
  final double? speed;
  final int? deg;

  WindModel({this.speed, this.deg});

  factory WindModel.fromJson(Map<String, dynamic>? json) {
    return WindModel(
      speed: json?['speed'].toDouble(),
      deg: json?['deg'],
    );
  }
}

class CloudsModel {
  final int? all;

  CloudsModel({this.all});

  factory CloudsModel.fromJson(Map<String, dynamic>? json) {
    return CloudsModel(
      all: json?['all'],
    );
  }
}

class SysModel {
  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  SysModel({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory SysModel.fromJson(Map<String, dynamic>? json) {
    return SysModel(
      type: json?['type'],
      id: json?['id'],
      country: json?['country'],
      sunrise: json?['sunrise'],
      sunset: json?['sunset'],
    );
  }
}
