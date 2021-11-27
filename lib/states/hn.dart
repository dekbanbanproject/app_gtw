import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtw/hn/dashboard_hn.dart';
import 'package:gtw/hn/dev_hn.dart';
import 'package:gtw/hn/devbook_hn.dart';
import 'package:gtw/hn/gleave_hn.dart';
import 'package:gtw/hn/supplies_hn.dart';
import 'package:gtw/hn/wherehouse_hn.dart';

import 'package:gtw/states/advertise.dart';
import 'package:gtw/utility/my_constant.dart';
import 'package:gtw/widgets/show_signout.dart';
import 'package:gtw/widgets/show_title.dart';
import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';

class HnPage extends StatefulWidget {
  const HnPage({Key? key}) : super(key: key);

  @override
  _HnPageState createState() => _HnPageState();
}

class _HnPageState extends State<HnPage> {
  final ChartScroller chartScroller = ChartScroller();
  List<Widget> itemData = [];

  final List<Widget> screentTab = [
    const DashboardHN(),
    const DevbookHn(),
    const GleaveHn(),
    const DevHN(),
    const SuppliesHn(),
    const WhereHouseHn(),
  ];

  int _index = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // Widget currentWidget = AdvertisePage();
  Widget currentWidget = DashboardHN();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldKey,
        drawer: Drawer(
          child: Stack(
            children: [
              ShowSignOut(),
              Column(
                children: [
                  UserAccountsDrawerHeader(
                      accountName: null, accountEmail: null),
                  buildAdvertisePagemenu(),
                  buildLeavemenu(),
                  buildperDevmenu(),
                  buildAccountmenu(),
                  buildgestHousemenu(),
                  buildBookmenu(),
                ],
              ),
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(
                  Icons.menu_open,
                  color: Colors.orange,
                ),
              );
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [MyConstant().version],
          ),
        ),

