import 'package:bloc/bloc.dart';
import 'package:domain/common/entities/temperature_units.dart';
import 'package:domain/features/settings/use_case/change_temperature_unit_use_case.dart';
import 'package:domain/features/settings/use_case/fetch_temperature_units_use_case.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/core/display/i_update_able.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(
    this._updateAble,
    this._fetchTemperatureUnitsUseCase,
      this._changeTemperatureUnitUseCase,
  ) : super(SettingsInitial()){
    temperatureUnits = _fetchTemperatureUnitsUseCase();
  }
  TemperatureUnits? temperatureUnits;
  final IUpdateAble _updateAble;
  final FetchTemperatureUnitsUseCase _fetchTemperatureUnitsUseCase;
  final ChangeTemperatureUnitUseCase _changeTemperatureUnitUseCase;

  void changeTemperatureUnits(TemperatureUnits? unit) {
    _changeTemperatureUnitUseCase(unit!);
    _updateAble.onUpdate();
    temperatureUnits = unit;
    emit(SettingsChangeTemperatureUnit());
  }
}
