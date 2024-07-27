import 'package:domain/features/home/repository/i_home_repository.dart';

class GetLastSelectedCityUseCase {
  final IHomeRepository _repository;

  GetLastSelectedCityUseCase(this._repository);

  String call() {
    return _repository.getLastCity;
  }
}
