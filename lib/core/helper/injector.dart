import 'package:get_it/get_it.dart';
import 'package:weather_app/core/display/i_update_able.dart';
import 'package:weather_app/features/home/business_logic/home_cubit.dart';
import 'package:weather_app/features/settings/business_logic/settings_cubit.dart';

var getIt = GetIt.I;

Future<void> initializeDependencies(GetIt diInjector) async {
  /// ********* Home **********
  getIt.registerFactory(
    () => HomeCubit(
      diInjector(),
      diInjector(),
      diInjector(),
      diInjector(),
      diInjector(),
    ),
  );

  getIt.registerFactoryParam(
    (param1, param2) => SettingsCubit(
      param1 as IUpdateAble,
      diInjector(),
      diInjector(),
    ),
  );
}
