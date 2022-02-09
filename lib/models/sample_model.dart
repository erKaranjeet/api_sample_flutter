import 'package:json_annotation/json_annotation.dart';

part 'sample_model.g.dart';

@JsonSerializable(includeIfNull: false,explicitToJson: true)
class SampleModel {

  int? id;
  String? title, body;

  SampleModel({this.id, this.title, this.body});

  factory SampleModel.fromJson(Map<String, dynamic> json) => _$SampleModelFromJson(json);
  Map<String, dynamic> toJson() => _$SampleModelToJson(this);
}