import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gtw/models/suppliescharthn_model.dart';
import 'package:gtw/utility/my_constant.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;

class TestDashboardS extends StatefulWidget {
  const TestDashboardS({Key? key}) : super(key: key);

  @override
  _TestDashboardSState createState() => _TestDashboardSState();
}

class _TestDashboardSState extends State<TestDashboardS> {
  List<SupplieschartHnModel> fromJson(String strJson) {
    final data = jsonDecode(strJson);
    return List<SupplieschartHnModel>.from(
        data.map((i) => SupplieschartHnModel.fromMap(i)));
  }

  List<SupplieschartHnModel> suppliesreq = [];

  Future<List<SupplieschartHnModel>> getData() async {
    List<SupplieschartHnModel> list = [];

    final res = await http.get(
        Uri.parse("${MyConstant.domain}/gtw/api/supplieschart.php?isAdd=true"));

    if (res.statusCode == 200) {
      String? list = res.body;
      // list = fromJson(res.body);

      print('$list');
    }
    return list;
  }

  static List<charts.Series<SupplieschartHnModel, String>> chartData(
      List<SupplieschartHnModel> data) {
    return [
      charts.Series<SupplieschartHnModel, String>(
          id: 'suppliesrequest',
          domainFn: (SupplieschartHnModel s, __) => s.DATE_WANT,
          measureFn: (SupplieschartHnModel s, __) => s.BUDGET_SUM,
          data: data)
    ];
  }

  @override
  void initState() {
    getData().then((value) => suppliesreq = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        // child: Text('fgffffffffff'),
        child: charts.BarChart(
          chartData(suppliesreq),
          animate: true,
        ),
      ),
    );
  }
}
