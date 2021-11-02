import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gtw/models/gleave_model.dart';
import 'package:gtw/utility/my_constant.dart';
import 'package:gtw/utility/my_dialog.dart';



class GleavePage extends StatefulWidget {

  const GleavePage({Key? key}) : super(key: key);

  @override
  _GleavePageState createState() => _GleavePageState();
}

class _GleavePageState extends State<GleavePage> {

  bool loadStatus = true; // load data jason
  bool status = true; // ถ้ามีข้อมูล
  List<GleaveModel> gleavemodels = [];
  List<GleaveModel> searchGleavemodels = [];
  // final debouncer = Debouncer(millisecond: 500);

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
            // searchGleavemodels = gleavemodels;
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
        title: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Text(
              'รายการรอเห็นชอบ ',
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Kanit-Regular',
                  color: Colors.white),
            ),
          ),
          title: Text(
            'วันที่',
            style: TextStyle(
                fontSize: 15, fontFamily: 'Kanit-Regular', color: Colors.white),
          ),
          trailing: Text(
            'รายละเอียด',
            style: TextStyle(
                fontSize: 15, fontFamily: 'Kanit-Regular', color: Colors.white),
          ),
        ),
      ),
      body: Stack(
        children: [
          loadStatus ? buildsHowdata() : builNongleaveheader(),
        ],
      ),
    );
  }

  Center builNongleaveheader() {
    return Center(
      child: Text(
        'ยังไม่มีข้อมูลผู้ลา',
        style: TextStyle(
            fontSize: 17, fontFamily: 'Kanit-Regular', color: Colors.black),
      ),
    );
  }

  Widget buildsHowdata() => ListView.builder(
      itemCount: gleavemodels.length,
      itemBuilder: (context, index) {
        // Text(gleaveHeader[index].lEADERPERSONID),
        return Card(
          elevation: 2,
          child: ListTile(
            leading: Text(
              gleavemodels[index].LEAVE_PERSON_FULLNAME,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Kanit-Regular',
                  color: Colors.black),
            ), //leading Column 1
             title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  gleavemodels[index].LEAVE_DATE_BEGIN,
                  //  gleaveModels[index].lEAVEDATEBEGIN,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Kanit-Regular',
                      color: Colors.redAccent),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(5.0),
                //   child: Text(
                //     'ถึง',
                //     style: TextStyle(
                //         fontSize: 14,
                //         fontFamily: 'Kanit-Regular',
                //         color: Colors.black),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 5),
                //   child: Text(
                //     gleavemodels[index].LEAVE_DATE_END,
                //     style: TextStyle(
                //         fontSize: 14,
                //         fontFamily: 'Kanit-Regular',
                //         color: Colors.redAccent),
                //   ),
                // ),
              ],
            ), 
             //title Column 2
            // ignore: deprecated_member_use
            trailing: RaisedButton(
              //trailing Column 3
              color: Colors.blueAccent,
              onPressed: () {},
              child: Text(
                'ทำรายการ',
                style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Kanit-Regular',
                    color: Colors.white),
              ),
            ),
          ),
        );
      });
}

//   Container buildSearch() {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: TextFormField(
//         onChanged: (value) {
//           debouncer.run(() {
//             setState(() {
//               searchGleavemodels = gleavemodels
//                   .where((element) => element.LEAVE_PERSON_FULLNAME
//                       .toLowerCase()
//                       .contains(value.toLowerCase()))
//                   .toList();
//             });
//           });
//         },
//         decoration: InputDecoration(
//           prefixIcon: Icon(Icons.search),
//           border: OutlineInputBorder(),
//         ),
//       ),
//     );
//   }
// }

// ListView buildListView() {
//   // var searchgleavemodels;
//   return ListView.builder(
//     padding: EdgeInsets.symmetric(horizontal: 16),
//     shrinkWrap: true,
//     physics: ScrollPhysics(),
//     itemCount: searchgleavemodels.length,
//     itemBuilder: (context, index) => GestureDetector(
//       onTap: () => Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => GleaveDetail(
//               gleavemodel: searchgleavemodels[index],
//             ),
//           )),
//       child: Card(
//           child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Text(searchgleavemodels[index].LEAVE_PERSON_FULLNAME),
//       )),
//     ),
//   );
// }

// class Debouncer {
//   final int millisecond;
//   Timer? timer;
//   VoidCallback? callback;

//   Debouncer({required this.millisecond});

//   run(VoidCallback callback) {
//     if (null != timer) {
//       timer!.cancel();
//     }
//     timer = Timer(Duration(milliseconds: millisecond), callback);
//   }
// }


