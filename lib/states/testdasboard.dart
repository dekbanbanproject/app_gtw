import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gtw/utility/my_constant.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;

class TestDashboard extends StatefulWidget {
  const TestDashboard({Key? key}) : super(key: key);

  @override
  _TestDashboardState createState() => _TestDashboardState();
}

class _TestDashboardState extends State<TestDashboard> {
  List<Dbogleave> fromJson(String strJson) {
    final data = jsonDecode(strJson);
    return List<Dbogleave>.from(data.map((i) => Dbogleave.fromMap(i)));
  }

  // late final bool animate;

  List<Dbogleave> dbgleave = [];

  @override
  void initState() {
    getDatagleave().then((value) => dbgleave = value);
    super.initState();
    // getData();
  }

  Future<List<Dbogleave>> getDatagleave() async {
    List<Dbogleave> list = [];
    final response = await http.get(
        Uri.parse('${MyConstant.domain}/gtw/api/hn_gleave.php?isAdd=true'));
    if (response.statusCode == 200) {
      list = fromJson(response.body);
      // setState(() {
      // Dbgleave.add();
      // });
    }
    return list;
  }

  static List<charts.Series<Dbogleave, String>> chartData(
      List<Dbogleave> data) {
    return [
      charts.Series<Dbogleave, String>(
          id: "Dbgleave",
          domainFn: (Dbogleave g, _) => g.LEAVE_DATE_BEGIN,
          measureFn: (Dbogleave g, _) => g.LEAVE_STATUS_CODE,
          data: data)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chart'),
      ),
      body: Center(
        child: Container(
          height: 600,
          child: charts.BarChart(
            chartData(dbgleave),
          ),
        ),
      ),
    );
  }
}

class Dbogleave {
  final String LEAVE_DATE_BEGIN;
  // final String LEAVE_STATUS_CODE;
  final int LEAVE_STATUS_CODE;

  Dbogleave({required this.LEAVE_DATE_BEGIN, required this.LEAVE_STATUS_CODE});

  factory Dbogleave.fromMap(Map<String, dynamic> map) {
    return Dbogleave(
        LEAVE_DATE_BEGIN: map["LEAVE_DATE_BEGIN"],
        // LEAVE_STATUS_CODE: map["LEAVE_STATUS_CODE"]);
        LEAVE_STATUS_CODE: int.parse(map["LEAVE_STATUS_CODE"]));
    //  return Dbogleave(LEAVE_DATE_BEGIN: map["LEAVE_DATE_BEGIN"],LEAVE_TYPE_CODE: int.parse(map["LEAVE_TYPE_CODE"]));
  }
}
