import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/core/helper/constants.dart';
import 'package:weather_app/features/home/business_logic/home_cubit.dart';

class HomeTopBar extends StatelessWidget {
  HomeTopBar({
    super.key,
    required this.cubit,
  });

  final _searchController = TextEditingController();
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimSearchBar(
            helpText: "city_search_hint".tr,
            width: Get.width - 70,
            textController: _searchController..text = cubit.cityName,
            onSuffixTap: () {},
            closeSearchOnSuffixTap: false,
            onSubmitted: (txt) async {
              if (txt.isNotEmpty) {
                cubit.cityName = txt;
                cubit.fetchWeather();
              }
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.settings,
                arguments: cubit,
              );
            },
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
    );
  }
}
