import 'package:json_annotation/json_annotation.dart';

part 'sample_model.g.dart';

@JsonSerializable(includeIfNull: false,explicitToJson: true)
class SampleModel {

  int? id, year;
  String? name, color, pantone_value;

  SampleModel({this.id, this.year, this.name, this.color, this.pantone_value});

  factory SampleModel.fromJson(Map<String, dynamic> json) => _$SampleModelFromJson(json);
  Map<String, dynamic> toJson() => _$SampleModelToJson(this);
}