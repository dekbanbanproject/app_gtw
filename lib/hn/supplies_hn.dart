import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gtw/hn/suppliesdetail_hn.dart';
import 'package:gtw/models/supplieshn_model.dart';
import 'package:gtw/utility/my_constant.dart';
import 'package:gtw/utility/my_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SuppliesHn extends StatefulWidget {
  const SuppliesHn({Key? key}) : super(key: key);

  @override
  _SuppliesHnState createState() => _SuppliesHnState();
}

class _SuppliesHnState extends State<SuppliesHn> {
  List<SuppliesHnModels> suppliesModels = [];
  List<SuppliesHnModels> searchsuppliesModels = [];
  final debouncer = Debouncer(millisecond: 500);
  bool loadStatus = true;
  String? personid, positionid, depsubsubid, fullname;

  @override
  void initState() {
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
        '${MyConstant.domain}/gtw/api/hn_supplies.php?isAdd=true&AGREE_HR_ID=$personid';
    await Dio().get(apireaData).then((value) async {
      if (value.toString() == "null") {
        MyDialog().normalDialog(context, 'ไม่มีข้อมูล', 'ไม่มีการร้องขอ');
      } else {
        for (var item in json.decode(value.data)) {
          SuppliesHnModels model = SuppliesHnModels.fromMap(item);
          print('### ==>>>${model.SAVE_HR_NAME}');

          setState(() {
            suppliesModels.add(model);
            searchsuppliesModels = suppliesModels;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'จัดซื้อจัดจ้าง',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent.shade700),
              ),
            ),
            buildSearch(),
            buildListView(),
          ],
        ),
      ),
    );
  }

  Container buildSearch() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: TextFormField(
        onChanged: (value) {
          debouncer.run(() {
            setState(() {
              searchsuppliesModels = suppliesModels
                  .where((element) => element.REQUEST_ID
                      .toLowerCase()
                      .contains(value.toLowerCase()))
                  .toList();
            });
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          labelText: 'ค้นหาเลชที่',
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
      itemCount: searchsuppliesModels.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                SuppliesHN(suppliesModels: searchsuppliesModels[index]),
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
                  searchsuppliesModels[index].REQUEST_ID,
                  style: MyConstant().h4dark(),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      searchsuppliesModels[index].SAVE_HR_NAME,
                      style: MyConstant().h4dark(),
                    ),
                    
                  ],
                ),
                // trailing: Text(
                  // searchsuppliesModels[index].DATE_WANT,
                  // searchsuppliesModels[index].SAVE_HR_NAME,
                  // style: MyConstant().h4dark(),
                // ),
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
