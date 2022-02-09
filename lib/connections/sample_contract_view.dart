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

  void onSuccessSampleListener(List<SampleModel> list);

  void onError(String error);
}