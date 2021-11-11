import 'dart:convert';

// import 'package:charts_flutter/flutter.dart';
// import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_charts/flutter_charts.dart' as charts;
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:gtw/models/gleave_model.dart';
// import 'package:flutter_charts/flutter_charts.dart';
// import 'package:gtw/models/gleave_model.dart';
import 'package:gtw/utility/my_constant.dart';
// import 'package:gtw/utility/my_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class DashboardHN extends StatefulWidget {
  const DashboardHN({Key? key}) : super(key: key);

  @override
  _DashboardHNState createState() => _DashboardHNState();
}

class _DashboardHNState extends State<DashboardHN> {
  List<GleaveModel> gleavemodels = [];
  late List<GleaveModel> _chart;
  late TooltipBehavior _tooltipBehavior;

  Map<String, double> dataMap = {
    "Flutter ": 5,
    "Php ": 10,
    "Phython ": 7,
    "Go ": 6,
    "Vue ": 3
  };

  @override
  void initState() {
    // _chart = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
    // _chart = getData() as List<GleaveModel>;
    getData();
  }

  Future<Null> getData() async {
    String apireaData =
        '${MyConstant.domain}/gtw/api/hn_gleave_chart.php?isAdd=true';
    await Dio().get(apireaData).then((value) {
      for (var item in json.decode(value.data)) {
        GleaveModel model = GleaveModel.fromMap(item);
        print('### ==>>ประเภทการลา ==>>${model.LEAVE_TYPE_CODE}');
        setState(() {
          gleavemodels.add(model);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              decoration: new BoxDecoration(boxShadow: [
                new BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  blurRadius: 20.0,
                  spreadRadius: 0.0, //extend the shadow
                  offset: Offset(
                    5.0, // Move to right 10  horizontally
                    5.0, // Move to bottom 10 Vertically
                  ),
                ),
              ]),
              height: 300.0,
              child: Card(
                margin: const EdgeInsets.all(8.0),
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                shadowColor: Colors.black,
                child: PieChart(
                  dataMap: dataMap,
                  chartRadius: MediaQuery.of(context).size.width / 1.7,
                  legendOptions: LegendOptions(),
                  chartValuesOptions:
                      ChartValuesOptions(showChartValuesInPercentage: true),
                ),
              ),
            ),
            Container(
              height: 300.0,
              decoration: new BoxDecoration(boxShadow: [
                new BoxShadow(
                  color: Colors.grey.withOpacity(.5),
                  blurRadius: 20.0,
                  spreadRadius: 0.0, //extend the shadow
                  offset: Offset(
                    5.0, // Move to right 10  horizontally
                    5.0, // Move to bottom 10 Vertically
                  ),
                ),
              ]),
              child: Card(
                margin: const EdgeInsets.all(8.0),
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: PieChart(
                  dataMap: dataMap,
                  chartRadius: MediaQuery.of(context).size.width / 1.7,
                  legendOptions: LegendOptions(),
                  chartType: ChartType.ring,
                  chartValuesOptions:
                      ChartValuesOptions(showChartValuesInPercentage: true),
                ),
              ),
            )
          ],
        ),
      ),
    );

  }
}


