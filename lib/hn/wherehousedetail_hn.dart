import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gtw/models/warehousehn_model.dart';
import 'package:gtw/utility/my_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WarehouseHN extends StatefulWidget {
  final WarehouseModel warehouseModel;
  const WarehouseHN({Key? key, required this.warehouseModel}) : super(key: key);

  @override
  _WarehouseHNState createState() => _WarehouseHNState();
}

class _WarehouseHNState extends State<WarehouseHN> {
  WarehouseModel? warehouseModels;
  String? id, yearid, status, statusC, typename, idperson, iddebss;
  String? personid, positionid, depsubsubid, fullname;

  @override
  void initState() {
    warehouseModels = widget.warehouseModel;
    id = warehouseModels!.WAREHOUSE_ID;
    status = 'Approve'; // เห็นชอบ
    statusC = 'Disapprove'; // ไม่เห็นชอบ
    super.initState();
 
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Row(
          children: [
            Text('เลขที่  '),
            Text(warehouseModels!.WAREHOUSE_REQUEST_CODE),
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
                          'ปีงบ  ',
                          style: MyConstant().h3back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            warehouseModels!.WAREHOUSE_BUDGET_YEAR,
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
                          'วันที่  ',
                          style: MyConstant().h3back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            warehouseModels!.WAREHOUSE_DATE_WANT,
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
                          'ผู้แจ้งขอซื้อ/ขอจ้าง  ',
                          style: MyConstant().h3back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            warehouseModels!.WAREHOUSE_SAVE_HR_NAME,
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
                          'เหตุผลที่ขอเบิก  ',
                          style: MyConstant().h3back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Text(
                            warehouseModels!.WAREHOUSE_REQUEST_BUY_COMMENT,
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
                          'หน่วยงานที่ร้องขอ  ',
                          style: MyConstant().h3back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            warehouseModels!.WAREHOUSE_SAVE_HR_DEP_SUB_NAME,
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
                          'คลัง  ',
                          style: MyConstant().h3back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            warehouseModels!.INVEN_NAME,
                            style: MyConstant().h3dark(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 2, primary: Colors.green),
                          onPressed: () {
                            EditData();
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
                          CancelData();
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

  Future<Null> EditData() async {
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
      ),
    );
  }

  Future<Null> CancelData() async {
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
    String id = warehouseModels!.WAREHOUSE_ID;
    print(id);
    String url =
        '${MyConstant.domain}/gtw/api/hn_warehouse_update.php?isAdd=true&WAREHOUSE_ID=$id&WAREHOUSE_STATUS=$status';

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
    String id = warehouseModels!.WAREHOUSE_ID;
    print(id);
    String url =
        '${MyConstant.domain}/gtw/api/hn_warehouse_cancel.php?isAdd=true&WAREHOUSE_ID=$id&WAREHOUSE_STATUS=$statusC';
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
