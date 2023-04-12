// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataResponse<TModel> _$DataResponseFromJson<TModel>(
  Map<String, dynamic> json,
  TModel Function(Object? json) fromJsonTModel,
) =>
    DataResponse<TModel>(
      data: (json['data'] as List<dynamic>?)?.map(fromJsonTModel).toList(),
      page: json['page'] as int?,
      per_page: json['per_page'] as int?,
      total_pages: json['total_pages'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$DataResponseToJson<TModel>(
  DataResponse<TModel> instance,
  Object? Function(TModel value) toJsonTModel,
) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data?.map(toJsonTModel).toList());
  writeNotNull('page', instance.page);
  writeNotNull('per_page', instance.per_page);
  writeNotNull('total_pages', instance.total_pages);
  writeNotNull('total', instance.total);
  return val;
}
