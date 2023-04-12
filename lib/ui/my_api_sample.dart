import 'package:api_sample_flutter/connections/presenters/impls/sample_presenter_impl.dart';
import 'package:api_sample_flutter/connections/presenters/sample_presenter.dart';
import 'package:api_sample_flutter/models/sample_model.dart';
import 'package:api_sample_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

class MyApiSample extends StatefulWidget {

  @override
  MyApiSampleState createState() => MyApiSampleState();
}

class MyApiSampleState extends State<MyApiSample> implements SampleContractView {

  late SamplePresenter presenter;
  late List<SampleModel> list;
  var url = Uri.parse(Constants.API_URL);

  @override
  void initState() {
    super.initState();

    list = [];
    presenter = SamplePresenterImpl(this);
    getDataFromApi();
  }
  
  void getDataFromApi() {
    presenter.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text(
          "Sample",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            String col = list[index].color!;
            col = col.replaceAll("#", "0xFF");
            int colors = int.parse(col);
            return ListTile(
              title: Text(
                "Name: " + list[index].name!,
                style: TextStyle(
                  color: Color(colors),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                "Pantone Value: " + list[index].pantone_value! + "\nYear: " + list[index].year.toString(),
                style: TextStyle(
                  color: Color(colors),
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemCount: list.length),
    );
  }

  @override
  void onError(String error) {
    print("Error: " + error);
  }

  @override
  void onSuccessSample(List<SampleModel> list) {
    this.list = list;
    setState(() {

    });
  }
}