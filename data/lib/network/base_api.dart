import 'package:common/common.dart';
import 'package:common/logger.dart';
import 'package:data/network/remote_target.dart';
import 'package:dio/dio.dart';
import 'package:domain/common/network/exceptions/general_exception.dart';
import 'package:domain/common/network/exceptions/json_parsing_exception.dart';
import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/network/exceptions/no_connection.dart';
import 'package:domain/common/network/exceptions/no_result_found.dart';
import 'package:domain/common/result.dart';
import 'package:domain/locale_storage/i_user_local.dart';

import 'decode_able.dart';
import 'i_base_api.dart';

class BaseApi implements IAPIService {
  final IUserLocal userLocal;
  final Dio _dio;

  const BaseApi(
    this.userLocal,
    this._dio,
  );

  @override
  Future<Result<T?, NetworkException>> fetchData<T>(
    IRemoteTarget targetType, {
    DecodeAble? data,
  }) async {
    Logger.D(targetType.body);

    try {
      var response = await _dio.fetch(await _createRequestOptions(targetType));
      Logger.D(response.realUri);
      Logger.D(response.data);
      Logger.D(response.statusCode);
      Logger.D(await _headers());
      if(response.data == null || response.statusCode == 404) {
        return Failure(NoResultFound());
      }
      return Success(
        data!.fromJson(response.data),
      );
    } on FormatException catch (error) {
      Logger.D(tag: "",error.message);
      return Failure(JsonParsingException(error.message));
    } on DioException catch (e) {
      Logger.D(e.stackTrace);
      Logger.D(e.error);
      Logger.D(e.message);
      return Failure(NoConnection());
    } on TypeError catch (e) {
      Logger.D(e.stackTrace);
      Logger.D(e);
      Logger.D(tag: "",e.stackTrace);
      return Failure(GeneralException());
    }
  }

  Future<RequestOptions> _createRequestOptions(IRemoteTarget targetType) async {
    targetType.headers.addAll(await _headers());
    return RequestOptions(
      method: targetType.method.value,
      headers: targetType.headers,
      path: targetType.path!,
      baseUrl: Common.baseUrl,
      receiveDataWhenStatusError: true,
      validateStatus: (code) => true,
      data: targetType.body,
      queryParameters: targetType.queryParameters,
    );
  }


  Future<Map<String, String>> _headers() async {
    return {
      // "Authorization": "Bearer ${userLocal.getAccessToken}",
      // "Accept-Language": userLocal.getLocale,
      "Accept": "application/json",
    };
  }
}
