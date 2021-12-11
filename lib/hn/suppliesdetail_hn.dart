import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gtw/models/supplieshn_model.dart';
import 'package:gtw/utility/my_constant.dart';
import 'package:gtw/utility/my_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SuppliesHN extends StatefulWidget {
  final SuppliesHnModels suppliesModel;
  const SuppliesHN({Key? key, required this.suppliesModel}) : super(key: key);

  @override
  _SuppliesHNState createState() => _SuppliesHNState();
}

class _SuppliesHNState extends State<SuppliesHN> {
  SuppliesHnModels? suppliesModels;
  String? id, yearid, status, statusC, typename, idperson, iddebss;
  String? personid, positionid, depsubsubid, fullname;

  @override
  void initState() {
    suppliesModels = widget.suppliesModel;
    id = suppliesModels!.ID;
    status = 'Approve'; // เห็นชอบ
    statusC = 'Disapprove'; // ไม่เห็นชอบ
    super.initState();
    readdatasupplies();
  }

  Future<Null> readdatasupplies() async {
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
        '${MyConstant.domain}/api/hn_supplies.php?isAdd=true&AGREE_HR_ID=$personid';
    await Dio().get(apireaData).then((value) async {
      if (value.toString() == "null") {
        // MyDialog().normalDialog(context, 'ไม่มีข้อมูล', 'ไม่มีการร้องขอ');
      } else {
        for (var item in json.decode(value.data)) {
          SuppliesHnModels model = SuppliesHnModels.fromMap(item);
          print('### ==>>>${model.SAVE_HR_NAME}');

          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Row(
          children: [
            Text('เลขที่  '),
            Text(suppliesModels!.REQUEST_ID),
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
                            suppliesModels!.BUDGET_YEAR,
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
                            suppliesModels!.DATE_WANT,
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
                            suppliesModels!.SAVE_HR_NAME,
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
                          'เพื่อจัดซื้อ/ซ่อมแซม  ',
                          style: MyConstant().h3back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Text(
                            suppliesModels!.REQUEST_FOR,
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
                            suppliesModels!.SAVE_HR_DEP_SUB_NAME,
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
                          'เบอร์โทรหน่วยงาน  ',
                          style: MyConstant().h3back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            suppliesModels!.DEP_SUB_SUB_PHONE,
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
                          'บริษัทแนะนำ  ',
                          style: MyConstant().h3back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            suppliesModels!.REQUEST_VANDOR_NAME,
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
                          'หมายเหตุ  ',
                          style: MyConstant().h3back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            suppliesModels!.REQUEST_BUY_COMMENT,
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
    String id = suppliesModels!.ID;
    print(id);
    String url =
        '${MyConstant.domain}/api/hn_supplies_update.php?isAdd=true&ID=$id&STATUS=$status';

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
    String id = suppliesModels!.ID;
    print(id);
    String url =
        '${MyConstant.domain}/api/hn_supplies_cancel.php?isAdd=true&ID=$id&STATUS=$statusC';
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
