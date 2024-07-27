import 'package:common/common.dart';
import 'package:data/network/remote_target.dart';

class GetCurrentWeatherRequest extends IRemoteTarget {
  final String cityName;
  final String unit;

  GetCurrentWeatherRequest({
    required this.cityName,
    required this.unit,
  }) {
    // https://api.openweathermap.org/data/2.5/weather?q=London&appid=aa703bec01fd63b008a8dbd60b68ee69&units=metric
    //  https://api.openweathermap.org/data/2.5/weather?q=London&appid=aa703bec01fd63b008a8dbd60b68ee69&units=metric
    path = "data/2.5/weather?q=$cityName&appid=${Common.apiKey}&units=$unit";
  }
}
