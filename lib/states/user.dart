import 'package:flutter/material.dart';
import 'package:gtw/widgets/show_signout.dart';


class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue.shade400,
        title: Text('ผู้ใช้งานทั่วไป'),      
      ),
     drawer: Drawer(
        child: ShowSignOut(),
      ),
    );
  }

 
}
