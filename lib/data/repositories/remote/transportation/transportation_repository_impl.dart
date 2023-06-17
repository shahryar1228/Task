import 'dart:convert';

import 'package:Task/data/models/request/save_date_request_model.dart';
import 'package:Task/data/models/response/transportation/departments_response_model.dart';
import 'package:Task/data/models/response/transportation/save_date_response_model.dart';
import 'package:Task/data/sources/remote/transportation/remote_transportation_repository.dart';
import 'package:Task/domain/repositories/transport_repository.dart';


class TaskRepositoryImpl extends TaskRepository{

  @override
  Future<SaveDateResponseModel> saveDate(SaveDateRequestModel saveDateRequestModel) async {
    var request = RemoteTask.saveDate(saveDateRequestModel);
    var response = await request.getResult();
    if(response.isDone){
      var result = SaveDateResponseModel().saveDateResponseModelFromJson(jsonEncode(response.result),response);
      return result;
    }else{
      return SaveDateResponseModel(selectedDay: null,response: response);
    }
  }

  @override
  Future<DepartmentsResponseModel> loadList() async {
    var request = RemoteTask.loadList();
    var response = await request.getResult();
    if(response.isDone){
      var result = DepartmentsResponseModel().departmentsResponseModelFromJson(jsonEncode(response.result),response);
      return result;
    }else{
      return DepartmentsResponseModel(data: [],response: response);
    }
  }


}