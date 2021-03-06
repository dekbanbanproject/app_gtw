import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gtw/models/gleave_model.dart';
import 'package:gtw/utility/my_constant.dart';
import 'package:gtw/utility/my_dialog.dart';
import 'package:gtw/widgets/show_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GleaveDetail extends StatefulWidget {
   final GleaveModel gleaveModeledit;
  const GleaveDetail({Key? key,required this.gleaveModeledit}) : super(key: key);
  // final SuppliesHnModels suppliesModel;
  // const SuppliesHN({Key? key, required this.suppliesModel}) : super(key: key);

  @override
  _GleaveDetailState createState() => _GleaveDetailState();
}

class _GleaveDetailState extends State<GleaveDetail> {
  GleaveModel? gleaveModel; //ตัวแปรคนละตัวกับข้างบน
  TextEditingController nameController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  String? fullname;
  bool load = true;
  bool? haveData;
  List<GleaveModel> gleaveModelslist = [];
  String? id, yearid, status, statusC, typename, idperson, iddebss, sendworkid;
  String? personid, positionid, depsubsubid;

  @override
  void initState() {
    super.initState();
      gleaveModel = widget
        .gleaveModeledit; ///// *******  อันเดียวกันกับข้างบนสุด  ********************////
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

    String fullname = preferences.getString('fullname')!;
    String personid = preferences.getString('personid')!;
    String positionid = preferences.getString('positionid')!;
    String depsubsubid = preferences.getString('depsubsubid')!;
    print('###personid ==>>> $personid');
    print('###positionid ==>>> $positionid');
    print('###depsubsubid ==>>> $depsubsubid');

    String apireaData =
        '${MyConstant.domain}/api/hn_gleave.php?isAdd=true&personid=$personid';
    await Dio().get(apireaData).then((value) async {
      if (value.toString() == 'null') {
        //ไม่มีข้อมูล
        setState(() {
          load = false;
          haveData = false;
        });
      } else {
        // มีข้อมูล
        for (var item in json.decode(value.data)) {
          GleaveModel model = GleaveModel.fromMap(item);
          // nameController.text = gleaveModel!.LEAVE_PERSON_FULLNAME;    ///// ใช้ในกรณี TexyFormFild
          // String fullname = model.LEAVE_PERSON_FULLNAME;
          print('### ==>>>${model.LEAVE_PERSON_FULLNAME}');
          setState(() {
            load = false;
            haveData = true;
            gleaveModelslist.add(model);
            // fullname = gleaveModel!.LEAVE_PERSON_FULLNAME;
            // print('### ==>>>$gleaveModel');
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange,       
          title: Text(gleaveModel!.LEAVE_PERSON_FULLNAME)        
          ),
      // body: load
      //     ? CircularProgressIndicator()
      //     : haveData!
      //         ? ListView.builder(
      //             itemCount: gleaveModels.length,
      //             itemBuilder: (context, index) =>
      //                 Text(gleaveModels[index].LEAVE_YEAR_ID),
      //           )
      //         : Text('No data'),
     
    // );
     body: Container(
        margin: EdgeInsets.only(top: 15),
       
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 3, bottom: 5),
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
                          'ปีงบประมาณ  ',
                          style: MyConstant().h4back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            gleaveModel!.LEAVE_YEAR_ID,
                            style: MyConstant().h5dark(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                   padding: const EdgeInsets.only(top: 3, bottom: 5),
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
                          'ชื่อผู้ลา  ',
                          style: MyConstant().h4back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            gleaveModel!.LEAVE_PERSON_FULLNAME,
                            style: MyConstant().h5dark(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
Padding(
                  padding: const EdgeInsets.only(top: 3, bottom: 5),
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
                          'เหตุผลการลา  ',
                          style: MyConstant().h4back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            gleaveModel!.LEAVE_BECAUSE,
                            style: MyConstant().h5dark(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, bottom: 5),
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
                          'สถานที่ไป  ',
                          style: MyConstant().h4back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            gleaveModel!.LOCATION_NAME,
                            style: MyConstant().h5dark(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, bottom: 5),
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
                          style: MyConstant().h4back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Text(
                            gleaveModel!.LEAVE_WORK_SEND,
                            style: MyConstant().h5dark(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                   padding: const EdgeInsets.only(top: 3, bottom: 5),
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
                          'วันที่เริ่มลา  ',
                          style: MyConstant().h4back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            gleaveModel!.LEAVE_DATE_BEGIN,
                            style: MyConstant().h5dark(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                   padding: const EdgeInsets.only(top: 3, bottom: 5),
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
                          'สิ้นสุดวันลา  ',
                          style: MyConstant().h4back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            gleaveModel!.LEAVE_DATE_END,
                            style: MyConstant().h5dark(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                   padding: const EdgeInsets.only(top: 3, bottom: 5),
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
                          'ประเภทการลา  ',
                          style: MyConstant().h4back(),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            gleaveModel!.LEAVE_TYPE_NAME,
                            style: MyConstant().h5dark(),
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

  Padding builYear() {
    return Padding(
      padding: const EdgeInsets.only(top: 3, bottom: 5),
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
              'ปีงบประมาณ  ',
              style: MyConstant().h4back(),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(
                'gggggggggggg',
                style: MyConstant().h5dark(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding builName() {
    return Padding(
      padding: const EdgeInsets.only(top: 3, bottom: 5),
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
              'ชื่อผู้ลา  ',
              style: MyConstant().h4back(),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(
                'gggggggggggg2',
                style: MyConstant().h5dark(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding builBecause() {
    return Padding(
      padding: const EdgeInsets.only(top: 3, bottom: 5),
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
              'เหตุผลการลา  ',
              style: MyConstant().h4back(),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(
                'gggggggggggg3',
                style: MyConstant().h5dark(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding builLocation() {
    return Padding(
      padding: const EdgeInsets.only(top: 3, bottom: 5),
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
              'สถานที่ไป  ',
              style: MyConstant().h4back(),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(
                'gggggggggggg4',
                style: MyConstant().h5dark(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding builWorksend() {
    return Padding(
      padding: const EdgeInsets.only(top: 3, bottom: 5),
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
              style: MyConstant().h4back(),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Text(
                'gggggggggggg5',
                style: MyConstant().h5dark(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding builDatestart() {
    return Padding(
      padding: const EdgeInsets.only(top: 3, bottom: 5),
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
              'วันที่เริ่มลา  ',
              style: MyConstant().h4back(),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(
                'gggggggggggg6',
                style: MyConstant().h5dark(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding builDateend() {
    return Padding(
      padding: const EdgeInsets.only(top: 3, bottom: 5),
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
              'สิ้นสุดวันลา  ',
              style: MyConstant().h4back(),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(
                'gggggggggggg7',
                style: MyConstant().h5dark(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding builType() {
    return Padding(
      padding: const EdgeInsets.only(top: 3, bottom: 5),
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
              'ประเภทการลา  ',
              style: MyConstant().h4back(),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(
                'gggggggggggg8',
                style: MyConstant().h5dark(),
              ),
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
        '${MyConstant.domain}/api/hn_gleave_update.php?isAdd=true&ID=$id&LEAVE_YEAR_ID=$yearid&LEAVE_STATUS_CODE=$status&HR_DEPARTMENT_SUB_SUB_ID=$iddebss&LEAVE_WORK_SEND_ID=$sendworkid';

    await Dio().get(url).then((value) {
      if (value.toString() == 'true') {
        print(value);
        Navigator.pop(context);
        // readdatagleave();
        setState(() {
          readdatagleave();
        });
      } else {
        Navigator.pop(context);
        // readdatagleave();
      }
    });
  }

  Future<Null> CancelStatus() async {
    String id = gleaveModel!.ID;
    print(id);
    String url =
        '${MyConstant.domain}/api/hn_gleave_cancel.php?isAdd=true&ID=$id&LEAVE_YEAR_ID=$yearid&LEAVE_STATUS_CODE=$statusC';
    await Dio().get(url).then((value) {
      if (value.toString() == 'true') {
        print(value);
        Navigator.pop(context);
      } else {
        Navigator.pop(context);
        // readdatagleave();
      }
    });
  }





}
