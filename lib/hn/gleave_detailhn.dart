import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gtw/models/gleave_model.dart';
import 'package:gtw/utility/my_constant.dart';
import 'package:gtw/utility/my_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GleaveDetail extends StatefulWidget {
  final GleaveModel gleaveModel;
  const GleaveDetail({Key? key, required this.gleaveModel}) : super(key: key);

  @override
  _GleaveDetailState createState() => _GleaveDetailState();
}

class _GleaveDetailState extends State<GleaveDetail> {
  GleaveModel? gleaveModel; //ตัวแปรคนละตัวกับข้างบน
  String? id, yearid, status, statusC, typename, idperson, iddebss, sendworkid;
  String? personid, positionid, depsubsubid, fullname;

  @override
  void initState() {
    super.initState();
    gleaveModel = widget
        .gleaveModel; ///// *******  อันเดียวกันกับข้างบนสุด  ********************////
    id = gleaveModel!.ID;
    print(id);
    yearid = gleaveModel!.LEAVE_YEAR_ID;
    print(yearid);
    status = 'Approve';
    statusC = 'Disapprove';
    typename = gleaveModel!.LEAVE_TYPE_NAME;
    sendworkid = gleaveModel!.LEAVE_WORK_SEND_ID;
    print(status);

    readdatagleave();
  }

  Future<Null> readdatagleave() async {
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
        '${MyConstant.domain}/gtw/api/hn_gleave.php?isAdd=true&personid=$personid';
    await Dio().get(apireaData).then((value) async {
      if (value.toString() == 'null') {
        MyDialog().normalDialog(context, 'ไม่มีข้อมูล', 'ไม่มีการร้องขอการลา');
      } else {
        for (var item in json.decode(value.data)) {
          GleaveModel model = GleaveModel.fromMap(item);
          print('### ==>>>${model.LEAVE_PERSON_FULLNAME}');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gleaveModel!.LEAVE_PERSON_FULLNAME),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 15),
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 1, bottom: 2),
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    leading: Text(
                      'ปีงบประมาณ  ',
                      style: MyConstant().h3back(),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Text(
                        gleaveModel!.LEAVE_YEAR_ID,
                        style: MyConstant().h3dark(),
                      ),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Text(
                      'ชื่อผู้ลา  ',
                      style: MyConstant().h3back(),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Text(
                        gleaveModel!.LEAVE_PERSON_FULLNAME,
                        style: MyConstant().h3dark(),
                      ),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Text(
                      'เหตุผลการลา  ',
                      style: MyConstant().h3back(),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Text(
                        gleaveModel!.LEAVE_BECAUSE,
                        style: MyConstant().h3dark(),
                      ),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Text(
                      'สถานที่ไป  ',
                      style: MyConstant().h3back(),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Text(
                        gleaveModel!.LOCATION_NAME,
                        style: MyConstant().h3dark(),
                      ),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Text(
                      'มอบหมายงานไห้  ',
                      style: MyConstant().h3back(),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text(
                        gleaveModel!.LEAVE_WORK_SEND,
                        style: MyConstant().h3dark(),
                      ),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Text(
                      'วันที่เริ่มลา  ',
                      style: MyConstant().h3back(),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Text(
                        gleaveModel!.LEAVE_DATE_BEGIN,
                        style: MyConstant().h3dark(),
                      ),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Text(
                      'สิ้นสุดวันลา  ',
                      style: MyConstant().h3back(),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Text(
                        gleaveModel!.LEAVE_DATE_END,
                        style: MyConstant().h3dark(),
                      ),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Text(
                      'สิ้นสุดวันลา  ',
                      style: MyConstant().h3back(),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Text(
                        gleaveModel!.LEAVE_TYPE_NAME,
                        style: MyConstant().h3dark(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 2, primary: Colors.green),
                          onPressed: () {
                            EditGleave();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'เห็นชอบ',
                              style: MyConstant().h2White(),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 2,
                          primary: Colors.redAccent,
                        ),
                        onPressed: () {
                          CancelGleave();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'ไม่เห็นชอบ',
                            style: MyConstant().h2White(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<Null> EditGleave() async {
    showDialog(
      context: (context),
      builder: (context) => AlertDialog(
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(child: ShowImage(path: MyConstant.img2)),
                Text(
                  'ต้องการเห็นชอบใช่หรือไม่ ?',
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Kanit-Regular',
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SizedBox(child: ShowImage(path: MyConstant.img2)),
                  RaisedButton(
                    color: Colors.lightBlue,
                    onPressed: () {
                      Navigator.pop(context);
                      UpdateStatus();
                    },
                    child: Text(
                      "   ใช่   ",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Kanit-Regular',
                          color: Colors.white),
                    ),
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      " ยกเลิก ",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Kanit-Regular',
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // content: Text('Succes'),
        // actions: [
        //   // ignore: deprecated_member_use
        //   RaisedButton(
        //     color: Colors.lightBlue,
        //     onPressed: () {
        //       Navigator.pop(context);
        //       UpdateStatus();
        //     },
        //     child: Text(
        //       "   ใช่   ",
        //       style: TextStyle(
        //           fontSize: 17,
        //           fontFamily: 'Kanit-Regular',
        //           color: Colors.white),
        //     ),
        //   ),
        //   // ignore: deprecated_member_use
        //   RaisedButton(
        //     color: Colors.red,
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     child: Text(
        //       " ยกเลิก ",
        //       style: TextStyle(
        //           fontSize: 17,
        //           fontFamily: 'Kanit-Regular',
        //           color: Colors.white),
        //     ),
        //   ),
        // ],
      ),
    );
  }

  Future<Null> CancelGleave() async {
    showDialog(
      context: (context),
      builder: (context) => AlertDialog(
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(child: ShowImage(path: MyConstant.img2)),
                  Text(
                    'ไม่เห็นชอบใช่หรือไม่ ?',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Kanit-Regular',
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(child: ShowImage(path: MyConstant.img2)),
                RaisedButton(
                  color: Colors.lightBlue,
                  onPressed: () {
                    Navigator.pop(context);
                    CancelStatus();
                  },
                  child: Text(
                    "   ใช่   ",
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Kanit-Regular',
                        color: Colors.white),
                  ),
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  color: Colors.red,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    " ยกเลิก ",
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Kanit-Regular',
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> UpdateStatus() async {
    String id = gleaveModel!.ID;
    print(id);
    String url =
        '${MyConstant.domain}/gtw/api/hn_gleave_update.php?isAdd=true&ID=$id&LEAVE_YEAR_ID=$yearid&LEAVE_STATUS_CODE=$status&HR_DEPARTMENT_SUB_SUB_ID=$iddebss&LEAVE_WORK_SEND_ID=$sendworkid';

    await Dio().get(url).then((value) {
      if (value.toString() == 'true') {
        print(value);
        Navigator.pop(context);
        // readdatagleave();
      } else {
        Navigator.pop(context);
      }
    });
  }

  Future<Null> CancelStatus() async {
    String id = gleaveModel!.ID;
    print(id);
    String url =
        '${MyConstant.domain}/gtw/api/hn_gleave_cancel.php?isAdd=true&ID=$id&LEAVE_YEAR_ID=$yearid&LEAVE_STATUS_CODE=$statusC';
    await Dio().get(url).then((value) {
      if (value.toString() == 'true') {
        print(value);
        Navigator.pop(context);
      } else {
        Navigator.pop(context);
      }
    });
  }
}
