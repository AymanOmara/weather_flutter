import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/ui/loading/loading_widget.dart';
import 'package:weather_app/core/ui/network_image.dart';
import 'package:weather_app/core/ui/theme/weather_colors.dart';
import 'package:weather_app/features/home/business_logic/home_cubit.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      loadingState: cubit.weatherLoadingState,
      successWidget: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cubit.weather?.name ?? "",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: WeatherColors.darkShadeGray,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                "assets/location_ic.png",
              )
            ],
          ),
          WeatherNetworkImage(
            width: 150,
            height: 150,
            imageUrl: Common.getIconUrl(
              cubit.weather?.weather[0].icon ?? "",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${cubit.weather?.main.temp ?? 0} ${cubit.temperatureUnits.toUpperCase()}",
                style: const TextStyle(
                  height: 0.7,
                  fontSize: 70,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            cubit.weather?.weather[0].description ?? "",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
              color: WeatherColors.lightShadeGray,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "TIME".tr,
                        style: const TextStyle(
                          color: WeatherColors.silver,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        DateFormat('hh:mm a').format(
                          cubit.weather?.dateTime ?? DateTime.now(),
                        ),
                        style: const TextStyle(
                          color: WeatherColors.silver,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    children: [
                      Text(
                        "Humidity".tr,
                        style: const TextStyle(
                          color: WeatherColors.silver,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        "${cubit.weather?.main.humidity ?? 0}%",
                        style: const TextStyle(
                          color: WeatherColors.silver,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    children: [
                      Text(
                        "Pressure".tr,
                        style: const TextStyle(
                          color: WeatherColors.silver,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        "${cubit.weather?.main.pressure ?? 0} hPa",
                        style: const TextStyle(
                          color: WeatherColors.silver,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    children: [
                      Text(
                        "WindSpeed".tr,
                        style: const TextStyle(
                          color: WeatherColors.silver,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        " ${cubit.weather?.wind.speed ?? 0} mph",
                        style: const TextStyle(
                          color: WeatherColors.silver,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      onRetry: () {
        cubit.fetchWeather();
      },
    );
  }
}
