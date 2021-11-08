import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gtw/models/devhn_model.dart';
import 'package:gtw/utility/my_constant.dart';
import 'package:gtw/utility/my_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DevHN_Detail extends StatefulWidget {
  final DevhnModel devhnmodel;
  const DevHN_Detail({Key? key, required this.devhnmodel}) : super(key: key);

  @override
  _DevHN_DetailState createState() => _DevHN_DetailState();
}

class _DevHN_DetailState extends State<DevHN_Detail> {
  DevhnModel? devhnmodels;
  String? id, yearid, status, statusC, typename, idperson, iddebss, sendworkid;
  String? personid, positionid, depsubsubid, fullname;

  @override
  void initState() {
    super.initState();
    devhnmodels = widget.devhnmodel;
    id = devhnmodels!.ID;
    print(id);
    // yearid = devhnmodels!.LEAVE_YEAR_ID;
    print(yearid);
    status = 'RECEIVE'; // รับเรื่อง
    statusC = 'EDIT'; // แก้ไข
    // typename = devhnmodels!.LEAVE_TYPE_NAME;
    sendworkid = devhnmodels!.OFFER_WORK_HR_NAME;
    print(status);

    readdatadevhn();
  }

  Future<Null> readdatadevhn() async {
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
        '${MyConstant.domain}/gtw/api/hn_dev.php?isAdd=true&personid=$personid';
    await Dio().get(apireaData).then((value) async {
      if (value.toString() == 'null') {
        MyDialog().normalDialog(context, 'ไม่มีข้อมูล', 'ไม่มีการร้องขอการลา');
      } else {
        for (var item in json.decode(value.data)) {
          DevhnModel model = DevhnModel.fromMap(item);
          print('### ==>>>${model.BOOK_NUM}');

          setState(() {
            // devhnmodels.add(model);
            // searchdevhnmodels = devhnmodels;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange,
        title: Row(
          children: [
            Text('หัวข้อ  '),
            Text(devhnmodels!.RECORD_HEAD_USE),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 15),
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
            child: Column(
              children: [
                // Card(
                //   child: ListTile(
                //     leading: Text(
                //       'หัวข้อประชุม  ',
                //       style: MyConstant().h3back(),
                //     ),
                //     title: Padding(
                //       padding: const EdgeInsets.only(left: 5),
                //       child: Text(
                //         devhnmodels!.RECORD_HEAD_USE,
                //         style: MyConstant().h3dark(),
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, bottom: 3),
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
                      child: ListTile(
                        leading: Text(
                          'ระหว่างวันที่  ',
                          style: MyConstant().h3back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            devhnmodels!.DATE_GO,
                            style: MyConstant().h3dark(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                   padding: const EdgeInsets.only(top: 3, bottom: 3),
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
                      child: ListTile(
                        leading: Text(
                          'ถึงวันที่  ',
                          style: MyConstant().h3back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            devhnmodels!.DATE_GO,
                            style: MyConstant().h3dark(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                   padding: const EdgeInsets.only(top: 3, bottom: 3),
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
                      child: ListTile(
                        leading: Text(
                          'สถานที่จัดประชุม  ',
                          style: MyConstant().h3back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            devhnmodels!.LOCATION_ORG_NAME,
                            style: MyConstant().h3dark(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                   padding: const EdgeInsets.only(top: 3, bottom: 3),
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
                      child: ListTile(
                        leading: Text(
                          'ประเภทการไป  ',
                          style: MyConstant().h3back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Text(
                            devhnmodels!.RECORD_TYPE_NAME,
                            style: MyConstant().h3dark(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, bottom: 3),
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
                      child: ListTile(
                        leading: Text(
                          'ระดับ  ',
                          style: MyConstant().h3back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            devhnmodels!.RECORD_LEVEL_NAME,
                            style: MyConstant().h3dark(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                   padding: const EdgeInsets.only(top: 3, bottom: 3),
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
                      child: ListTile(
                        leading: Text(
                          'ลักษณะ  ',
                          style: MyConstant().h3back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            devhnmodels!.RECORD_GO_NAME,
                            style: MyConstant().h3dark(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, bottom: 3),
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
                      child: ListTile(
                        leading: Text(
                          'การเบิกเงิน  ',
                          style: MyConstant().h3back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            devhnmodels!.WITHDRAW_NAME,
                            style: MyConstant().h3dark(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                   padding: const EdgeInsets.only(top: 3, bottom: 3),
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
                      child: ListTile(
                        leading: Text(
                          'พาหนะเดินทาง  ',
                          style: MyConstant().h3back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            devhnmodels!.RECORD_VEHICLE_NAME,
                            style: MyConstant().h3dark(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                   padding: const EdgeInsets.only(top: 3, bottom: 3),
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
                      child: ListTile(
                        leading: Text(
                          'มอบหมายงานไห้  ',
                          style: MyConstant().h3back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            devhnmodels!.OFFER_WORK_HR_NAME,
                            style: MyConstant().h3dark(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15,bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 2, primary: Colors.green),
                          onPressed: () {
                            EditDevhn();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'รับเรื่อง',
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
                          CancelDevhn();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'ส่งกลับไปแก้ไข',
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

  Future<Null> EditDevhn() async {
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
                  'ต้องการรับเรื่องใช่หรือไม่ ?',
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
      ),
    );
  }

  Future<Null> CancelDevhn() async {
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
                    'ส่งกลับไปแก้ไขใช่หรือไม่ ?',
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
    String id = devhnmodels!.ID;
    print(id);
    String url =
        '${MyConstant.domain}/gtw/api/hn_devupdate.php?isAdd=true&ID=$id&STATUS=$status&OFFER_WORK_HR_NAME=$sendworkid';

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
    String id = devhnmodels!.ID;
    print(id);
    String url =
        '${MyConstant.domain}/gtw/api/hn_dev_cancel.php?isAdd=true&ID=$id&STATUS=$statusC&OFFER_WORK_HR_NAME=$sendworkid';

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
}
