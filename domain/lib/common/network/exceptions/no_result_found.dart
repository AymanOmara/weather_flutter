import 'package:domain/common/network/exceptions/network_exception.dart';

class NoResultFound implements NetworkException{

  @override
  String get message => "no_result_found";
}