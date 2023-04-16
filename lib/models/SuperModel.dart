import 'package:json_annotation/json_annotation.dart';
import 'package:project_coding_game/models/addBlogModel.dart';

part 'SuperModel.g.dart';

@JsonSerializable()
class SuperModel {
  List<AddBlogModel> data;
  SuperModel({required this.data});
  factory SuperModel.fromJson(Map<String, dynamic> json) =>
      _$SuperModelFromJson(json);
  Map<String, dynamic> toJson() => _$SuperModelToJson(this);
}
