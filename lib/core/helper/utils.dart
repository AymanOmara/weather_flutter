import 'package:get/get.dart';

extension StringValidation on String? {
  bool isNullOrEmpty() {
    return this == null || this?.isEmpty == true;
  }
}

class Validator {
  Validator._();

}
extension ArrayUtils<T> on List<T> {
  void updateWhere(bool Function(T) condition, T newItem) {
    final index = indexWhere(condition);
    if (index != -1) {
      this[index] = newItem;
    }
  }
}
extension Toggle on bool{
  bool toggle() {
    return !this;
  }
}