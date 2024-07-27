import 'package:di/di.dart';
import 'package:domain/features/home/use_case/get_last_selected_city_use_case.dart';
import 'package:domain/features/home/use_case/save_city_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'app_router.dart';
import 'core/helper/constants.dart';
import 'core/helper/injector.dart';
import 'package:get/get.dart';

import 'core/translation_service/translation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DI.registerDependencies();
  await initializeDependencies(diInjector);
  GetLastSelectedCityUseCase getLastSelectedCityUseCase = diInjector();
  if (getLastSelectedCityUseCase().isEmpty) {
    String currentUserCity = await requestGetUserLocation();
    SaveCityUseCase saveCityUseCase = diInjector();
    saveCityUseCase(currentUserCity);
  }

  runApp(const MyApp());
}

Future<String> requestGetUserLocation() async {
  LocationPermission? permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  List<Placemark> placeMarks = await placemarkFromCoordinates(
    position.latitude,
    position.longitude,
  );
  if (placeMarks.isNotEmpty) {
    return placeMarks[0].subAdministrativeArea ?? Misc.defaultCity;
  }
  return Misc.defaultCity;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      onGenerateRoute: AppRouter().generateRouter,
      translations: TranslationService(),
      supportedLocales: const <Locale>[
        Locale('en'),
        Locale('ar'),
      ],
      locale: const Locale("en"),
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: AppRoutes.home,
    );
  }
}
