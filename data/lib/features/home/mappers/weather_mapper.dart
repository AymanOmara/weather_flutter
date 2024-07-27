import 'package:data/features/home/models/weather_model.dart';
import 'package:domain/features/home/entity/weather_entity.dart';

extension WeatherModelMapping on WeatherModel {
  WeatherEntity toEntity() {
    return WeatherEntity(
      coord: coord?.toEntity() ?? CoordEntity(lon: 0.0, lat: 0.0),
      weather: weather?.map((item) => item.toEntity()).toList() ?? [],
      base: base ?? '',
      main: main?.toEntity() ?? MainEntity(temp: 0.0, feelsLike: 0.0, tempMin: 0.0, tempMax: 0.0, pressure: 0, humidity: 0, seaLevel: 0, grndLevel: 0),
      visibility: visibility ?? 0,
      wind: wind?.toEntity() ?? WindEntity(speed: 0.0, deg: 0),
      clouds: clouds?.toEntity() ?? CloudsEntity(all: 0),
      dt: dt ?? 0,
      sys: sys?.toEntity() ?? SysEntity(type: 0, id: 0, country: '', sunrise: 0, sunset: 0),
      timezone: timezone ?? 0,
      id: id ?? 0,
      name: name ?? '',
      cod: cod ?? 0,
    );
  }
}

extension CoordModelMapping on CoordModel {
  CoordEntity toEntity() {
    return CoordEntity(
      lon: lon ?? 0.0,
      lat: lat ?? 0.0,
    );
  }
}

extension WeatherItemModelMapping on WeatherItemModel {
  WeatherItemEntity toEntity() {
    return WeatherItemEntity(
      id: id ?? 0,
      main: main ?? '',
      description: description ?? '',
      icon: icon ?? '',
    );
  }
}

extension MainModelMapping on MainModel {
  MainEntity toEntity() {
    return MainEntity(
      temp: temp ?? 0.0,
      feelsLike: feelsLike ?? 0.0,
      tempMin: tempMin ?? 0.0,
      tempMax: tempMax ?? 0.0,
      pressure: pressure ?? 0,
      humidity: humidity ?? 0,
      seaLevel: seaLevel ?? 0,
      grndLevel: grndLevel ?? 0,
    );
  }
}

extension WindModelMapping on WindModel {
  WindEntity toEntity() {
    return WindEntity(
      speed: speed ?? 0.0,
      deg: deg ?? 0,
    );
  }
}

extension CloudsModelMapping on CloudsModel {
  CloudsEntity toEntity() {
    return CloudsEntity(
      all: all ?? 0,
    );
  }
}

extension SysModelMapping on SysModel {
  SysEntity toEntity() {
    return SysEntity(
      type: type ?? 0,
      id: id ?? 0,
      country: country ?? '',
      sunrise: sunrise ?? 0,
      sunset: sunset ?? 0,
    );
  }
}
