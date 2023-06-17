
import 'package:Task/data/models/common/error/exceptions.dart';
import 'package:Task/data/sources/remote/remote_response_model.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dioResponse;
import 'package:get/get_connect/http/src/response/response.dart';

enum RequestType {
  post,
  get,
  put,
  delete,
}

class NetworkRequest {
  static const STATUS_OK_200 = 200;
  static const STATUS_CREATED_201 = 201;

  final Map<String, dynamic> _jsonHeaders = {
    "Content-type": "application/json",
  };

  final Dio dio;
  final RequestType type;
  final String address;
  final dynamic body;
  Map<String, dynamic>? headers;
  final List<int>? listBody;
  final String? plainBody;

  NetworkRequest(this.type, this.address,
      {required this.dio,
      this.body,
      this.plainBody,
      this.listBody,
      required this.headers});

  Future<RequestResponse> getResult() async {
    late dioResponse.Response response;
    if (headers?.length == 0) {
      headers=_jsonHeaders;
    }
    try {
      switch (type) {
        case RequestType.post:
          response = await dio.post(address,
              options: Options(headers: headers),
              data: plainBody ?? body ?? listBody);
          break;
        case RequestType.get:
          response = await dio.get(
            address,
            options: Options(headers: headers),
          );
          break;
        case RequestType.put:
          response = await dio.put(
            address,
            data: body ?? plainBody ?? listBody,
            options: Options(headers: headers),
          );
          break;
        case RequestType.delete:
          response = await dio.delete(
            address,
            options: Options(headers: headers),
          );
          break;
      }
      if (response.statusCode != STATUS_OK_200 && response.statusCode != STATUS_CREATED_201) {
        throw HttpRequestException();
      }
      return RequestResponse(
          isDone: true,
          statusCode: response.statusCode,
          result: response.data,
          errorMessage: '',
          errorStatus: null);
    } catch (exception) {
      if (exception is HttpRequestException) {
        return RequestResponse(
            isDone: false,
            statusCode: response.statusCode,
            errorStatus: ErrorStatus.httpError,
            errorMessage:
                response.statusCode.toString() + " : " + response.data,
            result: null);
      } else {
        return RequestResponse(
            isDone: false,
            statusCode: -1,
            errorStatus: ErrorStatus.systemError,
            errorMessage: "System Error :" + exception.toString(),
            result: null);
      }
    }
  }
}
