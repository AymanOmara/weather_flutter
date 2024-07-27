import 'package:flutter/material.dart';
import 'package:weather_app/core/ui/loading/loading_widget.dart';
import 'package:weather_app/features/home/business_logic/home_cubit.dart';
import 'package:weather_app/features/home/presentation/widgets/forecast_item_widget.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      loadingState: cubit.forecastLoadingState,
      successWidget: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: cubit.forecast
                  .map((e) => ForecastItemWidget(
                        entity: e,
                        temperatureUnits: cubit.temperatureUnits,
                      ))
                  .toList(),
            ),
          )
        ],
      ),
      onRetry: () {
        cubit.fetchWeatherForecast();
      },
    );
  }
}
