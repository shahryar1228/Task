// To parse this JSON data, do
//
//     final saveDateRequestModel = saveDateRequestModelFromJson(jsonString);

import 'dart:convert';

class SaveDateRequestModel {

  SaveDateRequestModel saveDateRequestModelFromJson(String str) => SaveDateRequestModel.fromJson(json.decode(str));
  String saveDateRequestModelToJson(SaveDateRequestModel data) => json.encode(data.toJson());

  String selectedDay;

  SaveDateRequestModel({
    required this.selectedDay,
  });

  factory SaveDateRequestModel.fromJson(Map<String, dynamic> json) => SaveDateRequestModel(
    selectedDay: json["selected_day"],
  );

  Map<String, dynamic> toJson() => {
    "selected_day": selectedDay,
  };
}
