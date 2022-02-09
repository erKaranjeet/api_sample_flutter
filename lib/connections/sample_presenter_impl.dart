// @dart=2.9
import 'package:api_sample_flutter/connections/data_response.dart';
import 'package:api_sample_flutter/connections/sample_contract_view.dart';
import 'package:api_sample_flutter/connections/sample_interactor_impl.dart';
import 'package:api_sample_flutter/models/sample_model.dart';

class SamplePresenterImpl implements SamplePresenter, OnSampleCompleteListener {

  SampleContractView contractView;
  SampleInteractor interactor;

  SamplePresenterImpl(SampleContractView view) {
    contractView = view;
    interactor = SampleInteractorImpl();
  }

  @override
  void getData() {
    interactor.getData(this);
  }

  @override
  void onError(String error) {
    contractView.onError(error);
  }

  @override
  void onSuccessSampleListener(DataResponse response) {
    contractView.onSuccessSample(response.data);
  }
}