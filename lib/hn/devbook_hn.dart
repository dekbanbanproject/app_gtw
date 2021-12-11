import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gtw/models/book_index_model.dart';
import 'package:gtw/utility/my_constant.dart';
import 'package:gtw/utility/my_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'devbook_detailhn.dart';

class DevbookHn extends StatefulWidget {
  const DevbookHn({Key? key}) : super(key: key);

  @override
  _DevbookHnState createState() => _DevbookHnState();
}

class _DevbookHnState extends State<DevbookHn> {
  List<BookIndexModel> bookIndexModels = [];
  List<BookIndexModel> searchbookIndexModels = [];
  final debouncer = Debouncer(millisecond: 500);
  bool loadStatus = true;
  String? personid, positionid, depsubsubid, fullname;

  @override
  void initState() {
    super.initState();
    readdatabook();
  }

  Future<Null> readdatabook() async {
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
        '${MyConstant.domain}/api/hn_bookindex.php?isAdd=true&personid=$personid';
    await Dio().get(apireaData).then((value) async {
      if (value.toString() == "null") {
        MyDialog().normalDialog(context, 'ไม่มีข้อมูล', 'ไม่มีการร้องขอ');
      } else {
        for (var item in json.decode(value.data)) {
          BookIndexModel model = BookIndexModel.fromMap(item);
          print('### ==>>>${model.BOOK_NAME}');

          setState(() {
            bookIndexModels.add(model);
            searchbookIndexModels = bookIndexModels;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: bookIndexModels.length == 0
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'หนังสือราชการ',
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
              searchbookIndexModels = bookIndexModels
                  .where((element) => element.BOOK_NUMBER
                      .toLowerCase()
                      .contains(value.toLowerCase()))
                  .toList();
            });
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          labelText: 'ค้นหาเลขที่หนังสือ',
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
      itemCount: bookIndexModels.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DevbookDetailHn(bookIndexModels: searchbookIndexModels[index]),
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
                  searchbookIndexModels[index].BOOK_NUMBER,
                  style: MyConstant().h4dark(),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Text(
                    // searchbookIndexModels[index].BOOK_TYPE_NAME,
                    // style: MyConstant().h4dark(),
                    // ),
                    // Text('  '),
                  ],
                ),
                trailing: Text(
                  searchbookIndexModels[index].BOOK_DATE,
                  style: MyConstant().h4dark(),
                ),
                // trailing: IconButton(
                //   onPressed: () {},
                //   icon: Icon(
                //     Icons.edit,
                //     size: 24,
                //     color: Colors.orange,
                //   ),
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
