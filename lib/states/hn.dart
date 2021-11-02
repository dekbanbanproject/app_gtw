import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:gtw/user/advertise.dart';
import 'package:gtw/utility/my_constant.dart';
import 'package:gtw/widgets/show_signout.dart';
import 'package:gtw/widgets/show_title.dart';

class HnPage extends StatefulWidget {
  const HnPage({Key? key}) : super(key: key);

  @override
  _HnPageState createState() => _HnPageState();
}

class _HnPageState extends State<HnPage> {
  Widget currentWidget = AdvertisePage();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          // leading: Row(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(left: 3),
          //       child: Text(
          //         'หัวหน้า',
          //         style: MyConstant().h1whit17(),
          //       ),
          //     ),
          //   ],
          // ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyConstant().version
              // Text('หัวหน้า'),
              // Text('Ver.641015',style: MyConstant().h1whit17(),),
            ],
          ),
        ),
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
                  // buildMeetingroommenu(),
                  // buildCarmenu(),
                  // buildAssetmenu(),
                  // buildSuppliesmenu(),
                  // buildWhereHousemenu(),
                ],
              ),
            ],
          ),
        ),
        body: currentWidget);
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
