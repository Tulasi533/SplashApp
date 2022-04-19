import 'package:splash_app/Model/eventModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'superModel.g.dart';

@JsonSerializable()
class SuperModel {
  List<EventModel>? data;
  
  SuperModel({this.data});
  factory SuperModel.fromJson(Map<String, dynamic> json) =>
      _$SuperModelFromJson(json);
  Map<String, dynamic> toJson() => _$SuperModelToJson(this);
}