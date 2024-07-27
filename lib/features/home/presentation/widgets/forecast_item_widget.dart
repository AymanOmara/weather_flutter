import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:domain/features/home/entity/forecast_entity.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/ui/network_image.dart';

class ForecastItemWidget extends StatelessWidget {
  const ForecastItemWidget({
    super.key,
    required this.entity,
    required this.temperatureUnits,
  });

  final ForecastEntity entity;
  final String temperatureUnits;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(DateFormat('EEEE').format(entity.date)),
        WeatherNetworkImage(
          imageUrl: Common.getIconUrl(
            entity.icon,
          ),
        ),
        Text(
          entity.minTemp+temperatureUnits.toUpperCase(),
        ),
      ],
    );
  }
}
