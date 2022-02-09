import 'package:api_sample_flutter/connections/data_response.dart';
import 'package:api_sample_flutter/models/sample_model.dart';
import 'package:dio/dio.dart';

import 'package:api_sample_flutter/utils/constants.dart';
import 'package:retrofit/http.dart';

part 'rest_api_client.g.dart';

@RestApi(baseUrl: Constants.API_URL)
abstract class RestApiClient {

  factory RestApiClient(Dio dio, {String baseUrl}) = _RestApiClient;

  @GET("api/unknown")
  Future<DataResponse<SampleModel>> getData();
}