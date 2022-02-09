// @dart=2.9
import 'package:api_sample_flutter/connections/injector.dart';
import 'package:api_sample_flutter/connections/rest_api_client.dart';
import 'package:api_sample_flutter/models/sample_model.dart';
import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:api_sample_flutter/connections/sample_contract_view.dart';

class SampleInteractorImpl implements SampleInteractor {

  RestApiClient client;

  BrandsIntractorImpl() {
    client = Injector().getClient();
  }

  @override
  void getData(OnSampleCompleteListener callback) async {
    // TODO: implement getBrandsById
    var connectivityResult = await (Connectivity().checkConnectivity());
    // ignore: unrelated_type_equality_checks
    if (connectivityResult == ConnectivityResult.none) {
      return callback.onError("Please check internet connection");
    }
    client.getData().then((it) {
      List<SampleModel> result = it as List<SampleModel>;
      // if (result.isSuccess && result.data != null) {
        callback.onSuccessSampleListener(result);
      // } else if (result.error != null) {
      //   callback.onError(result.error);
      // } else if (result.message != null) {
      //   callback.onError(result.message);
      // }
    }).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioError:
        // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          print("Got error : ${res.statusCode} -> ${res.statusMessage}");
          callback.onError(res.statusMessage);
          break;
        default:
          callback.onError("Server error");
      }
    });
  }

}