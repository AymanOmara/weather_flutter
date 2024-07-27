import 'package:domain/common/entities/temperature_units.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:weather_app/features/settings/business_logic/settings_cubit.dart';
import 'package:weather_app/features/settings/presentation/widgets/settings_item_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        SettingsCubit cubit = BlocProvider.of(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  SettingsItemWidget(
                    title: "change_units".tr,
                    leading: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text("celsius".tr),
                            Radio(
                              value: TemperatureUnits.celsius,
                              groupValue: cubit.temperatureUnits,
                              onChanged: (TemperatureUnits? value) {
                                cubit.changeTemperatureUnits(value!);
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("fahrenheit".tr),
                            Radio(
                              value: TemperatureUnits.fahrenheit,
                              groupValue: cubit.temperatureUnits,
                              onChanged: (TemperatureUnits? value) {
                                cubit.changeTemperatureUnits(value!);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
