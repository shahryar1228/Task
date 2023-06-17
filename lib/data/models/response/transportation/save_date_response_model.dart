// To parse this JSON data, do
//
//     final saveDateResponceModel = saveDateResponceModelFromJson(jsonString);

import 'dart:convert';

import 'package:Task/data/sources/remote/remote_response_model.dart';

class SaveDateResponseModel {

  SaveDateResponseModel saveDateResponseModelFromJson(String str, RequestResponse<dynamic> response) => SaveDateResponseModel.fromJson(json.decode(str),response);
  String saveDateResponseModelToJson(SaveDateResponseModel data) => json.encode(data.toJson());

  dynamic selectedDay;
  RequestResponse<dynamic>? response;

  SaveDateResponseModel({
    this.selectedDay,
    this.response,
  });

  factory SaveDateResponseModel.fromJson(Map<String, dynamic> json, RequestResponse<dynamic> response) => SaveDateResponseModel(
    selectedDay: json["selected_day"],
    response: response,
  );

  Map<String, dynamic> toJson() => {
    "selected_day": selectedDay,
  };
}
