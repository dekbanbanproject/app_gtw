import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtw/hn/gleave_detailhn.dart';
import 'package:gtw/models/gleave_model.dart';
import 'package:gtw/utility/my_constant.dart';
import 'package:gtw/utility/my_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GleaveHn extends StatefulWidget {
  const GleaveHn({Key? key}) : super(key: key);

  @override
  _GleaveHnState createState() => _GleaveHnState();
}

class _GleaveHnState extends State<GleaveHn> {
  List<GleaveModel> gleavemodels = [];
  List<GleaveModel> searchgleavemodels = [];
  final debouncer = Debouncer(millisecond: 500);
  bool loadStatus = true;
  String? personid, positionid, depsubsubid, fullname;

  @override
  void initState() {
    super.initState();
    readdatagleave();
  }

  Future<Null> readdatagleave() async {
    if (gleavemodels.length != 0) {
      gleavemodels.clear();
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
        '${MyConstant.domain}/gtw/api/hn_gleave.php?isAdd=true&personid=$personid';
    await Dio().get(apireaData).then((value) async {
      if (value.toString() == 'null') {
        MyDialog().normalDialog(context, 'ไม่มีข้อมูล', 'ไม่มีการร้องขอการลา');
      } else {
        for (var item in json.decode(value.data)) {
          GleaveModel model = GleaveModel.fromMap(item);
          print('### ==>>>${model.LEAVE_PERSON_FULLNAME}');

          setState(() {
            gleavemodels.add(model);
            searchgleavemodels = gleavemodels;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: gleavemodels.length == 0
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'เห็นชอบการลา',
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
              searchgleavemodels = gleavemodels
                  .where((element) => element.LEAVE_PERSON_FULLNAME
                      .toLowerCase()
                      .contains(value.toLowerCase()))
                  .toList();
            });
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          labelText: 'ค้นหาชื่อ-นามสกุล',
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
      itemCount: searchgleavemodels.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GleaveDetail(
              gleaveModel: searchgleavemodels[index],
            ),
          ),
        ),
        // onTap: () {
        //   MaterialPageRoute(
        //     builder: (context) => GleaveDetail(
        //       gleaveModel: searchgleavemodels[index],
        //     ),
        //   );
        //   // Navigator.pushNamed(context, MyConstant.routeTGleaveDetailPage).then((value) => readdatagleave());

        // },
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
                  searchgleavemodels[index].LEAVE_PERSON_FULLNAME,
                  style: MyConstant().h4dark(),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      searchgleavemodels[index].LEAVE_DATE_END,
                      style: MyConstant().h4dark(),
                    ),
                    // Text(
                    // searchgleavemodels[index].LEAVE_DATE_BEGIN,
                    // style: MyConstant().h4dark(),
                    // ),
                    //  Text(
                    //   ' -',
                    //   style: MyConstant().h4dark(),
                    // ),
                  ],
                ),
                // trailing: Text(
                //   searchgleavemodels[index].LEAVE_DATE_END,
                //   style: MyConstant().h4dark(),
                // ),
                trailing: IconButton(
                  onPressed: () => GleaveDetail(
                    gleaveModel: searchgleavemodels[index],
                  ),
                  // onPressed: () {
                  //   MaterialPageRoute(
                  //     builder: (context) => GleaveDetail(
                  //       gleaveModel: searchgleavemodels[index],
                  //     ),
                  //   );
                  //  Navigator.pushNamed(context, MyConstant.routeTGleaveDetailPage).then((value) => readdatagleave());
                  // },
                  icon: Icon(
                    Icons.edit,
                    size: 24,
                    color: Colors.orange,
                  ),
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





