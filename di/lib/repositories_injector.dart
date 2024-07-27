import 'package:data/features/home/repository/home_repository.dart';
import 'package:data/features/settings/repository/settings_repository.dart';
import 'package:domain/features/home/repository/i_home_repository.dart';
import 'package:domain/features/settings/repository/i_settings_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> setupRepositoryInjector(GetIt diInjector) async {
  /// ********* Home **********
  diInjector.registerSingleton<IHomeRepository>(
    HomeRepository(
      diInjector(),
      diInjector(),
    ),
  );

  /// ********* Settings **********
  diInjector.registerSingleton<ISettingsRepository>(
    SettingsRepository(
      diInjector(),
    ),
  );
}
