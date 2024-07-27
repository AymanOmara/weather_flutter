import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/settings/business_logic/settings_cubit.dart';
import 'core/display/i_update_able.dart';
import 'core/helper/constants.dart';
import 'core/helper/injector.dart';
import 'features/home/business_logic/home_cubit.dart';
import 'features/home/presentation/page/home_page.dart';
import 'features/settings/presentation/page/settings_page.dart';

class AppRouter {
  Route? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<HomeCubit>(),
            child: const HomePage(),
          ),
        );
      case AppRoutes.settings:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) =>
                getIt<SettingsCubit>(param1: settings.arguments as IUpdateAble),
            child: const SettingsPage(),
          ),
        );
    }
    return null;
  }
}
