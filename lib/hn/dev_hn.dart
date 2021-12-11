import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gtw/hn/devhn_detail.dart';
import 'package:gtw/models/devhn_model.dart';
import 'package:gtw/utility/my_constant.dart';
import 'package:gtw/utility/my_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DevHN extends StatefulWidget {
  const DevHN({Key? key}) : super(key: key);

  @override
  _DevHNState createState() => _DevHNState();
}

class _DevHNState extends State<DevHN> {
  List<DevhnModel> devhnmodels = [];
  List<DevhnModel> searchdevhnmodels = [];
  final debouncer = Debouncer(millisecond: 500);
  bool loadStatus = true;
  String? personid, positionid, depsubsubid, fullname;

  @override
  void initState() {
    super.initState();
    readdatadevhn();
  }

  Future<Null> readdatadevhn() async {
    if (devhnmodels.length != 0) {
      devhnmodels.clear();
    } else {}
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
    String apireaData =
        '${MyConstant.domain}/api/hn_dev.php?isAdd=true&personid=$personid';
    await Dio().get(apireaData).then((value) async {
      if (value.toString() == 'null') {
        MyDialog().normalDialog(context, 'ไม่มีข้อมูล', 'ไม่มีการร้องขอการลา');
      } else {
        for (var item in json.decode(value.data)) {
          DevhnModel model = DevhnModel.fromMap(item);
          print('### ==>>>${model.BOOK_NUM}');

          setState(() {
            devhnmodels.add(model);
            searchdevhnmodels = devhnmodels;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: devhnmodels.length == 0
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'ประชุม/อบรม/ดูงาน',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent.shade700),
                    ),
                  ),
                  builSearch(),
                  buildListView(),
                ],
              ),
            ),
    );
  }

  Container builSearch() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: TextFormField(
        onChanged: (value) {
          debouncer.run(() {
            setState(() {
              searchdevhnmodels = devhnmodels
                  .where((element) => element.RECORD_HEAD_USE
                      .toLowerCase()
                      .contains(value.toLowerCase()))
                  .toList();
            });
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          labelText: 'ค้นหาชื่อเรื่อง',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 6),
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: searchdevhnmodels.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          MaterialPageRoute(
            builder: (context) => DevHN_Detail(
              devhnmodel: searchdevhnmodels[index],
            ),
          );          
           Navigator.pushNamed(context, '/hn').then((value) => readdatadevhn());
        },

        // onTap: () => Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => DevHN_Detail(
        //       devhnmodel: searchdevhnmodels[index],
        //     ),
        //   ),
        // ),

        // Navigator.push(context, route).then((value) => readdatadevhn());
        // onTap: () => Navigator.pushNamed(context, routeName),
        child: Padding(
          padding: const EdgeInsets.only(left: 0, right: 0, top: 3, bottom: 3),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                width: 2.0,
                color: Colors.blueAccent,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Card(
              elevation: 2,
              child: ListTile(
                leading: Text(
                  searchdevhnmodels[index].RECORD_HEAD_USE,
                  style: MyConstant().h4dark(),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [],
                ),
                trailing: Text(
                  searchdevhnmodels[index].DATE_GO,
                  style: MyConstant().h4dark(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Debouncer {
  final int millisecond;
  Timer? timer;
  VoidCallback? callback;

  Debouncer({required this.millisecond});

  run(VoidCallback callback) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(Duration(milliseconds: millisecond), callback);
  }
}
