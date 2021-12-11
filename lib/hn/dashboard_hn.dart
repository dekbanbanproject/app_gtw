import 'dart:async';
import 'dart:convert';

// import 'package:charts_flutter/flutter.dart';
// import 'package:dio/dio.dart';
// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_charts/flutter_charts.dart' as charts;
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:gtw/models/chartsupreq_model.dart';
import 'package:gtw/models/gleave_model.dart';
// import 'package:gtw/models/gleavechart_model.dart';
import 'package:gtw/models/suppliescharthn_model.dart';
// import 'package:flutter_charts/flutter_charts.dart';
// import 'package:gtw/models/gleave_model.dart';
import 'package:gtw/utility/my_constant.dart';
// import 'package:gtw/utility/my_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:pie_chart/pie_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class DashboardHN extends StatefulWidget {
  const DashboardHN({Key? key}) : super(key: key);

  @override
  _DashboardHNState createState() => _DashboardHNState();
}

class _DashboardHNState extends State<DashboardHN> {
  // List<SupplieschartHnModel> fromJson(String strJson) {
  //   final data = jsonDecode(strJson);
  //   return List<SupplieschartHnModel>.from(
  //       data.map((i) => SupplieschartHnModel.fromMap(i)));
  // }
  List<Zchart> fromJson(String strJson) {
    final data = jsonDecode(strJson);
    return List<Zchart>.from(data.map((i) => Zchart.fromMap(i))).toList();
  }

  static final List<Zchart> zchart = [];

  Future<List<Zchart>> getDatazchart() async {
    List<Zchart> zchartlist = [];
    final response =
        await http.get(Uri.parse("${MyConstant.domain}/api/zchart.php"));
    if (response.statusCode == 200) {
      // zchartlist = fromJson(response.body);
      String zchartlist = response.body;
      print('$zchartlist');
    }
    return zchartlist;
  }

  List<charts.Series<Zchart, String>> chartDatazchart = [
      charts.Series(
          id: 'Zchart',
          domainFn: (Zchart s, __) => s.date,
          measureFn: (Zchart s, __) => s.sale,
          data: zchart)
    ];
  // }

  // static List<charts.Series<Zchart, String>> chartDatazchart(List<Zchart> datas) {
  //   return [
  //     charts.Series<Zchart, String>(
  //         id: 'Zchart',
  //         domainFn: (Zchart s, __) => s.date,
  //         measureFn: (Zchart s, __) => s.sale,
  //         data: datas)
  //   ];
  // }

  List<SupplieschartHnModel> supchartmodels = [];
  List<GleaveModel> gleavemodels = [];
  String? personid, positionid, depsubsubid, fullname, countgleave;
  // bool coungleave = true;
  // late GleaveModel gleaveModels;

  Future<List<SupplieschartHnModel>> getData() async {
    List<SupplieschartHnModel> list = [];

    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      fullname = preferences.getString('fullname');
      personid = preferences.getString('personid');
      positionid = preferences.getString('positionid');
      depsubsubid = preferences.getString('depsubsubid');
      print('###personid ==>>> $personid');
      print('###positionid ==>>> $positionid');
      print('###depsubsubid ==>>> $depsubsubid');
    });

    // final res = await http.get(Uri.parse(
    //     "${MyConstant.domain}/gtw/api/hn_gleave_count.php?isAdd=true&LEADER_PERSON_ID=$personid"));
    // var url = Uri.https('${MyConstant.domain}',
    //     "/gtw/api/supplieschart.php.php?isAdd=true&AGREE_HR_ID=$personid");
    // var res = await http.get(url);

    final res = await http.get(
        Uri.parse("${MyConstant.domain}/api/supplieschart.php?isAdd=true"));

    if (res.statusCode == 200) {
      // var jsonResponse = jsonDecode(res.body);
      // print(jsonResponse);
      String list = res.body;
      //  list = fromJson(lists);

      // print('$list');
    }
    return list;
  }

  Map<String, double> datachartMap = {
    "Flutter ": 5,
    "Php ": 10,
    "Phython ": 7,
    "Go ": 6,
    "Vue ": 3
  };

  // Future<List<GleaveModel>> getDatagleave() async {
  //   List<GleaveModel> listgleave = [];
  //   final res = await http.get(Uri.parse(
  //       "${MyConstant.domain}/gtw/api/hn_gleave_count.php?isAdd=true"));
  //   if (res.statusCode == 200) {
  //     String listgleave = res.body;
  //     // list = fromJson(res.body);
  //     print('$listgleave');
  //   }
  //   return listgleave;
  // }

// Future<List<GleaveModel>> getDatagleave() async {
//     String apireaData =
//         '${MyConstant.domain}/gtw/api/hn_gleave_count.php?isAdd=true';
//     await Dio().get(apireaData).then((value) {
//       for (var item in json.decode(value.data)) {
//         GleaveModel model = GleaveModel.fromMap(item);
//          print('### ==>>>${model.PRICE_PER_UNIT}');
//        setState(() {
//           gleavemodels.add(model);
//        });

//       }
//     });

