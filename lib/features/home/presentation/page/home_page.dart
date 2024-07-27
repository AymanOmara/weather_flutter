import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/business_logic/home_cubit.dart';
import 'package:weather_app/features/home/presentation/widgets/current_weather_widget.dart';
import 'package:weather_app/features/home/presentation/widgets/forecast_widget.dart';
import 'package:weather_app/features/home/presentation/widgets/home_top_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = BlocProvider.of(context);
        return Scaffold(
          backgroundColor:Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                HomeTopBar(
                  cubit: cubit,
                ),
                const SizedBox(
                  height: 20,
                ),
                CurrentWeatherWidget(
                  cubit: cubit,
                ),
                ForecastWidget(
                  cubit: cubit,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
