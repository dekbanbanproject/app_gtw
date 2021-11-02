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
    return Scaffold(key: scaffoldKey,
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              SizedBox(
                // height: 30,
              ),
              builListview(),
              widgets[indexBody],
            ],
          ),
        ),
      ),
    );
  }

  Container builListview() {
    return Container(height: 50,
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
            child: buildCard(index)
          ),
        ),
      ),
    );
  }

  Padding buildCard(int index) {
    return Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Card(
              color: colors![index],
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, top: 8, right: 15, bottom: 8),
                child: Center(
                  child: Text(menus![index],style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
                ),
              ),
            ),
          );
  }

    Padding buildCardNo(int index) {
    return Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Card(
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, top: 8, right: 15, bottom: 8),
                child: Center(
                  child: Text(menus![index],style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
                ),
              ),
            ),
          );
  }
}
