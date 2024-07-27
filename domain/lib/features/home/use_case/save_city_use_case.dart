import 'package:domain/features/home/repository/i_home_repository.dart';

class SaveCityUseCase {
  final IHomeRepository _repository;

  SaveCityUseCase(this._repository);

  void call(String cityName) {
    _repository.setCityName(cityName);
  }
}
