import 'package:flutter/material.dart';
import 'package:pkhos/states/advertise.dart';
import 'package:pkhos/utility/my_constant.dart';
import 'package:pkhos/widgets/show_signout.dart';
import 'package:pkhos/widgets/show_title.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  Widget currentWidget = AdvertisePage();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 232, 240),
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Ver.670305',
              style: MyConstant().h1whit17(),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Color.fromARGB(255, 250, 240, 245),
        // elevation: 0,
        // shape: BeveledRectangleBorder(
        //   borderRadius: BorderRadius.circular(20.0),
        //   side: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
          
        // ),
      ),
      bottomNavigationBar: BottomAppBar(
          notchMargin: 5.0,
          shape: CircularNotchedRectangle(),
          color: Colors.lightBlue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  )
                ]),
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.only(top: 10.0, right: 20.0, bottom: 10.0),
              //   child: Column(mainAxisSize: MainAxisSize.min, children: [
              //     Icon(
              //       Icons.home,
              //       color: Colors.white,
              //     ),
              //     Text(
              //       "Setting",
              //       style: TextStyle(color: Colors.white),
              //     )
              //   ]),
              // ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, bottom: 10.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(color: Colors.white),
                  )
                ]),
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.only(top: 10.0, right: 20.0, bottom: 10.0),
              //   child: Column(mainAxisSize: MainAxisSize.min, children: [
              //     Icon(
              //       Icons.home,
              //       color: Colors.white,
              //     ),
              //     Text(
              //       "Menu",
              //       style: TextStyle(color: Colors.white),
              //     )
              //   ]),
              // )
            ],
          )),
      // drawer: Drawer(
      //   child: ShowSignOut(),
      // ),
      drawer: Drawer(
        child: Stack(
          children: [
            ShowSignOut(),
            Column(
              children: [
                UserAccountsDrawerHeader(accountName: null, accountEmail: null),
                buildAdvertisePagemenu(),
                buildLeavemenu(),
                buildMeetingroommenu(),
                buildCarmenu(),
                buildAssetmenu(),
                buildSuppliesmenu(),
                buildWhereHousemenu(),
              ],
            ),
          ],
        ),
      ),
      // body: currentWidget);
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
