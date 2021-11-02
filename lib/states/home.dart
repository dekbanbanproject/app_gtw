
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String>? menus;
  List<Color>? colors;

  int indexBody = 0;
  bool? adminBool;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {

    super.initState();
   
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      // appBar: AppBar(
      //   iconTheme: IconThemeData(color: Colors.black),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   actions: [adminBool == null ? SizedBox() : adminBool! ? HeadAdmin() : HeadUser()],
      // ),

      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
         
        ),
      ),
      body: SafeArea(
        child: Container(
          // height: 50,
        
        ),
      ),
    );
  }

 
}
