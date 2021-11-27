import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gtw/hn/wherehousedetail_hn.dart';
import 'package:gtw/models/warehousehn_model.dart';
import 'package:gtw/utility/my_constant.dart';
import 'package:gtw/utility/my_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WhereHouseHn extends StatefulWidget {
  const WhereHouseHn({ Key? key }) : super(key: key);

  @override
  _WhereHouseHnState createState() => _WhereHouseHnState();
}

class _WhereHouseHnState extends State<WhereHouseHn> {
   List<WarehouseModel> warehousemodels = [];
  List<WarehouseModel> searchwarehousemodels = [];
  final debouncer = Debouncer(millisecond: 500);
  bool loadStatus = true;
  String? personid, positionid, depsubsubid, fullname;

   @override
  void initState() {
    super.initState();
    readdata();
  }

   Future<Null> readdata() async {
    if (warehousemodels.length != 0) {
      warehousemodels.clear();
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
        '${MyConstant.domain}/gtw/api/hn_warehoue.php?isAdd=true&WAREHOUSE_AGREE_HR_ID=$personid';
    await Dio().get(apireaData).then((value) async {
      if (value.toString() == 'null') {
        MyDialog().normalDialog(context, 'ไม่มีข้อมูล', 'ไม่มีการร้องขอการลา');
      } else {
        for (var item in json.decode(value.data)) {
          WarehouseModel model = WarehouseModel.fromMap(item);
          print('### ==>>>${model.WAREHOUSE_REQUEST_CODE}');

          setState(() {
            warehousemodels.add(model);
            searchwarehousemodels = warehousemodels;
          });
        }
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
     return Expanded(
      child: warehousemodels.length == 0
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'เห็นชอบคลังวัสดุ',
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
              searchwarehousemodels = warehousemodels
                  .where((element) => element.WAREHOUSE_REQUEST_CODE
                      .toLowerCase()
                      .contains(value.toLowerCase()))
                  .toList();
            });
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          labelText: 'ค้นหารหัส',
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
      itemCount: searchwarehousemodels.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WarehouseHN(
              warehouseModel: searchwarehousemodels[index],
            ),
          ),
        ),
      
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
                  searchwarehousemodels[index].WAREHOUSE_REQUEST_CODE,
                  style: MyConstant().h4dark(),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      searchwarehousemodels[index].WAREHOUSE_DATE_WANT,
                      style: MyConstant().h4dark(),
                    ),
                   
                  ],
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