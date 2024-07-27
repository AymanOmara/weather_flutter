import 'package:common/common.dart';
import 'package:data/network/remote_target.dart';

class GetWeatherForecastRequest extends IRemoteTarget{

  final String cityName;
  final String unit;

  GetWeatherForecastRequest({
    required this.cityName,
    required this.unit
  }){
    path = "data/2.5/forecast?q=$cityName&appid=${Common.apiKey}&units=$unit";
  }
}
// https://api.openweathermap.org/data/2.5/forecast?q=London&appid=aa703bec01fd63b008a8dbd60b68ee69&units=metric