import 'package:api_sample_flutter/connections/presenters/sample_presenter.dart';
import 'package:api_sample_flutter/connections/responses/data_response.dart';
import 'package:api_sample_flutter/connections/presenters/impls/sample_interactor_impl.dart';
import 'package:api_sample_flutter/models/sample_model.dart';

class SamplePresenterImpl implements SamplePresenter, OnSampleCompleteListener {

  late SampleContractView contractView;
  late SampleInteractor interactor;

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
    contractView.onSuccessSample(response as List<SampleModel>);
  }
}