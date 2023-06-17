
import 'package:Task/data/models/request/save_date_request_model.dart';
import 'package:Task/data/models/response/transportation/departments_response_model.dart';
import 'package:Task/data/models/response/transportation/save_date_response_model.dart';

abstract class TaskRepository {
  Future<SaveDateResponseModel>saveDate(SaveDateRequestModel saveDateRequestModel);
  Future<DepartmentsResponseModel> loadList();
}