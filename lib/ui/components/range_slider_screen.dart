import 'dart:core';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:syncfusion_flutter_charts/charts.dart' hide LabelPlacement;
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:velocity_x/velocity_x.dart';


class RangeSliderScreen extends StatefulWidget {
  @override
  RangeSliderScreenState createState() => RangeSliderScreenState();
}

class RangeSliderScreenState extends State<RangeSliderScreen> {
  final List<Data> _chartData = <Data>[
    Data(x: DateTime(2003, 01, 01), y: 3.4),
    Data(x: DateTime(2004, 01, 01), y: 2.8),
    Data(x: DateTime(2005, 01, 01), y: 1.6),
    Data(x: DateTime(2006, 01, 01), y: 2.3),
    Data(x: DateTime(2007, 01, 01), y: 2.5),
    Data(x: DateTime(2008, 01, 01), y: 2.9),
    Data(x: DateTime(2009, 01, 01), y: 3.8),
    Data(x: DateTime(2010, 01, 01), y: 2.0),
  ];

  final DateTime _dateMin = DateTime(2003, 01, 01);
  final DateTime _dateMax = DateTime(2010, 01, 01);
  final SfRangeValues _dateValues =
      SfRangeValues(DateTime(2005, 01, 01), DateTime(2008, 01, 01));

  int selectedValue = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: Column(
          children: <Widget>[
            50.heightBox,
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                // ignore: missing_required_param
                child: SfRangeSelector(
                  min: _dateMin,
                  max: _dateMax,
                  initialValues: _dateValues,
                  labelPlacement: LabelPlacement.betweenTicks,
                  interval: 1,
                  dateIntervalType: DateIntervalType.years,
                  dateFormat: DateFormat.y(),
                  showTicks: true,
                  showLabels: true,
                  child: SizedBox(
                    child: SfCartesianChart(
                      margin: EdgeInsets.zero,
                      primaryXAxis: DateTimeAxis(
                        minimum: _dateMin,
                        maximum: _dateMax,
                        isVisible: false,
                      ),
                      primaryYAxis: NumericAxis(isVisible: false, maximum: 4),
                      series: <SplineAreaSeries<Data, DateTime>>[
                        SplineAreaSeries<Data, DateTime>(
                            dataSource: _chartData,
                            xValueMapper: (Data sales, int index) => sales.x,
                            yValueMapper: (Data sales, int index) => sales.y)
                      ],
                    ),
                    height: 200,
                  ),
                ),
              ),
            ),
            100.heightBox,
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                // ignore: missing_required_param
                child: SfSliderTheme(
                  data: SfSliderThemeData(
                    tooltipBackgroundColor: Color(0xFF001132),
                  ),
                  child: SfSlider(
                    value: selectedValue,
                    min: 0,
                    max: 500,
                    activeColor: Color(0xFF001132),
                    inactiveColor: Color(0xFFF0FDF1),
                    labelPlacement: LabelPlacement.betweenTicks,
                    interval: 100,
                    showTicks: false,
                    showLabels: false,
                    enableTooltip: true,
                    tooltipShape: const SfPaddleTooltipShape(),
                    shouldAlwaysShowTooltip: true,
                    tooltipTextFormatterCallback:
                        (dynamic actualValue, String formattedText) {
                      int vals = double.tryParse(formattedText)!.round();
                      if (vals != null) {
                        return '\$$vals';
                      } else {
                        return '\$$formattedText';
                      }
                    },
                    onChanged: (value) {
                     print('Slider Value $value');
                     setState(() {
                       int vals = double.tryParse(value.toString())!.round();
                       if (vals != null) {
                         selectedValue = vals;
                       }
                     });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/// Storing the spline series data points.
class Data {
  /// Initialize the instance of the [Data] class.
  Data({required this.x, required this.y});

  /// Spline series x points.
  final DateTime x;

  /// Spline series y points.
  final double y;
}