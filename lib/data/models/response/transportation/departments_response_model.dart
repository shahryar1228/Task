// To parse this JSON data, do
//
//     final departmentsResponseModel = departmentsResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:Task/data/sources/remote/remote_response_model.dart';

class DepartmentsResponseModel {

  DepartmentsResponseModel departmentsResponseModelFromJson(String str, RequestResponse<dynamic> response) => DepartmentsResponseModel.fromJson(json.decode(str),response);
  String departmentsResponseModelToJson(DepartmentsResponseModel data) => json.encode(data.toJson());

  List<Datum>? data;
  RequestResponse<dynamic>? response;

  DepartmentsResponseModel({
    this.data,
    this.response,
  });

  factory DepartmentsResponseModel.fromJson(Map<String, dynamic> json, RequestResponse<dynamic> response) => DepartmentsResponseModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    response: response
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null :List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String name;
  String details;
  String icon;
  bool isActive;
  String color;
  String backgroundItem;

  Datum({
    required this.id,
    required this.name,
    required this.details,
    required this.icon,
    required this.isActive,
    required this.color,
    required this.backgroundItem,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    details: json["details"],
    icon: json["icon"],
    isActive: json["is_active"],
    color: json["color"],
    backgroundItem: json["background_item"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "details": details,
    "icon": icon,
    "is_active": isActive,
    "color": color,
    "background_item": backgroundItem,
  };
}
