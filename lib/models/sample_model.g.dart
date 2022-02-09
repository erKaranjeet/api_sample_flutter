// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SampleModel _$SampleModelFromJson(Map<String, dynamic> json) => SampleModel(
      id: json['id'] as int?,
      year: json['year'] as int?,
      name: json['name'] as String?,
      color: json['color'] as String?,
      pantone_value: json['pantone_value'] as String?,
    );

Map<String, dynamic> _$SampleModelToJson(SampleModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('year', instance.year);
  writeNotNull('name', instance.name);
  writeNotNull('color', instance.color);
  writeNotNull('pantone_value', instance.pantone_value);
  return val;
}
