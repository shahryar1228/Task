import 'package:Task/data/models/request/save_date_request_model.dart';
import 'package:dio/dio.dart';
import 'package:Task/app/app_connected_server.dart';
import 'package:Task/app/storage.dart';
import 'package:Task/data/sources/remote/remote_request_model.dart';

final storage = Storage();

class RemoteTask extends NetworkRequest {
  RemoteTask(super.type, super.address,
      {required super.dio, super.plainBody, super.listBody, super.body, required super.headers}) {
    // print(Storage().loginData!.token);
    // if (Storage().loginData != null && Storage().loginData!.token != null) {
    //   if (kDebugMode) print(Storage().loginData!.token);
    //   final Map<String, dynamic> jsonHeaders = {
    //     'auth-token': Storage().loginData!.token,
    //   };
    //   headers = jsonHeaders;
    // }
  }

  factory RemoteTask.saveDate(SaveDateRequestModel saveDateRequestModel) {
    try {
      var dio = Dio();
      final serverAddress = "${AppConnectedServer.TMS.address}/save_data.php";
      var headers = {
        "Authorization": getToken(),
      };
      return RemoteTask(RequestType.post, serverAddress,
          dio: dio, headers: headers,body: saveDateRequestModel);
    } catch (e) {
      rethrow;
    }
  }

  factory RemoteTask.loadList() {
    try {
      var dio = Dio();
      final serverAddress = "${AppConnectedServer.TMS.address}/departments.json";
      var headers = {
        "Authorization": getToken(),
      };
      return RemoteTask(RequestType.post, serverAddress,
          dio: dio, headers: headers,body: null);
    } catch (e) {
      rethrow;
    }
  }

  static String getToken() {
    return 'hi';
  }

}
