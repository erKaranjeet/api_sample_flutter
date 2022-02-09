import 'package:api_sample_flutter/connections/data_response.dart';
import 'package:api_sample_flutter/models/sample_model.dart';

abstract class SampleContractView {

  void onSuccessSample(List<SampleModel> list);

  void onError(String error);
}

abstract class SampleInteractor {

  void getData(OnSampleCompleteListener callback);
}

abstract class SamplePresenter {

  void getData();
}

abstract class OnSampleCompleteListener {

  void onSuccessSampleListener(DataResponse response);

  void onError(String error);
}