//   }
  // Future<Null> getDatagleave() async {
  //   if (gleavemodels.length != 0) {
  //     gleavemodels.clear();
  //   } else {}
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     fullname = preferences.getString('fullname');
  //     personid = preferences.getString('personid');
  //     positionid = preferences.getString('positionid');
  //     depsubsubid = preferences.getString('depsubsubid');
  //     print('###personid ==>>> $personid');
  //     print('###positionid ==>>> $positionid');
  //     print('###depsubsubid ==>>> $depsubsubid');
  //   });
  //   String apireaData =
  //       '${MyConstant.domain}/gtw/api/hn_gleave_count.php?isAdd=true&LEADER_PERSON_ID=$personid';
  //   await Dio().get(apireaData).then((value) async {
  //     print('Total ====> $value');
  //     var result = json.decode(value.data);
  //     print('result ===> $result');

  //     for (var item in result) {
  //       print('resultnnnnn ===> $item');

  //       setState(() {
  //         // countgleave = fromJson(item);
  //         //  print('resultnn000 ===> $countgleave');
  //       });
  //     }
  //   });
  // }

  static List<charts.Series<SupplieschartHnModel, String>> chartData(
      List<SupplieschartHnModel> data) {
    return [
      charts.Series<SupplieschartHnModel, String>(
          id: 'asset_article',
          domainFn: (SupplieschartHnModel s, __) => s.DATE_WANT,
          measureFn: (SupplieschartHnModel s, __) => s.BUDGET_SUM,
          data: data)
    ];
  }

  late List<GleaveModel> _chart;
  // late TooltipBehavior _tooltipBehavior;
  final ChartScroller chartScroller = ChartScroller();
  final Chartdonut _chartdonut = Chartdonut();

  Map<String, double> dataMap = {
    "Flutter ": 5,
    "Php ": 10,
    "Phython ": 7,
    "Go ": 6,
    "Vue ": 3
  };

  @override
  void initState() {
    // getDatazchart().then((value) => zchart = value);
    // getDataarticle().then((value) => supchartmodels = value);
    getData().then((value) => supchartmodels = value);
    // _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        body: Column(
          children: [
            chartScroller,
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Row(
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
                          height: 350.0,
                          width: 350.0,
                          child: Card(
                            margin: const EdgeInsets.all(8.0),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            shadowColor: Colors.black,
                            child: charts.BarChart(
                              chartDatazchart,
                              // animate: true,
                            ),
                          ),
                        ),
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
                          height: 350.0,
                          width: 350.0,
                          child: Card(
                            margin: const EdgeInsets.all(8.0),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            shadowColor: Colors.black,
                            child: PieChart(
                              dataMap: dataMap,
                              chartRadius:
                                  MediaQuery.of(context).size.width / 1.7,
                              legendOptions: LegendOptions(),
                              chartValuesOptions: ChartValuesOptions(
                                  showChartValuesInPercentage: true),
                            ),
                          ),
                        ),
                        Container(
                          height: 350.0,
                          width: 350.0,
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
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PieChart(
                                dataMap: dataMap,
                                chartRadius:
                                    MediaQuery.of(context).size.width / 2.0,
                                legendOptions: LegendOptions(),
                                chartType: ChartType.ring,
                                chartValuesOptions: ChartValuesOptions(
                                    showChartValuesInPercentage: true),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Chartdonut extends StatelessWidget {
  const Chartdonut();

  @override
  Widget build(BuildContext context) {
    final double chartHeight = MediaQuery.of(context).size.height * 0.2;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          children: [
            Container(
              width: 150,
              margin: EdgeInsets.only(right: 10),
              height: chartHeight,
              decoration: BoxDecoration(
                color: Colors.orange.shade400,
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChartScroller extends StatelessWidget {
  const ChartScroller();

  @override
  Widget build(BuildContext context) {
    final double chartHeight = MediaQuery.of(context).size.height * 0.2;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          children: [
            Container(
              width: 150,
              margin: EdgeInsets.only(right: 20),
              height: chartHeight,
              decoration: BoxDecoration(
                color: Colors.orange.shade400,
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Official Bฺook /\nmonth',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      // gleaveModels == null ? '20 itms'
                      '20 itms',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 150,
              margin: EdgeInsets.only(right: 20),
              height: chartHeight,
              decoration: BoxDecoration(
                color: Colors.blue.shade400,
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Leave System /\nmonth',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '12 itms  ',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 150,
              margin: EdgeInsets.only(right: 20),
              height: chartHeight,
              decoration: BoxDecoration(
                color: Colors.purpleAccent.shade400,
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Meeting, Training /\nmonth',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '24 itms',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 150,
              margin: EdgeInsets.only(right: 20),
              height: chartHeight,
              decoration: BoxDecoration(
                color: Colors.greenAccent.shade400,
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Purchase,\n Supplies /\nmonth',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '14 itms',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Zchart {
  final String date;
  final int sale;
  Zchart({
    required this.date,
    required this.sale,
  });

  factory Zchart.fromMap(Map<String, dynamic> map) {
    return Zchart(date: map['date'], sale: int.parse(map['sale']));
  }
}
