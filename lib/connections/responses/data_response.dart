import 'package:json_annotation/json_annotation.dart';

part 'data_response.g.dart';


@JsonSerializable(genericArgumentFactories: true, includeIfNull: false)
class DataResponse<TModel> {

  List<TModel>? data;
  int? page, per_page, total_pages, total;
  // TModel? data;
  // bool? isSuccess;
  // String? error, message;

  DataResponse({this.data, this.page, this.per_page, this.total_pages, this.total});
    // this.total, this.isSuccess, this.error, this.message});

  factory DataResponse.fromJson(Map<String, dynamic> json, TModel Function(Object? json) fromJsonT,) => _$DataResponseFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object Function(TModel value) toJsonT) => _$DataResponseToJson(this, toJsonT);
}