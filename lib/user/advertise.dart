import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
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
  List<Color>? colors;
  List<Widget> widgets = [
    const DashboardHN(),
    const DevbookHn(),
    const GleaveHn(),
    const DevHN(),
    const SuppliesHn(),
    const WhereHouseHn(),
  ];

  int indexBody = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    menus = MyConstant.menus;
    colors = MyConstant.colors;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // body: Center(
      //     // child: Text('data'),
      //     ),
      // floatingActionButton: AnimatedFloatingActionButton(
      //   colorEndAnimation: Colors.orange.shade300,
      //   colorStartAnimation: Colors.blue,
      //   animatedIconData: AnimatedIcons.menu_home,
      //   fabButtons: [
      //     builddashboardHN(),
      //   ],
      // ),
      body: SafeArea(
        // child: Container(
        //   height: 50.0,
        //   width: 150.0,
        //   decoration: BoxDecoration(
        //     boxShadow: [
        //       BoxShadow(
        //           offset: Offset(0.0, 20.0),
        //           blurRadius: 30.0,
        //           color: Colors.black12)
        //     ],
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(22.0),
        //   ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            builListview(), widgets[indexBody],
            // Container(
            //   height: 50.0, width: 110.0,
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(
            //         vertical: 12.0, horizontal: 12.0),
            //     // child: builListview(),
            //     child: Text(
            //       'data',
            //       style: Theme.of(context)
            //           .textTheme
            //           .button!
            //           .apply(color: Colors.white),
            //     ),
            //   ),
            //   decoration: BoxDecoration(
            //     color: Colors.orangeAccent,
            //     borderRadius: BorderRadius.only(
            //       bottomLeft: Radius.circular(95.0),
            //       topLeft: Radius.circular(95.0),
            //       bottomRight: Radius.circular(200.0),
            //     ),
            //   ),
            //   SizedBox(
            //     // height: 30,
            //     ),
            // builListview(),
            // widgets[indexBody],
            // ),
            // Icon(
            //   Icons.dashboard,
            //   size: 30.0,
            // )
          ],
        ),
      ),
      // ),
    );
  }

  builddashboardHN() {
    return Container(
      child: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GleaveHn()),
          );
          // Navigator.pushNamedAndRemoveUntil(
          //     context, MyConstant.routeHnPage, (route) => false);
        },
        focusColor: Colors.orange,
        focusElevation: 16.0,
        heroTag: 'add',
        // child: Text('Dashboard'),
        child: Icon(
          Icons.dashboard,
          color: Colors.white,
        ),
      ),
    );
  }

  Container builListview() {
    return Container(
      height: 50,
      child: Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: menus!.length,
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  indexBody = index;
                });
              },
              // child: indexBody == 0 ? buildCardNo(index): buildCard(index)
              child: buildCard(index)),
        ),
      ),
    );
  }

  Padding buildCard(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 40.0,
              // width: 150.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0.0, 20.0),
                      blurRadius: 90.0,
                      color: Colors.black12),
                ],
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Center(
                  child: Text(
                         menus![index],
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            
              // child: Card(
              //   color: colors![index],
              //   child: Padding(
              //     padding:
              //         const EdgeInsets.only(left: 15, top: 8, right: 15, bottom: 8),
              //     child: Center(
              //       child: Text(
              //         menus![index],
              //         style: TextStyle(
              //             fontSize: 15,
              //             color: Colors.white,
              //             fontWeight: FontWeight.bold),
              //       ),
              //     ),
              //   ),
            ),
          ),        
        ],
      ),
    );
  }

  Padding buildCardNo(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Card(
        color: Colors.red,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, top: 8, right: 15, bottom: 8),
          child: Center(
            child: Text(
              menus![index],
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
