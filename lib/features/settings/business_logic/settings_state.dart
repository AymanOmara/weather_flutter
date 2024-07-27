part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class SettingsChangeTemperatureUnit extends SettingsState {}
