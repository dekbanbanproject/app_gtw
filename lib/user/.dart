import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gtw/models/gleave_model.dart';
import 'package:gtw/utility/my_constant.dart';
import 'package:gtw/utility/my_dialog.dart';

import 'gleavedetail.dart';

class GleavePage extends StatefulWidget {
  const GleavePage({Key? key}) : super(key: key);

  @override
  _GleavePageState createState() => _GleavePageState();
}

class _GleavePageState extends State<GleavePage> {
  List<GleaveModel> gleavemodels = [];
  List<GleaveModel> searchgleavemodels = [];
  final debouncer = Debouncer(millisecond: 500);

  @override
  void initState() {
    super.initState();
    readdatagleave();
  }

  Future<Null> readdatagleave() async {
    String apireaData = '${MyConstant.domain}/gtw/api/gleavehn.php?isAdd=true';
    await Dio().get(apireaData).then((value) {
      if (value.toString() == 'null') {
        MyDialog().normalDialog(context, 'ไม่มีข้อมูล', 'ไม่มีการร้องขอการลา');
      } else {
        for (var item in json.decode(value.data)) {
          GleaveModel model = GleaveModel.fromMap(item);
          print('### ${model.LEAVE_PERSON_FULLNAME}');

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
                  buildSearch(),
                  buildListView(),
                ],
              ),
            ),
    );
  }

  Container buildSearch() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

ListView buildListView() {
  var searchgleavemodels;
  return ListView.builder(
    padding: EdgeInsets.symmetric(horizontal: 16),
    shrinkWrap: true,
    physics: ScrollPhysics(),
    itemCount: searchgleavemodels.length,
    itemBuilder: (context, index) => GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GleaveDetail(
              gleavemodel: searchgleavemodels[index],
            ),
          )),
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(searchgleavemodels[index].BOOK_NAME),
      )),
    ),
  );
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
