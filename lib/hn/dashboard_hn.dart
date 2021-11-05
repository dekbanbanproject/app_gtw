import 'dart:convert';

// import 'package:charts_flutter/flutter.dart';
// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_charts/flutter_charts.dart' as charts;
import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:flutter_charts/flutter_charts.dart';
// import 'package:gtw/models/gleave_model.dart';
import 'package:gtw/utility/my_constant.dart';
// import 'package:gtw/utility/my_dialog.dart';
import 'package:http/http.dart' as http;
// import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';

class DashboardHN extends StatefulWidget {
  const DashboardHN({Key? key}) : super(key: key);

  @override
  _DashboardHNState createState() => _DashboardHNState();
}

class _DashboardHNState extends State<DashboardHN> {
  List<Dbogleave> fromJson(String strJson) {
    final data = jsonDecode(strJson);
    return List<Dbogleave>.from(data.map((i) => Dbogleave.fromMap(i))).toList();
  }

  // late final bool animate;

  List<Dbogleave> Dbgleave = [];

  @override
  void initState() {
    // getDatagleave().then((value) => Dbgleave = value);
    super.initState();
    // getDatagleave();
  }

  // Future<Null> getData() async {
  //   String apireaData = '${MyConstant.domain}/gtw/api/hn_gleave.php?isAdd=true';
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

  // Future<void> checkAuthen() async {
  //   var response = await http.post(
  //       Uri.parse("${MyConstant.domain}/gtw/api/signin.php?isAdd=true"),
  //       body: ({}));
  //   if (response.statusCode == 200) {
  //     Navigator.pushNamedAndRemoveUntil(
  //         context, MyConstant.routeHnPage, (route) => false);
  //   } else {}
  // }

  Future<List<Dbogleave>> getDatagleave() async {
    List<Dbogleave> list = [];
    var response = await http.get(
        Uri.parse('${MyConstant.domain}/gtw/api/hn_gleave.php?isAdd=true'));
    if (response.statusCode == 200) {
      list = fromJson(response.body);
      setState(() {
        // Dbgleave.add();
      });
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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body:SingleChildScrollView(
//         child: Column(
//           children: [
//             charts.BarChart(
//               chartData(Dbgleave),
//               animate: true,
//               // vertical: false,
//             )
//           ],
//         ),
//       // ),
//     ));
//   }
// }
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             charts.BarChart(
//               chartData(Dbgleave),
//               animate: true,
//               vertical: false,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('data'),
          ],
        ),
      ),
      // body: Center(),
      // floatingActionButton: AnimatedFloatingActionButton(
      //   colorEndAnimation: Colors.orange.shade300,
      //   colorStartAnimation: Colors.blue,
      //   animatedIconData: AnimatedIcons.menu_home,
      //   fabButtons: [
      //     builddashboardHN(),
      //   ],
      // ),
    );
  }
}
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
