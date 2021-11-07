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
// import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
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
  }

  // Future<Null> getData() async {
  //   String apireaData =
  //       '${MyConstant.domain}/gtw/api/hn_gleave_chart.php?isAdd=true';
  //   await Dio().get(apireaData).then((value) {
  //     for (var item in json.decode(value.data)) {
  //       GleaveModel model = GleaveModel.fromMap(item);
  //       print('### ==>>ประเภทการลา ==>>${model.LEAVE_TYPE_CODE}');
  //       setState(() {
  //         gleavemodels.add(model);
  //       });
  //     }
  //   });
  // }

  // List<GleaveModel> getChartData() {
  //   final List<GleaveModel> chartData = [
  //     // GleaveModel(LEADER_PERSON_ID: ''),
  //   ];
  //   return chartData;
  // }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(body: PieChart(
        dataMap:dataMap ,chartRadius: MediaQuery.of(context).size.width / 1.7,
      legendOptions: LegendOptions(
        // legendPosition: LegendPosition.bottom,
        ),
        chartValuesOptions: ChartValuesOptions(
          showChartValuesInPercentage:true,),
        
        // body: SfCartesianChart(
          // title: ChartTitle(text: 'HHHHHHHHHHHHHHHHHH'),
          // legend: Legend(
          //     isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
          // series: <CircularSeries>[
            // RadialBarSeries<GDPData, String>(
            // DoughnutSeries<GDPData, String>(
            // PieSeries<GDPData, String>(
                // dataSource: _chart,
                // xValueMapper: (GDPData data, _) => data.continent,
                // yValueMapper: (GDPData data, _) => data.gdp,
                // dataLabelSettings: DataLabelSettings(isVisible: true),
                //  enableTooltip: true),
                // maximumValue: 40000
                // )
          // ],
        ),
      ),
    );
      // @override
  // Widget build(BuildContext context) {
  //   return Expanded(
  //     child: Scaffold(
  //       body: SfCartesianChart(
  //         // title: ChartTitle(text: 'HHHHHHHHHHHHHHHHHH'),
  //         // legend: Legend(
  //         //     isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
  //         series: <CircularSeries>[
  //           // RadialBarSeries<GDPData, String>(
  //           // DoughnutSeries<GDPData, String>(
  //           PieSeries<GDPData, String>(
  //               // dataSource: _chart,
  //               // xValueMapper: (GDPData data, _) => data.continent,
  //               // yValueMapper: (GDPData data, _) => data.gdp,
  //               // dataLabelSettings: DataLabelSettings(isVisible: true),
  //               //  enableTooltip: true),
  //               // maximumValue: 40000
  //               )
  //         ],
  //       ),
  //     ),
  //   );

    // body: Column(
    // children: [
    //   SfCartesianChart(
    //     series: <SfCircularChart>[
    //       PieSeries<GDPData,String>(
    //         dataSource:_chart ,xValueMapper:
    //       )
    //     ],
    // title: ChartTitle(text: 'Flutter Chart'),
    //  legend: Legend(isVisible: true),
    // series: getDefaultData(),
    //  tooltipBehavior: TooltipBehavior(enable: true),
    // )
    // ],
    // ),
    // body: Center(),
    // floatingActionButton: AnimatedFloatingActionButton(
    //   colorEndAnimation: Colors.orange.shade300,
    //   colorStartAnimation: Colors.blue,
    //   animatedIconData: AnimatedIcons.menu_home,
    //   fabButtons: [
    //     builddashboardHN(),
    //   ],
    // ),
    // );
  }
}

List<GDPData> getChartData() {
  final List<GDPData> chartData = [
    GDPData('OOOO', 1500),
    GDPData('OOOAO', 1000),
    GDPData('OOOBO', 1100),
    GDPData('OOOCO', 1500),
    GDPData('OOODO', 400),
    GDPData('OOOEO', 800),
    GDPData('OOOFO', 1600),
  ];
  return chartData;
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}

// static List<LineSeries<SalesData, num>> getDefaultData() {
//    final List<SalesData> chartData = <SalesData>[
//      SalesData(DateTime(2005, 0, 1), 'India', 1.5, 21, 28, 680, 760),
//      SalesData(DateTime(2006, 0, 1), 'China', 2.2, 24, 44, 550, 880),
//      SalesData(DateTime(2007, 0, 1), 'USA', 3.32, 36, 48, 440, 788),
//      SalesData(DateTime(2008, 0, 1), 'Japan', 4.56, 38, 50, 350, 560),
//      SalesData(DateTime(2009, 0, 1), 'Russia', 5.87, 54, 66, 444, 566),
//      SalesData(DateTime(2010, 0, 1), 'France', 6.8, 57, 78, 780, 650),
//     SalesData(DateTime(2011, 0, 1), 'Germany', 8.5, 70, 84, 450, 800)
//    ];
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Dbgleave.length == 0
//           ? Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               child: Column(
//                 children: [
//                   // charts.BarChart(
//                   //   chartData(Dbgleave),
//                   //   animate: true,
//                     // vertical: false,
//                   // )
//                 ],
//               ),
//             ),
//     );
//   }
// }

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