        body: Container(
          height: size.height,
          child: Column(
            children: [
              // const SizedBox(
              //   height: 1,
              // ),
              // chartScroller, /// <<<=== ย้ายตัวนี้ไปไว้หน้า Dashboard
              currentWidget
              // Expanded(
              //   child: ListView.builder(
              //     itemBuilder: (context, index) {
              //       return currentWidget;
              //     },
              //   ),
              // ),
            ],
          ),
        ),
        // body: currentWidget,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.orange,
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 20,
                      onPressed: () {
                        setState(() {
                          currentWidget = DashboardHN();
                          _index = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.dashboard,
                            color: _index == 0 ? Colors.orange : Colors.grey,
                          ),
                          // Text(
                          //   'Dashboard',
                          //   style: TextStyle(
                          //       color: _index == 0
                          //           ? Colors.lightBlueAccent
                          //           : Colors.grey),
                          // )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 20,
                      onPressed: () {
                        setState(() {
                          currentWidget = DevbookHn();
                          _index = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.book,
                            color: _index == 1 ? Colors.orange : Colors.grey,
                          ),
                          // Text(
                          //   'หนังสือราชการ',
                          //   style: TextStyle(
                          //       color: _index == 1
                          //           ? Colors.lightBlueAccent
                          //           : Colors.grey),
                          // )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 20,
                      onPressed: () {
                        setState(() {
                          currentWidget = GleaveHn();
                          _index = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.assignment_ind_rounded,
                            //  Icons.calendar_today,
                            color: _index == 3 ? Colors.orange : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 20,
                      onPressed: () {
                        setState(() {
                          currentWidget = DevHN();
                          _index = 4;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.emoji_transportation_outlined,
                            color: _index == 4 ? Colors.orange : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 20,
                      onPressed: () {
                        setState(() {
                          currentWidget = SuppliesHn();
                          _index = 5;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.card_travel_sharp,
                            color: _index == 5 ? Colors.orange : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 20,
                      onPressed: () {
                        setState(() {
                          currentWidget = WhereHouseHn();
                          _index = 6;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.store,
                            color: _index == 6 ? Colors.orange : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        //  floatingActionButton: AnimatedFloatingActionButton(
        //   colorEndAnimation: Colors.orange.shade300,
        //   colorStartAnimation: Colors.blue,
        //   animatedIconData: AnimatedIcons.menu_home,
        //   fabButtons: [
        //     builddashboardHN(),
        //     builddevbookHn(),
        //   ],
        // ),
      ),
    );
  }

  builddashboardHN() {
    return Container(
      child: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => GleaveHn(

          //   )),
          // );
          Navigator.pushNamedAndRemoveUntil(
              context, MyConstant.routeHnPage, (route) => false);
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

  builddevbookHn() {
    return Container(
      child: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => GleaveHn(

          //   )),
          // );
          Navigator.pushNamedAndRemoveUntil(
              context, MyConstant.routeHnPage, (route) => false);
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

  ListTile buildAdvertisePagemenu() {
    return ListTile(
      onTap: () {
        setState(() {
          currentWidget = AdvertisePage();
          Navigator.pop(context);
        });
      },
      leading: Icon(
        Icons.quick_contacts_dialer_outlined,
        size: 30,
        color: Colors.orange,
      ),
      title: ShowTitle(
        title: 'ประชาสัมพันธ์',
        textStyle: MyConstant().h2dark(),
      ),
    );
  }

  ListTile buildLeavemenu() {
    return ListTile(
      //  onPressed: () => Navigator.pushNamed(context, '/reset'),
      onTap: () {
        Navigator.pushNamed(context, '/gleave');
      },
      leading: Icon(
        Icons.quick_contacts_dialer_outlined,
        size: 30,
        color: Colors.orange,
      ),
      title: ShowTitle(
        title: 'ข้อมูลการลา',
        textStyle: MyConstant().h2dark(),
      ),
    );
  }

  ListTile buildperDevmenu() {
    return ListTile(
      onTap: () {
        setState(() {
          // indexWidget = 2;
          Navigator.pop(context);
        });
      },
      leading: Icon(
        Icons.quick_contacts_dialer_outlined,
        size: 30,
        color: Colors.orange,
      ),
      title: ShowTitle(
        title: 'ประชุม/อบรม/ดูงาน',
        textStyle: MyConstant().h2dark(),
      ),
    );
  }

  ListTile buildAccountmenu() {
    return ListTile(
      onTap: () {
        setState(() {});
      },
      leading: Icon(
        Icons.quick_contacts_dialer_outlined,
        size: 30,
        color: Colors.orange,
      ),
      title: ShowTitle(
        title: 'เงินเดือนค่าตอบแทน',
        textStyle: MyConstant().h2dark(),
      ),
    );
  }

  ListTile buildgestHousemenu() {
    return ListTile(
      onTap: () {
        setState(() {});
      },
      leading: Icon(
        Icons.quick_contacts_dialer_outlined,
        size: 30,
        color: Colors.orange,
      ),
      title: ShowTitle(
        title: 'สวัสดิการบ้านพัก',
        textStyle: MyConstant().h2dark(),
      ),
    );
  }

  ListTile buildBookmenu() {
    return ListTile(
      onTap: () {
        setState(() {});
      },
      leading: Icon(
        Icons.quick_contacts_dialer_outlined,
        size: 30,
        color: Colors.orange,
      ),
      title: ShowTitle(
        title: 'งานสารบรรณ',
        textStyle: MyConstant().h2dark(),
      ),
    );
  }

  ListTile buildMeetingroommenu() {
    return ListTile(
      onTap: () {
        setState(() {});
      },
      leading: Icon(
        Icons.quick_contacts_dialer_outlined,
        size: 30,
        color: Colors.orange,
      ),
      title: ShowTitle(
        title: 'งานบริการห้องประชุม',
        textStyle: MyConstant().h2dark(),
      ),
    );
  }

  ListTile buildCarmenu() {
    return ListTile(
      onTap: () {
        setState(() {});
      },
      leading: Icon(
        Icons.quick_contacts_dialer_outlined,
        size: 30,
        color: Colors.orange,
      ),
      title: ShowTitle(
        title: 'งานบริการยานพาหนะ',
        textStyle: MyConstant().h2dark(),
      ),
    );
  }

  ListTile buildAssetmenu() {
    return ListTile(
      onTap: () {
        setState(() {});
      },
      leading: Icon(
        Icons.quick_contacts_dialer_outlined,
        size: 36,
        color: Colors.orange,
      ),
      title: ShowTitle(
        title: 'งานบริหารทรัพย์สิน',
        textStyle: MyConstant().h2dark(),
      ),
    );
  }

  ListTile buildSuppliesmenu() {
    return ListTile(
      onTap: () {
        setState(() {});
      },
      leading: Icon(
        Icons.quick_contacts_dialer_outlined,
        size: 36,
        color: Colors.orange,
      ),
      title: ShowTitle(
        title: 'งานพัสดุ',
        textStyle: MyConstant().h2dark(),
      ),
    );
  }

  ListTile buildWhereHousemenu() {
    return ListTile(
      onTap: () {
        setState(() {});
      },
      leading: Icon(
        Icons.quick_contacts_dialer_outlined,
        size: 36,
        color: Colors.orange,
      ),
      title: ShowTitle(
        title: 'คลังวัสดุ',
        textStyle: MyConstant().h2dark(),
      ),
    );
  }
}

class ChartScroller extends StatelessWidget {
  const ChartScroller();

  @override
  Widget build(BuildContext context) {
    final double chartHeight = MediaQuery.of(context).size.height * 0.2;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          children: [
            Container(
              width: 150,
              margin: EdgeInsets.only(right: 20),
              height: chartHeight,
              decoration: BoxDecoration(
                color: Colors.orange.shade400,
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Official Bฺook /\nmonth',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '20 itms',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 150,
              margin: EdgeInsets.only(right: 20),
              height: chartHeight,
              decoration: BoxDecoration(
                color: Colors.blue.shade400,
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Leave System /\nmonth',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '12 itms',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 150,
              margin: EdgeInsets.only(right: 20),
              height: chartHeight,
              decoration: BoxDecoration(
                color: Colors.purpleAccent.shade400,
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Meeting, Training /\nmonth',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '24 itms',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 150,
              margin: EdgeInsets.only(right: 20),
              height: chartHeight,
              decoration: BoxDecoration(
                color: Colors.greenAccent.shade400,
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Purchase,\n Supplies /\nmonth',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                      Text(
                      '14 itms',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class chartScroller extends StatelessWidget {
//   // const chartScroller({ Key? key }) : super(key: key);
//   const chartScroller();

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
