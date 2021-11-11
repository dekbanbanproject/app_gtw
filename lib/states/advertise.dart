import 'package:flutter/material.dart';
import 'package:gtw/hn/dashboard_hn.dart';
import 'package:gtw/hn/dev_hn.dart';
import 'package:gtw/hn/devbook_hn.dart';
import 'package:gtw/hn/gleave_hn.dart';
import 'package:gtw/hn/supplies_hn.dart';
import 'package:gtw/hn/wherehouse_hn.dart';
import 'package:gtw/utility/my_constant.dart';

class AdvertisePage extends StatefulWidget {
  const AdvertisePage({Key? key}) : super(key: key);

  @override
  _AdvertisePageState createState() => _AdvertisePageState();
}

class _AdvertisePageState extends State<AdvertisePage> {
  List<String>? menus;
  final List<Widget> screentTab = [
    const DashboardHN(),
    const DevbookHn(),
    const GleaveHn(),
    const DevHN(),
    const SuppliesHn(),
    const WhereHouseHn(),
  ];

  int _index = 0;
  // final PageStoreageBucket bucket = PageStoreageBucket();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    menus = MyConstant.menus;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      body: SafeArea(child: Column()),
      // body: SafeArea(
      // child: Column(
      //   // crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Container(
      //         height: 50,
      //         child: Expanded(
      //           child: ListView.builder(
      //             shrinkWrap: true,
      //             scrollDirection: Axis.horizontal,
      //             // itemCount: menus!.length,
      //             itemBuilder: (context, index) => Column(
      //               children: [
      //                 Spacer(),
      //                 Padding(
      //                   padding: EdgeInsets.only(
      //                       top: 10.0,
      //                       left: 18,
      //                       right: 18,
      //                       bottom: MediaQuery.of(context).padding.bottom),
      //                   child: Row(
      //                     children: [
      //                       Spacer(),
      //                       GestureDetector(
      //                         onTap: () {
      //                           setState(() {
      //                             _index = 0;
      //                           });
      //                         },
      //                         child: Container(
      //                           decoration: BoxDecoration(
      //                               color: _index == 0
      //                                   ? Colors.red
      //                                   : Colors.transparent,
      //                               borderRadius: BorderRadius.circular(20)),
      //                           child: Padding(
      //                             padding: const EdgeInsets.symmetric(
      //                                 vertical: 12.0, horizontal: 15),
      //                             child: Row(
      //                               children: [
      //                                 Icon(
      //                                   Icons.home,
      //                                   color: _index == 0
      //                                       ? Colors.white
      //                                       : Colors.black,
      //                                 ),
      //                                 Padding(
      //                                   padding:
      //                                       const EdgeInsets.only(left: 12.0),
      //                                   child: Text(
      //                                     'DashBoard',
      //                                     style: TextStyle(
      //                                         color: _index == 0
      //                                             ? Colors.white
      //                                             : Colors.black),
      //                                   ),
      //                                 ),
      //                               ],
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ))
      //   ],
      // ),

      //             scrollDirection: Axis.horizontal,

      // child: Column(
      //   children: [
      //     Spacer(),
      //     Padding(
      //       padding: EdgeInsets.only(
      //           top: 10.0,
      //           left: 18,
      //           right: 18,
      //           bottom: MediaQuery.of(context).padding.bottom),
      //       child: Row(
      //         children: [
      //           Spacer(),
      //           GestureDetector(
      //             onTap: () {
      //               setState(() {
      //                 _index = 0;
      //               });
      //             },
      //             child: Container(
      //               decoration: BoxDecoration(
      //                   color: _index == 0 ? Colors.red : Colors.transparent,
      //                   borderRadius: BorderRadius.circular(20)),
      //               child: Padding(
      //                 padding: const EdgeInsets.symmetric(
      //                     vertical: 12.0, horizontal: 15),
      //                 child: Row(
      //                   children: [
      //                     Icon(
      //                       Icons.home,
      //                       color: _index == 0 ? Colors.white : Colors.black,
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.only(left: 12.0),
      //                       child: Text(
      //                         'DashBoard',
      //                         style: TextStyle(
      //                             color: _index == 0
      //                                 ? Colors.white
      //                                 : Colors.black),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //           Spacer(),
      //           GestureDetector(
      //             onTap: () {
      //               setState(() {
      //                 _index = 1;
      //               });
      //             },
      //             child: Container(
      //               decoration: BoxDecoration(
      //                   color: _index == 1 ? Colors.red : Colors.transparent,
      //                   borderRadius: BorderRadius.circular(20)),
      //               child: Padding(
      //                 padding: const EdgeInsets.symmetric(
      //                     vertical: 12.0, horizontal: 15),
      //                 child: Row(
      //                   children: [
      //                     Icon(
      //                       Icons.book,
      //                       color: _index == 1 ? Colors.white : Colors.black,
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.only(left: 12.0),
      //                       child: Text(
      //                         'หนังสือราชการ',
      //                         style: TextStyle(
      //                             color: _index == 1
      //                                 ? Colors.white
      //                                 : Colors.black),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //           Spacer(),
      //           GestureDetector(
      //             onTap: () {
      //               setState(() {
      //                 _index = 2;
      //               });
      //             },
      //             child: Container(
      //               decoration: BoxDecoration(
      //                   color: _index == 2 ? Colors.red : Colors.transparent,
      //                   borderRadius: BorderRadius.circular(20)),
      //               child: Padding(
      //                 padding: const EdgeInsets.symmetric(
      //                     vertical: 12.0, horizontal: 15),
      //                 child: Row(
      //                   children: [
      //                     Icon(
      //                       Icons.person,
      //                       color: _index == 2 ? Colors.white : Colors.black,
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.only(left: 12.0),
      //                       child: Text(
      //                         'การลา',
      //                         style: TextStyle(
      //                             color: _index == 2
      //                                 ? Colors.white
      //                                 : Colors.black),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //           Spacer(),
      //           GestureDetector(
      //             onTap: () {
      //               setState(() {
      //                 _index = 3;
      //               });
      //             },
      //             child: Container(
      //               decoration: BoxDecoration(
      //                   color: _index == 3 ? Colors.red : Colors.transparent,
      //                   borderRadius: BorderRadius.circular(20)),
      //               child: Padding(
      //                 padding: const EdgeInsets.symmetric(
      //                     vertical: 12.0, horizontal: 15),
      //                 child: Row(
      //                   children: [
      //                     Icon(
      //                       Icons.book,
      //                       color: _index == 3 ? Colors.white : Colors.black,
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.only(left: 12.0),
      //                       child: Text(
      //                         'หนังสือราชการ',
      //                         style: TextStyle(
      //                             color: _index == 3
      //                                 ? Colors.white
      //                                 : Colors.black),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
      // ),
      // ),
    );
  }
}
